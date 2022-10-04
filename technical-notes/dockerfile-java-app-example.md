A Dockerfile example of a simple java application using Alpine

```Dockerfile
FROM eclipse-temurin/17-jre-alpine

RUN apk update
RUN apk upgrade

RUN mkdir app_folder
ADD app-snapshot.jar app_folder

EXPOSE 8080
ENTRYPOINT java -jar app_folder/app-snapshot.jar
```
