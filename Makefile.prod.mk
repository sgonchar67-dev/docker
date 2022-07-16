prod-up:
	docker compose -p ${APP_NAME}_${APP_ENV} -f docker-compose.yml -f docker-compose.${APP_ENV}.yml up --build -d
prod-down:
	docker compose -p ${APP_NAME}_${APP_ENV} -f docker-compose.yml -f docker-compose.${APP_ENV}.yml down
