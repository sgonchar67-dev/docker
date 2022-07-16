include .env
include Makefile.*.mk
MERCURE_SSL_DIR=./nginx/conf.d/ssl

init: certs-gen recreate

certs-gen:
	sudo openssl req -x509 -newkey rsa:4096 -keyout ${MERCURE_SSL_DIR}/certificate.key -out ${MERCURE_SSL_DIR}/certificate.crt -days 365 -subj '/CN=*.lvh.me' -nodes
recreate:
	docker compose -p ${APP_NAME}_${APP_ENV} -f docker-compose.yml up --force-recreate -d

build:
	docker compose -p ${APP_NAME}_${APP_ENV} -f docker-compose.yml build
up:
	docker compose -p ${APP_NAME}_${APP_ENV} -f docker-compose.yml up --build -d
down:
	docker compose -p ${APP_NAME}_${APP_ENV} -f docker-compose.yml down