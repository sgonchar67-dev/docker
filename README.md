# Docker configuration

### Prepare
#### [install Docker Desktop](https://docs.docker.com/desktop/#download-and-install)

## Local development

### Get started!
```shell
cp .env.dev .env
```
set application directory path 
```.env
APP_DIR=../app
````
Recreate containers with mysql restore

put any dump.sql to docker/mysql/docker-entrypoint-initdb.d if you need
```
make init
```

