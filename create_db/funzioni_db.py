import random
import string
import mysql.connector
from faker import Faker
from mysql.connector import Error
import bcrypt

def create_server_connection(host_name, user_name, user_password):
    connection = None
    try:
        connection = mysql.connector.connect(
            host=host_name,
            user=user_name,
            passwd=user_password
        )
        print("MySQL Database connection successful")
    except Error as err:
        print(f"Error: '{err}'")

    return connection

def create_database(connection, name):
    cursor = connection.cursor()
    try:
        query = f"CREATE DATABASE IF NOT EXISTS {name}"
        cursor.execute(query)
        print("Database created successfully")
    except Error as err:
        print(f"Error: '{err}'")

def create_db_connection(host_name, user_name, user_password, db_name):
    connection = None
    try:
        connection = mysql.connector.connect(
            host=host_name,
            user=user_name,
            passwd=user_password,
            database=db_name
        )
        print(f"MySQL Database connection successful to {db_name} ")
    except Error as err:
        print(f"Error: '{err}'")

    return connection

def execute_query(connection, query):
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        print("Query successful")
    except Error as err:
        print(f"Error: '{err}'")

def read_query(connection, query, /,*, dictionary = False):
    if dictionary:
        cursor = connection.cursor(dictionary=True)
    else:
        cursor = connection.cursor()
    result = None
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        return result
    except Error as err:
        print(f"Error: '{err}'")

def execute_list_query(connection, sql, val):
    cursor = connection.cursor()
    try:
        cursor.executemany(sql, val)
        connection.commit()
        print("Query successful")
    except Error as err:
        print(f"Error: '{err}'")

def insert_admin(connection):
    cursor = connection.cursor()
    query = f"INSERT INTO users(name,surname,password,email,is_admin) VALUES (%s,%s,%s,%s,%s)"

    admin = {
        'name': 'Admin',
        'surname': 'Admin',
        'password': 'UserParking',
        'email': 'parking@aglagest.com',
        'is_admin': True
    }

    hashed_password = bcrypt.hashpw(admin['password'].encode('utf-8'), bcrypt.gensalt())

    cursor.execute(query, (admin['name'], admin['surname'], hashed_password.decode('utf-8'), admin['email'], admin['is_admin']))
    connection.commit()
    cursor.close()


def insert_users(connection, num_users):
    cursor = connection.cursor()
    query = "INSERT INTO users(name, surname, password, email, is_admin) VALUES (%s, %s, %s, %s, %s)"

    fake = Faker()
    emails = set()

    for _ in range(num_users):
        name = fake.first_name()
        surname = fake.last_name()
        email = fake.email()
        while email in emails:
            email = fake.email()
        emails.add(email)

        password = 'user'
        hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())

        cursor.execute(query, (name, surname, hashed_password.decode('utf-8'), email, False))

    connection.commit()
    cursor.close()

def generate_unique_vin(existing_vins):
    while True:
        vin = ''.join(random.choices(string.ascii_uppercase + string.digits, k=17))
        if vin not in existing_vins:
            existing_vins.add(vin)
            return vin

# Funzione per generare una targa unica
def generate_unique_license_plate(existing_plates):
    while True:
        license_plate = ''.join(random.choices(string.ascii_uppercase + string.digits, k=7))
        if license_plate not in existing_plates:
            existing_plates.add(license_plate)
            return license_plate

def insert_auto(connection):
    cursor = connection.cursor()
    faker = Faker()

    existing_vins = set()
    existing_plates = set()

    query = """INSERT INTO auto (brand, model, color, doors, vin, license_plate, supplier, type_id, status_id, user_id, area_id) 
               VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"""

    brands = ['Ford', 'Toyota', 'Honda', 'Chevrolet', 'Nissan', 'Hyundai', 'Kia', 'Mazda', 'Subaru', 'Volkswagen',
              'BMW', 'Audi', 'Mercedes-Benz', 'Lexus', 'Jaguar', 'Porsche', 'Land Rover', 'Tesla', 'Dodge', 'Chrysler',
              'Buick', 'GMC', 'Jeep', 'Ram', 'Cadillac', 'Acura', 'Infiniti', 'Mitsubishi']
    models = ['Focus', 'Camry', 'Civic', 'Malibu', 'Altima', 'Elantra', 'Optima', '3', 'Impreza', 'Jetta', '328i', 'A4',
              'C-Class', 'ES', 'XE', '911', 'Range Rover', 'Model S', 'Mustang', 'Camaro', 'Charger', '300', 'Enclave',
              'Sierra', 'Cherokee', '1500', 'XT5', 'MDX', 'QX60', 'Outlander', 'Forester', 'Atlas', 'Q5', 'X5', 'GLC',
              'RX', 'Cayenne', 'F-Pace', 'Discovery', 'Model X', 'Escape', 'RAV4', 'Pilot', 'Traverse', 'Rogue', 'Kona',
              'Sportage', 'CX-5', 'Ascent']
    colors = ['Blue', 'Red', 'Black', 'White', 'Silver', 'Gray', 'Green', 'Yellow', 'Purple', 'Orange']
    suppliers = ['AutoWorld', 'CarZone', 'DriveMax', 'SpeedyCars', 'AutoCenter', 'QuickAuto', 'ValueCars',
                 'PremierAuto', 'AutoDirect', 'EliteCars', 'LuxuryDrive', 'SpeedAuto', 'TopCars', 'AutoPark',
                 'ElectricDrive', 'DriveSelect', 'TopMotors', 'EliteDrive', 'AutoPlanet', 'AutoLink', 'ValueDrive',
                 'CarDepot', 'QuickMotors']
    types_ids = list(range(1, 5))  # assuming types are from 1 to 8
    status_ids = list(range(1, 5))  # assuming statuses are from 1 to 4
    area_ids = list(range(1, 5))  # assuming area_ids are from 1 to 50

    for user_id in range(2, 6):
        brand = random.choice(brands)
        model = random.choice(models)
        color = random.choice(colors)
        doors = random.randint(2, 5)
        vin = generate_unique_vin(existing_vins)
        license_plate = generate_unique_license_plate(existing_plates)
        supplier = random.choice(suppliers)
        type_id = random.choice(types_ids)
        status_id = random.choice(status_ids)
        area_id = random.choice(area_ids)

        cursor.execute(query,
                       (brand, model, color, doors, vin, license_plate, supplier, type_id, status_id, user_id, area_id))

    connection.commit()
    cursor.close()