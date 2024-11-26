import os.path
import requests
from flask import Flask, render_template, url_for, request, session, redirect, send_file, make_response
import mysql.connector
import bcrypt
import sqlite3
import pandas as pd
import json
import datetime
import io
import re
import matplotlib.pyplot as plt
from matplotlib.backends.backend_agg import FigureCanvasAgg as FigureCanvas
import tempfile
from flask_mail import Mail, Message
import qrcode
from io import BytesIO
import requests

app = Flask(__name__)
app.config.from_object('config.Config')
app.secret_key = "super secret key"

UPLOAD_FOLDER = 'static/qr_code'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.template_filter('nl2br')
def nl2br(value):
    return re.sub(r'\n', '<br>\n', value)

#EMAIL CONFIG
app.config['MAIL_SERVER'] = 'smtp.gmail.com'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USE_TLS'] = True
app.config['MAIL_USE_SSL'] = False
app.config['MAIL_USERNAME'] = 'disantesimone94@gmail.com'
app.config['MAIL_PASSWORD'] = 'ultimate94'
app.config['MAIL_DEFAULT_SENDER'] = 'disantesimone94@gmail.com'
mail = Mail(app)

def create_db_connection():
    db_config = {
        'host': app.config['MYSQL_HOST'],
        'user': app.config['MYSQL_USER'],
        'password': app.config['MYSQL_PASSWORD'],
        'database': app.config['MYSQL_DB']
    }
    return mysql.connector.connect(**db_config)

def execute_query(query, params=None):
    connection = create_db_connection()
    cursor = connection.cursor(dictionary=True)
    if params:
        cursor.execute(query, params)
    else:
        cursor.execute(query)
    result = cursor.fetchall()
    cursor.close()
    connection.close()
    return result

def inserisci_dati(query, params=None):
    connection = create_db_connection()
    cursor = connection.cursor(dictionary=True)
    if params:
        cursor.execute(query, params)
    else:
        cursor.execute(query)
    connection.commit()
    cursor.close()
    connection.close()

connection = mysql.connector.connect(host='localhost',
                                     database='sdekjdds_parking',
                                     user='root',
                                     password='root')
cursor = connection.cursor()

def hash_password(password):
    salt = bcrypt.gensalt()
    hashed_password = bcrypt.hashpw(password.encode('utf-8'), salt)
    return hashed_password

def insert_user(conn, username, password):
    sql = """INSERT INTO users (username, hashed_password) VALUES (?, ?);"""
    try:
        cursor = conn.cursor()
        hashed_password = hash_password(password)
        cursor.execute(sql, (username, hashed_password))
        conn.commit()
    except sqlite3.Error as e:
        print(e)

def verify_password(conn, username, password):
    sql = """SELECT hashed_password FROM users WHERE username = ?;"""
    try:
        cursor = conn.cursor()
        cursor.execute(sql, (username,))
        row = cursor.fetchone()
        if row:
            stored_hashed_password = row[0]
            return bcrypt.checkpw(password.encode('utf-8'), stored_hashed_password.encode('utf-8'))
        else:
            return False
    except sqlite3.Error as e:
        print(e)
        return False

def filter_brand():
    auto = execute_query('SELECT brand FROM auto')
    brand_list = []

    for elem in auto:
        brand_list.append(elem['brand'])

    brand_set = set(brand_list)
    brand_sorted = sorted(brand_set)

    return brand_sorted

@app.route("/")
def index():
    return render_template('login.html')

#WVWZZZAAZJD161753
#api_url = "https://vin-decoder-api-europe.p.rapidapi.com/vin"
#headers = {
#    "x-rapidapi-host": "vin-decoder-api-europe.p.rapidapi.com",
#    "x-rapidapi-key": "425c9b8ec5msh136db1f7d1c3fb0p1d0809jsnec37aa970181"
#}

@app.route('/vin_decoder')
def vin_decoder():
    url = "https://vin-decoder-api-europe.p.rapidapi.com/vin"

    querystring = {"vin": "WVWZZZAAZJD161753"}

    headers = {
        "x-rapidapi-key": "425c9b8ec5msh136db1f7d1c3fb0p1d0809jsnec37aa970181",
        "x-rapidapi-host": "vin-decoder-api-europe.p.rapidapi.com"
    }

    response = requests.get(url, headers=headers, params=querystring)

    print(response.json())

@app.route('/blocked')
def blocked():
    return render_template('blocked.html')

@app.route("/login", methods=['GET', 'POST'])
def login():
    msg = ''
    session.clear()
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password'].encode('utf-8')

        cursor.execute('SELECT * FROM users WHERE email = %s', (email,))
        record = cursor.fetchone()

        if record and bcrypt.checkpw(password, record[3].encode('utf-8')):
            session['logged'] = True
            session['email'] = record[4]
            session['name'] = record[1]
            session['surname'] = record[2]
            session['user_id'] = record[0]
            session['is_admin'] = record[5]
            return redirect(url_for('home'))
        else:
            msg = 'Email/Password not correct. Try again!'

    return render_template('login.html', msg=msg)

@app.route('/send_email')
def send_email():
    text = Message(
        'Hello from Flask!',
        recipients=['steamrail94@gmail.com']
    )
    text.body = 'Questa è una email di test inviata da una applicazione Flask usando Gmail!'
    mail.send(text)
    return 'Email sent!'


@app.route("/home")
def home():
    if 'email' in session:
        auto = execute_query("""
        SELECT auto.*, types.*, status.*, parking_area.*, users.*, exit_date.exit_date
        FROM auto
        JOIN types ON auto.type_id = types.type_id
        JOIN status ON auto.status_id = status.status_id
        JOIN parking_area ON auto.area_id = parking_area.area_id
        JOIN users ON auto.user_id = users.user_id
        LEFT JOIN exit_date ON auto.auto_id = exit_date.auto_id
        WHERE exit_date IS NULL
        ORDER BY auto.auto_id ASC
        """)

        user_id = session['user_id']

        catalog = execute_query("""
        SELECT catalog
        FROM users
        WHERE user_id = %s
        """, (user_id,))

        return render_template('home.html', session=session, auto=auto, catalog=catalog[0])
    else:
        return redirect('login')

@app.route('/search_auto', methods=['GET'])
def search_auto():
    if 'email' in session:
        search_query = request.args.get('search-auto')
        search_auto = []

        if search_query:
            search_auto = execute_query("""
                SELECT auto.*, types.*, status.*, parking_area.*, users.*, exit_date.exit_date
                FROM auto
                JOIN types ON auto.type_id = types.type_id
                JOIN status ON auto.status_id = status.status_id
                JOIN parking_area ON auto.area_id = parking_area.area_id
                JOIN users ON auto.user_id = users.user_id
                LEFT JOIN exit_date ON auto.auto_id = exit_date.auto_id
                WHERE auto.model LIKE %s AND exit_date IS NULL
                ORDER BY auto.auto_id ASC
                """, ("%" + search_query + "%",))

            if search_auto:
                results = ''
            else:
                results = 'No Results'
        else:
            results = 'No Results'

        user_id = session['user_id']

        catalog = execute_query("""
            SELECT catalog
            FROM users
            WHERE user_id = %s
            """, (user_id,))
        return render_template('home.html', auto=search_auto, results=results, session=session, catalog=catalog[0])
    else:
        return redirect('login')

@app.route('/logout')
def logout():
    session.pop('loggedin', None)
    session.pop('email', None)
    return redirect(url_for('login'))

@app.route('/users')
def users():
    if 'email' in session and session['is_admin'] == 1:
        users = execute_query("""
        SELECT *
        FROM users
        """)
        return render_template('users.html', users=users)
    else:
        return redirect('home')

@app.route('/profile/<int:id>')
def profile(id):
    if 'email' in session and session['is_admin'] == 1:
        user = execute_query('SELECT * FROM users WHERE user_id = %s', (id,))
        logs = execute_query('SELECT log FROM logs WHERE user_id = %s ORDER BY log_id DESC LIMIT 15', (user[0]['user_id'],))

        return render_template('profile.html', user=user[0], logs=logs)
    else:
        return redirect('home')

@app.route('/search_users', methods=['GET'])
def search_users():
    if 'email' in session and session['is_admin'] == 1:
        search_query = request.args.get('search-users')
        search_users = []

        if search_query:
            search_users = execute_query("""
                SELECT *
                FROM users
                WHERE users.email LIKE %s
                """, ("%" + search_query + "%",))

            if search_users:
                results = ''
            else:
                results = 'No Results'
        else:
            results = 'No Results'

        return render_template('users.html', users=search_users, results=results)
    else:
        return redirect('home')

@app.route('/add_users')
def add_users():
    if 'email' in session and session['is_admin'] == 1:
        reg = request.args.get('reg')
        return render_template('add_user.html', reg=reg)
    else:
        return redirect('home')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if 'email' in session and session['is_admin'] == 1:
        if request.method == 'POST':
            name = request.form['name']
            surname = request.form['surname']
            email = request.form['email']
            password = request.form['password']
            role = int(request.form['role'])

            hashed_pwd = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())

            try:
                cursor.execute('INSERT INTO users (name, surname, password, email, is_admin) VALUES (%s, %s, %s, %s, %s)',
                               (name, surname, hashed_pwd, email, role))
                connection.commit()
                reg = 'New user registered!'
                return redirect(url_for('add_users', reg=reg))
            except mysql.connector.IntegrityError as err:
                if err.errno == 1062:
                    reg = 'Email already exists!'
                else:
                    reg = 'An error occurred. Please try again.'

                return render_template('add_user.html', reg=reg)

        return render_template('add_user.html')
    else:
        return redirect('home')


@app.route('/block', methods=['POST'])
def block():
    connection = create_db_connection()
    cursor = connection.cursor()
    user_id = request.form['user_id']
    block = request.form['block']

    block_user = """
        UPDATE users
        SET catalog = %s
        WHERE user_id = %s
        """
    cursor.execute(block_user, (block, user_id))
    connection.commit()

    cursor.close()
    connection.close()

    return redirect(url_for('profile', id=user_id))

@app.route('/unblock', methods=['POST'])
def unblock():
    connection = create_db_connection()
    cursor = connection.cursor()
    user_id = request.form['user_id']
    unblock = request.form['unblock']

    unblock_user = """
        UPDATE users
        SET catalog = %s
        WHERE user_id = %s
        """
    cursor.execute(unblock_user, (unblock, user_id))
    connection.commit()

    cursor.close()
    connection.close()

    return redirect(url_for('profile', id=user_id))

@app.route('/auto')
def auto():
    if 'email' in session and session['is_admin'] == 1:
        auto = execute_query("""
        SELECT auto.*, types.*, status.*, parking_area.*
        FROM auto
        JOIN types ON auto.type_id = types.type_id
        JOIN status ON auto.status_id = status.status_id
        JOIN parking_area ON auto.area_id = parking_area.area_id
        ORDER BY auto.auto_id ASC
        """)

        brands = filter_brand()

        return render_template('auto.html', auto=auto, brands=brands)
    else:
        return redirect('home')

@app.route('/search', methods=['GET'])
def search():
    if 'email' in session and session['is_admin'] == 1:
        brands = filter_brand()
        connection = create_db_connection()
        cursor = connection.cursor(dictionary=True)

        brand = request.args.get('brand')
        model = request.args.get('model')
        license_plate = request.args.get('license_plate')

        query = """
            SELECT *
            FROM auto
            JOIN types ON auto.type_id = types.type_id
            JOIN status ON auto.status_id = status.status_id
            JOIN parking_area ON auto.area_id = parking_area.area_id
            WHERE 1=1
        """

        filters = []
        params = []

        if brand:
            filters.append("auto.brand LIKE %s")
            params.append(f"%{brand}%")
        if model:
            filters.append("auto.model LIKE %s")
            params.append(f"%{model}%")
        if license_plate:
            filters.append("auto.license_plate LIKE %s")
            params.append(f"%{license_plate}%")

        if filters:
            query += " AND " + " AND ".join(filters)

        cursor.execute(query, tuple(params))
        result = cursor.fetchall()

        cursor.close()
        connection.close()

        return render_template('auto.html', auto=result, brands=brands)
    else:
        return redirect('home')


@app.route('/download_excel', methods=['POST'])
def download_excel():
    auto_data = request.form['auto_data']
    data_string = auto_data.replace("'", '"')
    data_list = json.loads(data_string)

    date = datetime.datetime.now()
    format_date = date.strftime('%Y-%m-%d_%H.%M.%S')

    df = pd.DataFrame(data_list)
    df_auto = df.filter(['brand', 'model', 'color', 'doors', 'type', 'status'])
    df_auto.columns = df_auto.columns.str.capitalize()

    with tempfile.NamedTemporaryFile(delete=False, suffix='.xlsx') as tmp:
        with pd.ExcelWriter(tmp.name, engine='xlsxwriter') as writer:
            df_auto.to_excel(writer, index=False, sheet_name='AutoData')

            workbook = writer.book
            worksheet = writer.sheets['AutoData']

            border_format = workbook.add_format({
                'border': 1,
                'border_color': '#000000'
            })

            format_green = workbook.add_format({
                'bg_color': '#00d208',
                'border': 1,
                'border_color': '#000000'
            })

            header_format = workbook.add_format({
                'bold': True,
                'border': 1,
                'border_color': '#000000'
            })

            correction_factor = 1.1
            for col_num, col_name in enumerate(df_auto.columns):
                max_len = len(col_name)

                for value in df_auto[col_name].astype(str):
                    max_len = max(max_len, len(value) * correction_factor)

                max_len += 4
                worksheet.set_column(col_num, col_num, max_len)

                worksheet.write(0, col_num, df_auto.columns[col_num], header_format)

                rows, cols = df_auto.shape
                for row in range(1, rows + 1):
                    if col_name == 'Model':
                        worksheet.write(row, col_num, df_auto.iloc[row - 1, col_num], format_green)
                    else:
                        worksheet.write(row, col_num, df_auto.iloc[row - 1, col_num], border_format)

        tmp_file_name = tmp.name

    return send_file(
        tmp_file_name,
        mimetype='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        as_attachment=True,
        download_name=f'auto_list-{format_date}.xlsx'
    )


@app.route('/auto_info/<int:id>')
def auto_info(id):
    if 'email' in session:
        error = request.args.get('error', '')
        auto = execute_query("""
            SELECT auto.*, types.*, status.*, parking_area.*, entry_date.entry_date, edit_date.edit_date, users.*, exit_date.exit_date
            FROM auto
            JOIN types ON auto.type_id = types.type_id
            JOIN status ON auto.status_id = status.status_id
            JOIN parking_area ON auto.area_id = parking_area.area_id
            JOIN entry_date ON auto.auto_id = entry_date.auto_id
            JOIN edit_date ON auto.auto_id = edit_date.auto_id
            JOIN users ON auto.user_id = users.user_id
            LEFT JOIN exit_date ON auto.auto_id = exit_date.auto_id
            WHERE auto.auto_id = %s
            """, (id,))

        parking = execute_query("""
                    SELECT *
                    FROM parking_area
                    """)

        status = execute_query('SELECT * FROM status')

        return render_template('auto_info.html', auto=auto[0], parking=parking, status=status, session=session, error=error, auto_id=auto[0]['auto_id'])
    else:
        return redirect('home')

@app.route('/update_parking', methods=['POST'])
def update_parking():
    connection = create_db_connection()
    cursor = connection.cursor()

    auto_id = request.form['id']
    user_id = int(session['user_id'])
    license_plate = request.form['license_plate']
    old_area_id = request.form['old_area']
    new_area_id = request.form['new_area']

    #LOG DATA
    date = datetime.datetime.now()
    format_date = date.strftime('%Y-%m-%d | %H-%M-%S')
    old_park = execute_query('SELECT * FROM parking_area WHERE auto_id = %s', (auto_id,))
    old_area = old_park[0]
    old_number = old_park[0]


    new_area = """
    UPDATE parking_area
    SET auto_id = %s
    WHERE area_id = %s
    """

    set_auto = """
    UPDATE auto
    SET area_id = %s
    WHERE auto_id = %s
    """

    set_null = """
    UPDATE parking_area
    SET auto_id = NULL
    WHERE area_id = %s
    """

    update_edit = """
    UPDATE edit_date
    SET edit_date = NOW()
    WHERE auto_id = %s
    """

    cursor.execute(new_area, (auto_id, new_area_id))
    cursor.execute(set_auto, (new_area_id, auto_id))
    cursor.execute(set_null, (old_area_id,))
    cursor.execute(update_edit, (auto_id,))
    connection.commit()

    new_park = execute_query('SELECT * FROM parking_area WHERE auto_id = %s', (auto_id,))
    new_area = new_park[0]
    new_number = new_park[0]
    log = f"{format_date}: Has changed an auto Parking Area from {old_area['letter']}{old_number['number']} to {new_area['letter']}{new_number['number']} with Plate: {license_plate}."

    insert_log = 'INSERT INTO logs (log, user_id) VALUES (%s, %s)'
    cursor.execute(insert_log, (log, user_id))
    connection.commit()

    cursor.close()
    connection.close()

    return redirect(url_for('auto_info', id=auto_id, session=session))

@app.route('/insert_area', methods=['POST'])
def insert_area():
    auto_id = request.form['id_auto']
    letter = request.form['letter']
    slot_number = int(request.form['slot_number'])

    for i in range(1,slot_number+1):
        insert = 'INSERT INTO parking_area(letter, number) VALUES(%s, %s)'
        inserisci_dati(insert,(letter.upper(), i))
    return redirect(url_for('auto_info', id=auto_id))

@app.route('/delete_area', methods=['POST'])
def delete_area():
    connection = create_db_connection()
    cursor = connection.cursor()

    auto_id = request.form['id_delete']
    delete = request.form['delete']

    cursor.execute('DELETE FROM parking_area WHERE area_id = %s', (delete,))
    connection.commit()

    cursor.close()
    connection.close()

    return redirect(url_for('auto_info', id=auto_id))

@app.route('/add_auto')
def add_auto():
    if 'email' in session:
        types = execute_query('SELECT * FROM types')
        status = execute_query('SELECT * FROM status')
        area = execute_query('SELECT * FROM parking_area')
        reg = request.args.get('reg')
        auto_id = request.args.get('auto_id')
        return render_template('add_auto.html', types=types, status=status, area=area, session=session, reg=reg, auto_id=auto_id)
    else:
        return redirect('home')

@app.route('/insert_auto', methods=['GET', 'POST'])
def insert_auto():
    if 'email' in session:
        if request.method == 'POST':
            brand = request.form['brand']
            model = request.form['model']
            color = request.form['color']
            doors = request.form['doors']
            vin = request.form['vin'].upper()
            license_plate = request.form['license_plate'].upper()
            supplier = request.form['supplier']
            type_id = int(request.form['type_id'])
            status_id = int(request.form['status_id'])
            user_id = int(session['user_id'])
            area_id = int(request.form['area_id'])
            types = execute_query('SELECT * FROM types')
            status = execute_query('SELECT * FROM status')
            area = execute_query('SELECT * FROM parking_area')

            try:
                cursor.execute('INSERT INTO auto (brand, model, color, doors, vin, license_plate, supplier, type_id, status_id, user_id, area_id) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)',
                               (brand, model, color, doors, vin, license_plate, supplier, type_id, status_id, user_id, area_id))
                connection.commit()

                auto_id = cursor.lastrowid

                update_area = """
                UPDATE parking_area
                SET auto_id = %s
                WHERE area_id = %s
                """
                insert_entry = 'INSERT INTO entry_date (entry_date, auto_id, user_id) VALUES (NOW(), %s, %s)'
                insert_edit = 'INSERT INTO edit_date (edit_date, auto_id, user_id) VALUES (NOW(), %s, %s)'

                cursor.execute(update_area, (auto_id, area_id))
                cursor.execute(insert_entry, (auto_id, user_id))
                cursor.execute(insert_edit, (auto_id, user_id))

                # LOG DATA
                date = datetime.datetime.now()
                format_date = date.strftime('%Y-%m-%d | %H-%M-%S')
                log = f'{format_date}: Has registered a new auto with License Plate {license_plate}'
                insert_log = 'INSERT INTO logs (log, user_id) VALUES (%s, %s)'
                cursor.execute(insert_log, (log, user_id))
                connection.commit()

                #GENERATE QR CODE
                data = url_for('auto_info', id=auto_id, _external=True)
                qr_img = qrcode.make(data)

                qr_filename = f"{vin}.png"
                qr_path = os.path.join(app.config['UPLOAD_FOLDER'], qr_filename)
                qr_img.save(qr_path)

                reg = 'New auto registered!'

                return render_template('add_auto.html', reg=reg, auto_id=auto_id, types=types, status=status, area=area)

            except mysql.connector.IntegrityError as err:
                if err.errno == 1062:
                    reg = 'License Plate/VIN already in use!'
                else:
                    reg = 'An error occurred. Please try again.'

                return render_template('add_auto.html', reg=reg, types=types, status=status, area=area)
        return render_template('add_auto.html')
    else:
        return redirect('home')


@app.route('/generate_qr/<int:auto_id>')
def generate_qr(auto_id):
    auto = execute_query(f"SELECT * FROM auto WHERE auto_id = {auto_id}")
    current_area = execute_query("SELECT letter, number FROM parking_area WHERE auto_id = %s", (auto_id,))

    if auto:
        data = f"Brand: {auto[0]['brand']}\nModel: {auto[0]['model']}\nVIN: {auto[0]['vin']}\nLicense Plate: {auto[0]['license_plate']}\nArea: {current_area[0]['letter']}{current_area[0]['number']}"
        qr_img = qrcode.make(data)

        buffer = BytesIO()
        qr_img.save(buffer)
        buffer.seek(0)

        return send_file(buffer, mimetype='image/png')
    else:
        return "Auto not found", 404


@app.route('/view_qr/<int:auto_id>')
def view_qr(auto_id):
    if "email" in session:
        auto = execute_query(f"SELECT * FROM auto WHERE auto_id = {auto_id}")

        if auto:
            data = url_for('auto_info', id=auto_id, _external=True)
            qr_img = qrcode.make(data)

            buffer = BytesIO()
            qr_img.save(buffer)
            buffer.seek(0)

            return send_file(buffer, mimetype='image/png')
        else:
            return "<h1>Auto not found</h1>", 404
    else:
        return redirect('home')



@app.route('/exit_auto', methods=['GET', 'POST'])
def exit_auto():
    if 'email' in session:
        connection = create_db_connection()
        cursor = connection.cursor()

        auto_id = request.form['auto-id-exit']
        user_id = request.form['user-id-exit']
        user_session = int(session['user_id'])
        license_plate = execute_query('SELECT license_plate FROM auto WHERE auto_id = %s', (auto_id,))
        plate = license_plate[0]['license_plate']

        insert_exit = 'INSERT INTO exit_date (exit_date, auto_id, user_id) VALUES (NOW(), %s, %s)'

        update_edit = """
        UPDATE edit_date
        SET edit_date = NOW()
        WHERE auto_id = %s
        """

        cursor.execute(insert_exit, (auto_id, user_id))
        cursor.execute(update_edit, (auto_id,))
        # LOG DATA
        date = datetime.datetime.now()
        format_date = date.strftime('%Y-%m-%d | %H-%M-%S')
        log = f"{format_date}: Has set an exit date for an auto with Plate: {plate}"
        insert_log = 'INSERT INTO logs (log, user_id) VALUES (%s, %s)'
        cursor.execute(insert_log, (log, user_session))
        connection.commit()

        cursor.close()
        connection.close()

        return redirect(url_for('auto_info', id=auto_id))
    else:
        return redirect('home')


@app.route('/delete_auto/<int:id>')
def delete_auto(id):
    if 'email' in session:
        connection = create_db_connection()
        cursor = connection.cursor()
        cursor.execute('DELETE FROM auto WHERE auto.auto_id = %s', (id,))
        connection.commit()
        cursor.close()
        connection.close()
    else:
        return redirect(url_for('home'))
    return redirect(url_for('auto'))

@app.route('/cancel_exit/<int:id>')
def cancel_exit(id):
    if 'email' in session:
        auto_id = id
        connection = create_db_connection()
        cursor = connection.cursor()
        cursor.execute('DELETE FROM exit_date WHERE exit_date.auto_id = %s', (id,))
        connection.commit()
        cursor.close()
        connection.close()
    else:
        return redirect(url_for('home'))
    return redirect(url_for('auto_info', id=auto_id))

@app.route('/update_status', methods=['POST'])
def update_status():
    if 'email' in session:
        connection = create_db_connection()
        cursor = connection.cursor()

        auto_id = request.form['auto-id-status']
        old_status = request.form['status']

        new_status = """
        UPDATE auto
        SET status_id = %s
        WHERE auto_id = %s
        """

        update_edit = """
        UPDATE edit_date
        SET edit_date = NOW()
        WHERE auto_id = %s
        """

        cursor.execute(new_status, (old_status, auto_id))
        cursor.execute(update_edit, (auto_id,))
        connection.commit()

        cursor.close()
        connection.close()

        return redirect(url_for('auto_info', id=auto_id))
    else:
        return redirect('home')

@app.route('/update_plate', methods=['POST'])
def update_plate():
    connection = create_db_connection()
    cursor = connection.cursor()

    auto_id = request.form['auto-id-plate']
    new_plate = request.form['edit-plate'].upper()
    error = ''

    update_plate = """
    UPDATE auto
    SET license_plate = %s
    WHERE auto_id = %s
    """

    update_edit = """
    UPDATE edit_date
    SET edit_date = NOW()
    WHERE auto_id = %s
    """

    try:
        cursor.execute(update_plate, (new_plate, auto_id))
        cursor.execute(update_edit, (auto_id,))
        connection.commit()

        return redirect(url_for('auto_info', id=auto_id, error=error))

    except mysql.connector.IntegrityError as err:
        connection.rollback()
        error = 'Plate in use!'
        return redirect(url_for('auto_info', id=auto_id, error=error))

    finally:
        cursor.close()
        connection.close()

@app.route('/notes')
def notes():
    if 'email' in session:
        notes = execute_query("SELECT * FROM notes WHERE user_id = %s ORDER BY note_id DESC", (session['user_id'],))
        broadcast = execute_query('SELECT * FROM notes WHERE broadcast = 1 ORDER BY note_id DESC')
        msg = request.args.get('msg', '')

        if notes:
            res = ''
        else:
            res = 'No notes found'

        return render_template('notes.html', session=session, notes=notes, res=res, msg=msg, broadcast=broadcast)
    else:
        return redirect('home')

@app.route('/delete_note/<int:id>')
def delete_note(id):
    if 'email' in session:
        connection = create_db_connection()
        cursor = connection.cursor()
        cursor.execute('DELETE FROM notes WHERE notes.note_id = %s', (id,))
        connection.commit()
        cursor.close()
        connection.close()
    else:
        return redirect(url_for('home'))
    return redirect(url_for('notes'))

@app.route('/send_note', methods=['POST'])
def send_note():
    if 'email' in session:
        try:
            receiver_email = request.form.get('receiver', '').lower()
            sender = request.form['sender']
            object = request.form['object']
            content = request.form['content']

            date = datetime.datetime.now()
            format_date = date.strftime('%Y-%m-%d | %H-%M')
            object_format = f"From: {sender} - {object}"
            content_format = f"""Sent {format_date}:\n{content}"""

            connection = create_db_connection()
            cursor = connection.cursor()

            if receiver_email:
                receiver_query = execute_query('SELECT user_id FROM users WHERE email = %s', (receiver_email,))
                if not receiver_query:
                    raise IndexError('Email not found')
                receiver_id = int(receiver_query[0]['user_id'])
                cursor.execute('INSERT INTO notes (object, text, user_id, broadcast) VALUES (%s, %s, %s, %s)',
                               (object_format, content_format, receiver_id, False))
            else:
                cursor.execute('INSERT INTO notes (object, text, user_id, broadcast) VALUES (%s, %s, NULL, %s)',
                               (object_format, content_format, True))

            connection.commit()
            msg = 'Note sent!'

        except IndexError:
            msg = 'Email not found'
        except Exception as e:
            msg = str(e)
        finally:
            if 'connection' in locals() and connection.is_connected():
                cursor.close()
                connection.close()

        return redirect(url_for('notes', msg=msg))
    else:
        return redirect('home')


@app.route('/graphic')
def graphic():
    auto = execute_query("""
                SELECT auto.*, types.*, status.*, parking_area.*, exit_date.exit_date
                FROM auto
                JOIN types ON auto.type_id = types.type_id
                JOIN status ON auto.status_id = status.status_id
                JOIN parking_area ON auto.area_id = parking_area.area_id
                LEFT JOIN exit_date ON auto.auto_id = exit_date.auto_id
                WHERE parking_area.area_id < 105
                ORDER BY auto.auto_id ASC
                """)

    fig, ax = plt.subplots(figsize=(20, 20))

    numbers = [car['number'] for car in auto]
    letters = [ord(car['letter'][0]) - ord('A') + 1 if len(car['letter']) == 1 else 1 for car in
               auto]
    car_labels = [f"{car['brand']} {car['model']} ({car['license_plate']})" for car in auto]

    scatter = ax.scatter(numbers, letters, c=[car['area_id'] for car in auto], cmap='tab10', s=200, edgecolors='w',
                         alpha=0.75)

    for i, car in enumerate(auto):
        ax.text(
            numbers[i] + 0.2,  # Move text to right
            letters[i] + 0.1,  # Move text up
            f"{car['brand']} {car['model']}\n{car['license_plate']}",
            fontsize=16,
            ha='center',
            va='center'
        )
    ax.set_xlabel('Parking Slots', fontsize=18)
    ax.set_ylabel('Parking Areas (A-Z)', fontsize=18)
    ax.set_title('Auto Park', fontsize=18)

    ax.set_xticks(range(1, max(numbers) + 1))
    ax.set_yticks(range(1, max(letters) + 1))
    ax.set_yticklabels([chr(i + ord('A') - 1) for i in range(1, max(letters) + 1)], fontsize=18)
    ax.set_xticklabels(range(1, max(numbers) + 1), fontsize=18)

    ax.grid(True, which='both', linestyle='--', linewidth=1.0)

    output = io.BytesIO()
    FigureCanvas(fig).print_png(output)

    response = make_response(output.getvalue())
    response.mimetype = 'image/png'
    return response

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000,debug=True)