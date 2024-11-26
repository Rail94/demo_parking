from funzioni_db import *
from query import *
#'New', 'Used', 'Corporate', 'Km Zero'
DB_NAME = "sdekjdds_parking"

connection = create_server_connection("localhost", "root", "root")
#execute_query(connection, f"DROP DATABASE IF EXISTS {DB_NAME}")
create_database(connection,DB_NAME)
connection = create_db_connection("localhost", "root","root", DB_NAME)

#CREATE TABLES
#execute_query(connection, create_auto)
#execute_query(connection, create_users)
#execute_query(connection, create_notes)
#execute_query(connection, create_logs)
#execute_query(connection, create_parking_area)
#execute_query(connection, create_types)
#execute_query(connection, create_status)
#execute_query(connection, create_entry_date)
#execute_query(connection, create_edit_date)
#execute_query(connection, create_exit_date)

#INSERT FOREIGN KEYS
#execute_query(connection, alter_notes)
#execute_query(connection, alter_entry_date)
#execute_query(connection, alter_edit_date)
#execute_query(connection, alter_exit_date)
#execute_query(connection, alter_auto)

#INSERT USERS
#insert_admin(connection)
#insert_users(connection, 50)
#insert_auto(connection)