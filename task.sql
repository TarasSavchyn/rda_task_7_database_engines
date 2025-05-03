-- Створення бази даних
CREATE DATABASE IF NOT EXISTS ShopDB;
USE ShopDB;

-- Таблиця Countries: збереження країн, основна таблиця → InnoDB
CREATE TABLE IF NOT EXISTS Countries (
    ID INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- Таблиця GeoIPCache: кеш IP-діапазонів, висока швидкість, можна втратити дані → MEMORY
CREATE TABLE IF NOT EXISTS GeoIPCache (
    ID INT NOT NULL,
    IPRange VARCHAR(50) NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=MEMORY;

-- Таблиця ProductDescription: опис товарів, багато читань, важливість збереження → InnoDB
CREATE TABLE IF NOT EXISTS ProductDescription (
    ID INT NOT NULL,
    Description TEXT NOT NULL,
    ProductID INT NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- Таблиця Logs: просто приймає записи, збереження не потрібне → BLACKHOLE
CREATE TABLE IF NOT EXISTS Logs (
    ID INT NOT NULL,
    Timestamp DATETIME NOT NULL,
    Message TEXT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=BLACKHOLE;

-- Таблиця ProductReporting: зберігання даних для CSV-експорту → CSV
CREATE TABLE IF NOT EXISTS ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;
