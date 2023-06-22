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

MongoDB is a source-available cross-platform document-oriented database program. Classified as a NoSQL database program, MongoDB uses JSON-like documents with optional schemas. MongoDB is developed by MongoDB Inc. and licensed under the Server Side Public License (SSPL) which is deemed non-free by several distributions.

```bash
podman volume create "mongo_data_volume"
podman volume create "mongo_config_volume"
```

```bash
podman run --name "mongo" --net "pd.local" -d -p 27017:27017 -v "mongodata_volume:/data/db" -v "mongoconfig_volume:/data/configdb" -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=root -e MONGO_INITDB_DATABASE=init_db "docker.io/mongo:latest"
```

## RabbitMQ

RabbitMQ is an open-source message-broker software (sometimes called message-oriented middleware) that originally implemented the Advanced Message Queuing Protocol (AMQP) and has since been extended with a plug-in architecture to support Streaming Text Oriented Messaging Protocol (STOMP), MQ Telemetry Transport (MQTT), and other protocols.

```bash
podman volume create "rabbitmq_volume"
```

```bash
podman run --name "rabbitmq" --net "pd.local" -d -p 5672:5672 -p 15672:15672 -v "rabbitmq_volume:/var/lib/rabbitmq" -e RABBITMQ_DEFAULT_USER=user -e RABBITMQ_DEFAULT_PASS=password "docker.io/rabbitmq:management"
```

## MySQL

MySQL is an open-source relational database management system (RDBMS). Its name is a combination of "My", the name of co-founder Michael Widenius's daughter My, and "SQL", the acronym for Structured Query Language. A relational database organizes data into one or more data tables in which data may be related to each other; these relations help structure the data. SQL is a language programmers use to create, modify and extract data from the relational database, as well as control user access to the database. In addition to relational databases and SQL, an RDBMS like MySQL works with an operating system to implement a relational database in a computer's storage system, manages users, allows for network access and facilitates testing database integrity and creation of backups.

```bash
podman volume create "mysql_volume"
```

```bash
podman run --name "mysql" --net "pd.local" -d -p 3306:3306 -v "mysql_volume:/var/lib/mysql" -e MYSQL_ROOT_PASSWORD=root -e MYSQL_ALLOW_EMPTY_PASSWORD=false "docker.io/mysql:latest"
```

## MariaDB

MariaDB is a community-developed, commercially supported fork of the MySQL relational database management system (RDBMS), intended to remain free and open-source software under the GNU General Public License. Development is led by some of the original developers of MySQL, who forked it due to concerns over its acquisition by Oracle Corporation in 2009.

```bash
podman volume create "mariadb_volume"
```

```bash
podman run --name "mariadb" --net "pd.local" -d -p 3306:3306 -v "mariadb_volume:/var/lib/mysql" -e MARIADB_USER=root -e MARIADB_PASSWORD=local_pass -e MARIADB_ROOT_PASSWORD=root "docker.io/mariadb:latest"
```

## PostgreSQL

PostgreSQL, also known as Postgres, is a free and open-source relational database management system (RDBMS) emphasizing extensibility and SQL compliance. It was originally named POSTGRES, referring to its origins as a successor to the Ingres database developed at the University of California, Berkeley. In 1996, the project was renamed to PostgreSQL to reflect its support for SQL. After a review in 2007, the development team decided to keep the name PostgreSQL and the alias Postgres.

```bash
podman volume create "postgres_volume"
```

```bash
podman run --name "postgres" --net "pd.local" -d -p 5432:5432 -v "postgres_volume:/var/lib/postgresql/data" -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root "docker.io/postgres:latest"
```

## Localstack

LocalStack is a cloud service emulator that runs in a single container on your laptop or in your CI environment. With LocalStack, you can run your AWS applications or Lambdas entirely on your local machine without connecting to a remote cloud provider!

Whether you are testing complex CDK applications or Terraform configurations, or just beginning to learn about AWS services, LocalStack helps speed up and simplify your testing and development workflow.

LocalStack supports a growing number of AWS services, like AWS Lambda, S3, DynamoDB, Kinesis, SQS, SNS...

```bash
podman volume create "localstack_volume"
```

```bash
podman run --name "localstack" --net "pd.local" -d -p 4566:4566 -v "localstack_volume:/var/lib/localstack" -e AWS_DEFAULT_REGION=sa-east-1 -e AWS_SECRET_ACCESS_KEY=DUMMY -e AWS_ACCESS_KEY_ID=DUMMY -e EDGE_PORT=4566 -e SERVICES="kinesis, dynamodb, sns, sqs" "docker.io/localstack/localstack:latest"
```

## Open Search

OpenSearch is a scalable, flexible, and extensible open-source software suite for search, analytics, and observability applications licensed under Apache 2.0. Powered by Apache Lucene and driven by the OpenSearch Project community, OpenSearch offers a vendor-agnostic toolset you can use to build secure, high-performance, cost-efficient applications.

```bash
podman run --name "opensearch" --net "pd.local" -d -p 9200:9200 -p 9600:9600 -e "cluster.name"="docker-cluster" -e "discovery.type"="single-node" -e "bootstrap.memory_lock"=true -e "plugins.security.disabled"=true -e OPENSEARCH_JAVA_OPTS="-Xms512m -Xmx512m" "docker.io/opensearchproject/opensearch:latest"
```

## Open Search Dashboard

OpenSearch is a scalable, flexible, and extensible open-source software suite for search, analytics, and observability applications licensed under Apache 2.0. Powered by Apache Lucene and driven by the OpenSearch Project community, OpenSearch offers a vendor-agnostic toolset you can use to build secure, high-performance, cost-efficient applications.

```bash
podman run --name "opensearch_dashboards" --net "pd.local" -d -p 5601:5601 -e "OPENSEARCH_HOSTS"="http://opensearch:9200" -e "DISABLE_SECURITY_DASHBOARDS_PLUGIN"=true "docker.io/opensearchproject/opensearch-dashboards:latest"
```

## SonarQube

SonarQube (formerly Sonar) is an open-source platform developed by SonarSource for continuous inspection of code quality to perform automatic reviews with static analysis of code to detect bugs and code smells on 29 programming languages. SonarQube offers reports on duplicated code, coding standards, unit tests, code coverage, code complexity, comments, bugs, and security recommendations

```bash
podman run --name "sonarqube" --net "pd.local" -d -p 9000:9000 "docker.io/sonarqube:latest"
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
