#!/bin/bash

# Wait for MySQL container port to be active
echo "Short wait to avoid race conditions"
sleep 7

# Clear employees table in case it exists
mysql -u admin -p123456 -D goodcorpdb -Bse \
"DROP TABLE IF EXISTS employees; \
CREATE TABLE employees ( \
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, \
firstname VARCHAR(30) NOT NULL, \
lastname VARCHAR(30) NOT NULL, \
email VARCHAR(50) NOT NULL, \
department VARCHAR(50) NOT NULL, \
date_added TIMESTAMP ); \
INSERT INTO employees (firstname, lastname, email, department) \
VALUES ('Bob', 'Brew', 'bbrew@goodcorp.net', 'Sales and Marketing'); \
INSERT INTO employees (firstname, lastname, email, department) \
VALUES ('Andrew', 'Americano', 'aamericano@goodcorp.net', 'Research and Development'); \
INSERT INTO employees (firstname, lastname, email, department) \
VALUES ('Caroline', 'Cortado', 'ccortado@goodcorp.net', 'Human Resources'); \
INSERT INTO employees (firstname, lastname, email, department) \
VALUES ('Deborah', 'Doppio', 'ddoppio@goodcorp.net', 'Operations'); \
INSERT INTO employees (firstname, lastname, email, department) \
VALUES ('Emma', 'Espresso', 'eespresso@goodcorp.net', 'Research and Development');"