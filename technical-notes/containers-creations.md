# Snippets to create containers locally

All the images are set to the latest versions.

## Podman or Docker installation

- **Podman**: [https://podman.io/docs/installation](https://podman.io/docs/installation)
- Docker: https://docs.docker.com/engine/install/ubuntu/

## Create Network

```bash
podman network create -d bridge "pd.local"
```

## MongoDB

```bash
podman volume create "mongodata_volume"
podman volume create "mongoconfig_volume"
```

```bash
podman run --name "mongo" --net "pd.local" -d -p 27017:27017 -v "mongodata_volume:/data/db" -v "mongoconfig_volume:/data/configdb" -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=root -e MONGO_INITDB_DATABASE=init_db "docker.io/mongo:latest"
```

## RabbitMQ

```bash
podman volume create "rabbitmq_volume"
```

```bash
podman run --name "rabbitmq" --net "pd.local" -d -p 5672:5672 -p 15672:15672 -v "rabbitmq_volume:/var/lib/rabbitmq" -e RABBITMQ_DEFAULT_USER=user -e RABBITMQ_DEFAULT_PASS=password "docker.io/rabbitmq:management"
```

## MySQL

```bash
podman volume create "mysql_volume"
```

```bash
podman run --name "mysql" --net "pd.local" -d -p 3306:3306 -v "mysql_volume:/var/lib/mysql" -e MYSQL_ROOT_PASSWORD=root -e MYSQL_ALLOW_EMPTY_PASSWORD=false "docker.io/mysql:latest"
```

## MariaDB

```bash
podman volume create "mariadb_volume"
```

```bash
podman run --name "mariadb" --net "pd.local" -d -p 3306:3306 -v "mariadb_volume:/var/lib/mysql" -e MARIADB_USER=root -e MARIADB_PASSWORD=local_pass -e MARIADB_ROOT_PASSWORD=root "docker.io/mariadb:latest"
```

## PostgreSQL

```bash
podman volume create "postgres_volume"
```

```bash
podman run --name "postgres" --net "pd.local" -d -p 5432:5432 -v "postgres_volume:/var/lib/postgresql/data" -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root "docker.io/postgres:latest"
```

## Localstack

```bash
podman volume create "localstack_volume"
```

```bash
podman run --name "localstack" --net "pd.local" -d -p 4566:4566 -e AWS_DEFAULT_REGION=sa-east-1 -e AWS_SECRET_ACCESS_KEY=DUMMY -e AWS_ACCESS_KEY_ID=DUMMY -e EDGE_PORT=4566 -e SERVICES="kinesis, dynamodb, sns, sqs" "docker.io/localstack/localstack:latest"
```

## Open Search

```bash
podman volume create "opensearch_volume"
```

```bash
podman run --name "opensearch" --net "pd.local" -d -p 9200:9200 -p 9600:9600 -v "opensearch_volume:/var/lib/opensearch/data" -e "cluster.name"="docker-cluster" -e "discovery.type"="single-node" -e "bootstrap.memory_lock"=true -e "plugins.security.disabled"=true -e OPENSEARCH_JAVA_OPTS="-Xms512m -Xmx512m" "docker.io/opensearchproject/opensearch:latest"
```

## Open Search Dashboard

```bash
podman volume create "osd_volume"
```

```bash
podman run --name "opensearch_dashboards" --net "pd.local" -d -p 5601:5601 -v "osd_volume:/var/lib/osd/data" -e "OPENSEARCH_HOSTS"="http://opensearch:9200" -e "DISABLE_SECURITY_DASHBOARDS_PLUGIN"=true "docker.io/opensearchproject/opensearch-dashboards:latest"
```

## SonarQube

```bash
podman volume create "sonarqube_volume"
```

```bash
podman run --name "sonarqube" --net "pd.local" -d -p 9000:9000 -v "sonarqube_volume:/var/lib/sonarqube/data" "docker.io/sonarqube:latest"
```

## DEPRECATED

## Oracle XE 11g

```bash
podman run --name "oracle" --net "pd.local" -d -p "49160:22" -p "1521:1521" -p "49162:8080" "docker.io/orangehrm/oracle-xe-11g"
```

### Oracle Connection Information

```
hostname: localhost 
port: 1521 
sid: xe 
username: system 
password: oracle
```
