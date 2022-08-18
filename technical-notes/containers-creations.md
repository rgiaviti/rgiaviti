# Snippets to create containers locally

## Podman or Docker installation

- **Podman**: https://podman.io/getting-started/installation
- Docker: https://docs.docker.com/engine/install/ubuntu/

## Create Network

```bash
$ podman network create -d bridge pd.local
```

## Oracle 11g

```bash
$ podman run --name oracle --net pd.local -d -p 49160:22 -p 1521:1521 -p 49162:8080 orangehrm/oracle-xe-11g
```

### Connection Information

```
hostname: localhost 
port: 1521 
sid: xe 
username: system 
password: oracle
```

## MongoDB

```bash
$ podman run --name mongo --net pd.local -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=root -d mongo:latest
```

## RabbitMQ

```bash
podman run --name rabbitmq --net pd.local -d -p 5672:5672 -p 15672:15672 --hostname rabbitmq -v /docker/rabbitmq/data:/var/lib/rabbitmq rabbitmq:3-management
```

## MySQL

```bash
podman run --name mysql --net pd.local -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_ALLOW_EMPTY_PASSWORD=false mysql:latest
```

## MariaDB

```bash
$ podman run --name mariadb --net pd.local -d -p 3306:3306 --env MARIADB_USER=local-user --env MARIADB_PASSWORD=local-user-pass --env MARIADB_ROOT_PASSWORD=root-pass  mariadb:latest
```

## PHPMyAdmin

```bash
$ podman run --name phpmyadmin --net pd.local -d --link mysql:db -p 7500:80 phpmyadmin/phpmyadmin
```

## PostgreSQL

```bash
$ podman run --name postgres --net pd.local -d -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root postgres:latest
```

## SonarQube

```bash
$ podman run --name sonarqube --net pd.local -d -p 9000:9000 sonarqube
```