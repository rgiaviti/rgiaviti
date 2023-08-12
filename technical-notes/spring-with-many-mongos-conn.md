# How to connect to many MongoDB routers using Spring

## Single instance connection example
```yaml
spring:
  data:
    mongodb:
      database: dbname
      host: 127.0.0.1
      port: 27017
      username: root
      password: root
      authentication-database: admin
```


## Many instances connection example

```yaml
spring:
  data:
    mongodb:
      uri: mongodb://root:root@<router-1>:<port>,<router-2>:<port>/cop?authSource=admin&authMechanism=SCRAM-SHA-256
```
