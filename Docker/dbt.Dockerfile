FROM python:3.8.5


# Update and install system packages
RUN apt-get update -y && \
  apt-get install --no-install-recommends -y -q \
  git libpq-dev python-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install dbt
RUN pip install -U pip
RUN pip install dbt-core
RUN pip install dbt-mysql

# Set environment variables
ENV DBT_DIR /dbt

# Set working directory
WORKDIR $DBT_DIR

# Copy the local dbt project into the container
COPY . /poc_project

# Set the command to be run by the container
CMD ["dbt"]
