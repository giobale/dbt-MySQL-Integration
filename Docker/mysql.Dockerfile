# Docker/mysql.Dockerfile

# Use official MySQL image
FROM mysql:8.0

# Set root password for MySQL
ENV MYSQL_ROOT_PASSWORD=amatriciana

# Create database
ENV MYSQL_DATABASE=poc_db

# Copy the CSV file into the container
COPY src/Data/poc_orders.csv /var/lib/mysql-files/poc_orders.csv

# Copy SQL script that creates and populates the table
COPY src/init_db.sql /docker-entrypoint-initdb.d/init_db.sql

# Copy the custom my.cnf file to enable local_infile
COPY src/my.cnf /etc/mysql/conf.d/my.cnf

# Expose the default MySQL port
EXPOSE 3306
