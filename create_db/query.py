
create_auto = """
CREATE TABLE auto (
  auto_id INT AUTO_INCREMENT PRIMARY KEY,
  brand VARCHAR(150),
  model VARCHAR(150),
  color VARCHAR(150),
  doors INT,
  vin VARCHAR (17) UNIQUE,
  license_plate VARCHAR (7) UNIQUE,
  supplier VARCHAR (150),
  type_id INT,
  status_id INT,
  user_id INT,
  area_id INT
);
"""

create_users = """
CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150),
  surname VARCHAR(150),
  password TEXT,
  email VARCHAR(200) UNIQUE,
  is_admin BOOLEAN NOT NULL
);
"""

create_notes = """
CREATE TABLE notes (
  area_id INT AUTO_INCREMENT PRIMARY KEY,
  object VARCHAR(255),
  text TEXT,
  user_id INT,
  broadcast BOOLEAN
);
"""

create_logs = """
CREATE TABLE logs (
  log_id INT AUTO_INCREMENT PRIMARY KEY,
  log VARCHAR(255),
  user_id INT
);
"""

create_parking_area = """
CREATE TABLE parking_area (
  area_id INT AUTO_INCREMENT PRIMARY KEY,
  letter VARCHAR(5),
  number INT
);
"""

create_types = """
CREATE TABLE types (
  type_id INT AUTO_INCREMENT PRIMARY KEY,
  type VARCHAR(50)
);
"""

create_status = """
CREATE TABLE status (
  status_id INT AUTO_INCREMENT PRIMARY KEY,
  status VARCHAR(150)
);
"""

create_entry_date = """
CREATE TABLE entry_date (
  entry_id INT AUTO_INCREMENT PRIMARY KEY,
  entry_date DATETIME,
  auto_id INT,
  user_id INT
);
"""

create_edit_date = """
CREATE TABLE edit_date (
  edit_id INT AUTO_INCREMENT PRIMARY KEY,
  edit_date DATETIME,
  auto_id INT,
  user_id INT
);
"""

create_exit_date = """
CREATE TABLE exit_date (
  exit_id INT AUTO_INCREMENT PRIMARY KEY,
  exit_date DATETIME,
  auto_id INT,
  user_id INT
);
"""

alter_auto = """
ALTER TABLE auto
ADD FOREIGN KEY(type_id)
REFERENCES types(type_id)
ON DELETE SET NULL
ON UPDATE RESTRICT,
ADD FOREIGN KEY(status_id)
REFERENCES status(status_id)
ON DELETE SET NULL
ON UPDATE RESTRICT,
ADD FOREIGN KEY(user_id)
REFERENCES users(user_id)
ON DELETE SET NULL
ON UPDATE RESTRICT,
ADD FOREIGN KEY(area_id)
REFERENCES parking_area(area_id)
ON DELETE SET NULL;
"""

alter_notes = """
ALTER TABLE notes
ADD FOREIGN KEY(user_id)
REFERENCES users(user_id)
ON DELETE SET NULL;
"""

alter_logs = """
ALTER TABLE logs
ADD FOREIGN KEY(user_id)
REFERENCES users(user_id)
ON DELETE SET NULL;
"""

alter_entry_date = """
ALTER TABLE entry_date
ADD FOREIGN KEY(user_id)
REFERENCES users(user_id)
ON DELETE SET NULL
ON UPDATE RESTRICT,
ADD FOREIGN KEY(auto_id)
REFERENCES auto(auto_id)
ON DELETE SET NULL;
"""

alter_edit_date = """
ALTER TABLE edit_date
ADD FOREIGN KEY(user_id)
REFERENCES users(user_id)
ON DELETE SET NULL
ON UPDATE RESTRICT,
ADD FOREIGN KEY(auto_id)
REFERENCES auto(auto_id)
ON DELETE SET NULL;
"""

alter_exit_date = """
ALTER TABLE exit_date
ADD FOREIGN KEY(user_id)
REFERENCES users(user_id)
ON DELETE SET NULL
ON UPDATE RESTRICT,
ADD FOREIGN KEY(auto_id)
REFERENCES auto(auto_id)
ON DELETE SET NULL;
"""