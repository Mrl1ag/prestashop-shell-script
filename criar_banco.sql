#criar banco mysql

CREATE USER IF NOT EXISTS 'prestashopuser'@'localhost';
SET PASSWORD FOR 'prestashopuser'@'localhost' = 'M4ri4l4ab123*';
CREATE DATABASE IF NOT EXISTS prestashop;
GRANT ALL ON prestashop.* TO 'prestashopuser'@'localhost';
FLUSH PRIVILEGES;

