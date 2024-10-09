-- -- Debug statement to confirm the script is running
-- CREATE TABLE init_check (message VARCHAR(255));
-- INSERT INTO init_check (message) VALUES ('Init script executed successfully');

USE poc_db;

-- -- Your actual table creation
CREATE TABLE poc_orders (
    guid VARCHAR(36) PRIMARY KEY,
    date DATETIME,
    user_guid VARCHAR(36),
    user_country CHAR(2),
    product_guid VARCHAR(36),
    value DECIMAL(10, 2),
    currency CHAR(10)
);

-- -- -- Attempt to load the CSV
LOAD DATA INFILE '/var/lib/mysql-files/poc_orders.csv'
INTO TABLE poc_orders
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(guid, date, user_guid, user_country, product_guid, value, currency);
