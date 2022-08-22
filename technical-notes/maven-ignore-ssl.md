# Ignore SSL verification on Maven

When getting the error `the trustAnchors parameter must be non-empty` running maven, we can try to avoid the SSL verification.

Flags
```
-Dmaven.wagon.http.ssl.insecure=true
-Dmaven.wagon.http.ssl.allowall=true
```

Example of full comannd:

```bash
$ mvn clean install -U -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true
```
