```Dockerfile
FROM python:3-alpine
WORKDIR /app

RUN apk update
RUN apk upgrade

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN ["python3", "--version"]

ENTRYPOINT [ "python3", "main.py"]
```
