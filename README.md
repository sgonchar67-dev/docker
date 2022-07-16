# Docker configuration

## Local development

### Get started!
```shell
cp .env.dev .env
```
Recreate containers with mysql restore

put any dump.sql to docker/mysql/docker-entrypoint-initdb.d if you need
```
make init
```

### Prepare
#### [install Docker Desktop](https://docs.docker.com/desktop/#download-and-install)
