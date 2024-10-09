IMAGE_NAME ?= poc_dbt_image
MYSQL_IMAGE_NAME ?= poc_mysql

.DEFAULT_GOAL := dbt_version

.PHONY: dbt mysql dbt_version run_mysql

dbt:
	docker build --no-cache -t $(IMAGE_NAME) -f Docker/dbt.Dockerfile .

dbt_version:
	docker run --rm -it $(IMAGE_NAME) --version

mysql:
	docker build --no-cache -t $(MYSQL_IMAGE_NAME) -f Docker/mysql.Dockerfile .

run_mysql:
	docker run --rm -d --name mysql_container \
		-e MYSQL_ROOT_PASSWORD=amatriciana \
		-e MYSQL_DATABASE=poc_db \
		-p 3306:3306 $(MYSQL_IMAGE_NAME)
