---
title: Docker compose
description: Deploy Pledger.io with Docker Compose, including database and volumes.
icon: fas layer-group
thumbnail: img/getting-started/installation/compose.svg
show_thumbnail: false
type: docs
weight: 1
---
"Docker-compose" is a tool that can be used to bundle multiple containers into one single deployment.
When managing the images and volumes needed for Pledger.io this method is preferred rather than single container runs.

## Create a compose file

A compose file describes how the deployment of the various images should happen.
To be able to deploy Pledger.io you can use the compose file below as a template.

```yaml
version: '3.7'
services:
    pledger:
      container_name: pledger
      image: ghcr.io/pledger-io/amd64-core:stable
      ports:
        - "80:8080"
      restart: unless-stopped
      environment:
        - DB_TYPE=mysql
        - DATABASE_HOST=pledger_db
        - DATABASE_SCHEMA=pledger
        - DATABASE_USER=pledger
        - DATABASE_PASSWORD=pledger
      volumes:
        - "pledger_logs:/opt/storage/logs"
        - "pledger_uploads:/opt/storage/upload"
    pledger_db:
      container_name: pledger_db
      image: mariadb:11.2
      volumes:
        - "pledger_db:/var/lib/mysql"
      environment:
        - MYSQL_ROOT_PASSWORD=secret
        - MYSQL_DATABASE=pledger
        - MYSQL_USER=pledger
        - MYSQL_PASSWORD=pledger

volumes:
  pledger_logs:
  pledger_uploads:
  pledger_db:
```

## Starting the deployment

Once the compose file is created you can start the deployment using the command below.

```shell
docker-compose up -d
```

TIP: This command should be run in the same directory as the compose file.

This will start the deployment in the background.
You can check the status of the deployment using the command below.

```shell
docker-compose ps
```

This will show the status of the deployment for each of the containers.
