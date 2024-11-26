import pymysql.cursors

# Configura i parametri di connessione al database
db_config = {
    'host': 'aglabit.it',              # Sostituisci con l'host del database
    'user': 'sdekjdds_parking',        # Sostituisci con il tuo nome utente del database
    'password': 'Parking@Access2024',  # Sostituisci con la tua password del database
    'database': 'sdekjdds_parking',    # Sostituisci con il nome del database
    'cursorclass': pymysql.cursors.DictCursor
}

connection = None

try:
    # Stabilisce la connessione al database
    print("Tentativo di connessione al database...")
    connection = pymysql.connect(**db_config)
    print("Connessione al database riuscita!")

    # Esempio di esecuzione di una query
    with connection.cursor() as cursor:
        print("Esecuzione della query...")
        cursor.execute('SELECT VERSION()')
        result = cursor.fetchone()
        print(f'Versione di MySQL: {result["VERSION()"]}')

except pymysql.MySQLError as e:
    print(f"Errore nella connessione al database: {e}")
except Exception as e:
    print(f"Errore generico: {e}")
finally:
    # Chiude la connessione se è stata aperta
    if connection:
        print("Chiusura della connessione...")
        connection.close()
        print("Connessione al database chiusa.")
