# dbt MySQL Integration Project

This project demonstrates the integration of **dbt** (Data Build Tool) with **MySQL** for data transformation and analytics. The project consists of SQL models and transformations, leveraging dbt to run and manage data pipelines.

## Requirements

Before running this project, ensure you have the following:

- **Docker** installed and running
- **MySQL** installed or running inside a Docker container
- **Git** for version control
- **dbt-core** and **dbt-mysql** installed in your Docker container

## Project Setup

1. **Clone the repository**:
   ```bash
   git clone git@github.com:giobale/poc-dbt.git
   cd poc-dbt
   ```

2. **Move the profiles.yml file**:
   The `profiles.yml` file in the `src/` directory should be moved to your local dbt system directory. On a MacBook, the path for this directory is `~/.dbt/profiles.yml`.

   Run the following command to move the file:
   ```bash
   mkdir -p ~/.dbt
   mv src/profiles.yml ~/.dbt/profiles.yml
   ```

3. **Build the Docker image**:
   The Dockerfile provided in the project will set up a dbt environment with MySQL integration.

   Run the following command to build the Docker image:
   ```bash
   make dbt
   ```

   This will:
   - Build a Docker image with Python, dbt-core, and dbt-mysql installed.
   - Set up the necessary dependencies for dbt to work with MySQL.

4. **Start the MySQL container**:
   If you don’t have a MySQL instance running, you can start one using Docker. The `make run_mysql` command will spin up a MySQL container using a predefined configuration.

   ```bash
   make run_mysql
   ```

   This will:
   - Start a MySQL container with default credentials (`root` user and `amatriciana` password).
   - Initialize the database (`poc_db`) and import necessary CSV data (if applicable).

5. **Run dbt Models**:
   To run the dbt models and transformations:

   ```bash
   ../bin/edbt run --profile poc_project
   ```

   This will:
   - Run the dbt models that create tables and aggregate data within the MySQL database.
   - Create transformations such as aggregating total values by country.

6. **Check dbt Version**:
   To verify that dbt is set up correctly, you can check the dbt version using the following command:

   ```bash
   ../bin/edbt run --version
   ```

## Project Structure

- `models/`: Contains the dbt models (SQL transformations) that are run to create tables and process data.
- `Docker/`: Contains the Dockerfile and other scripts used to build the Docker image for dbt and MySQL.
- `src/profiles.yml`: The dbt `profiles.yml` file that defines the connection to the MySQL database. Remember to move this file to your local `~/.dbt/profiles.yml` location.

## Running Tests

To run tests and validate the models in your dbt project, you can use the following command:

```bash
../bin/edbt test --profile poc_project
```

This will run any dbt tests defined in your project to ensure the data transformations are working as expected.

## Configuration

### `profiles.yml`
Make sure the `profiles.yml` file is located in `~/.dbt/profiles.yml` after moving it from the `src/` directory. The `profiles.yml` file should look like this:

```yaml
poc_project:
  target: dev
  outputs:
    dev:
      type: mysql
      host: 127.0.0.1
      user: root
      password: amatriciana
      database: poc_db
      port: 3306
```

This config file connects dbt to your local MySQL instance.

## Troubleshooting

- Ensure Docker is running and MySQL is accessible before running the dbt commands.
- If MySQL is not running locally, use the provided Docker configuration to spin up a MySQL container.
