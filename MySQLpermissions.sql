# Aby wykonać cały skrypt:
# SOURCE {sciezka_do_pliku};

# usuwanie danych
DROP DATABASE IF EXISTS db1;
DROP DATABASE IF EXISTS db2;

# wraz z urzytkownikami usuwają się wpisy
# o ich permisjach (testowałem)
DROP USER IF EXISTS user1;
DROP USER IF EXISTS user2;
DROP USER IF EXISTS user3;
DROP USER IF EXISTS root2;

#zad 1.
#Server uwierzytelni użytkownika za pomocą konta Host: % User: lab,
#ponieważ znak % akceptuje każde ip, więc używane jest pierwsze znalezione konto.

SHOW GRANTS; # komenda pozwalająca zobaczyć jakiego konta użył serwer do nawiązania połączenia


#zad 2.
SELECT Host, User, Password FROM Mysql.User WHERE password='' OR user='';

#zad 3.
CREATE USER user1;
CREATE USER user2;
CREATE USER user3;
CREATE USER root2;

GRANT USAGE ON *.* TO 'user1';
GRANT USAGE ON *.* TO 'user2';
GRANT ALL PRIVILEGES ON db3.* TO 'user3';
GRANT ALL PRIVILEGES ON   *.* TO 'root2';

#zad 4.
CREATE DATABASE db1;
CREATE DATABASE db2;

#zad 5.
GRANT ALL PRIVILEGES ON db1.* TO 'user1';
GRANT ALL PRIVILEGES ON db2.* TO 'user2';

#zad 6.
# dla nowszych wersji MySQL czy MariaDB trzeba usunąć funkcję password(x)
SET PASSWORD FOR 'user1' = PASSWORD('u1');
GRANT USAGE ON *.* TO 'user2' IDENTIFIED BY 'u2';

#zad 7.
REVOKE ALL PRIVILEGES ON db3.* FROM 'user3';

#zad 8.
USE db1;
CREATE TABLE tab1(id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, imie varchar(32), nazwisko varchar(32));
CREATE TABLE tab2(id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, model varchar(32), marka varchar(32));

USE db2;
CREATE TABLE tab1(id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, imie varchar(32), nazwisko varchar(32));
CREATE TABLE tab2(id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, model varchar(32), marka varchar(32));

GRANT SELECT, INSERT, UPDATE, DELETE ON db2.tab1 TO 'user1';

# Jeżeli wyskakuje panu błąd tutaj w 64 lini że uszkodzona kolumna to:
# REPAIR TABLE mysql.columns_priv;

GRANT SELECT (marka) ON db2.tab2 TO 'user1';

GRANT ALL PRIVILEGES ON db1.* TO 'user2';

#zad 9.
# nie mam pojęcia jak wyświetlić permisje wszystkich użytkowników za pomocą SHOW GRANTS
# źródło: https://dba.stackexchange.com/questions/23265/mysql-show-grants-for-all-users

# zad 10.
# To nie jest pisemne, prawda?

# usuwanie danych
DROP DATABASE IF EXISTS db1;
DROP DATABASE IF EXISTS db2;

DROP USER IF EXISTS user1;
DROP USER IF EXISTS user2;
DROP USER IF EXISTS user3;
DROP USER IF EXISTS root2;