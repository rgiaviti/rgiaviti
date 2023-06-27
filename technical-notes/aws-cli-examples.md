# AWS Cli

## Installing AWS Cli

Follow these instructions to install the aws cli: https://aws.amazon.com/pt/cli/

## Configure AWS locally (localhost) to use with Localstack

```bash
aws config --profile local
AWS Access Key ID [None]: DUMMY
AWS Secret Access Key [None]: DUMMY
Default region name [None]: sa-east-1
Default output format [None]: json
```

## Configure AWS to use with another host running localstack

```bash
aws config --profile <profile_name>
AWS Access Key ID [None]: DUMMY
AWS Secret Access Key [None]: DUMMY
Default region name [None]: sa-east-1
Default output format [None]: json
```

## Creating SQS Queues

```bash
aws --profile=<profile_name> --endpoint http://<host/ip>:4566 sqs create-queue --queue-name <queue_name>
```

## Listing SQS Queues

```bash
aws --profile=<profile_name> --endpoint http://<host>:4566 sqs list-queues
```

Creating SQS with attribute FIFO

```bash
aws --profile=<profile_name> --endpoint http://<host/ip>:4566 sqs create-queue --queue-name <queue_name> --attributes '{ "FifoQueue": "True" }'
```

## Creating Dynamo table

```bash
aws --profile olimpus --endpoint http://<host or ip>:4566 dynamodb create-table \
--table-name <name> \
--attribute-definitions AttributeName=<attr_name>,AttributeType=S AttributeName=<attr_name>,AttributeType=S \
--key-schema AttributeName=<attr_name>,KeyType=HASH AttributeName=<attr_name>,KeyType=RANGE \
--provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
--tags Key=<name>,Value=<value>
```

## Creating Kinesis stream

```bash
aws --endpoint http://<host or ip>:4566 kinesis create-stream --stream-name <stream_name> --shard-count 1
```
