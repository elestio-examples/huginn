<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# huginn, verified and packaged by Elestio

[Huginn](https://github.com/huginn/huginn.git) is a feature rich, multi-protocol messaging and streaming broker

<img src="https://github.com/elestio-examples/huginn/raw/main/huginn.png" alt="huginn" width="800">

Deploy a <a target="_blank" href="https://elest.io/open-source/huginn">fully managed huginn</a> on <a target="_blank" href="https://elest.io/">elest.io</a> if you want automated backups, reverse proxy with SSL termination, firewall, automated OS & Software updates, and a team of Linux experts and open source enthusiasts to ensure your services are always safe, and functional.

[![deploy](https://github.com/elestio-examples/huginn/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/huginn)

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/huginn/huginn.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:4678`

## Docker-compose

Here are some example snippets to help you get started creating a container.
version: "3.3"

services:
mysqldata:
image: elestio/mysql:8.0
restart: always

      command: /bin/true

    mysql:
      image: elestio/mysql:8.0
      restart: always
      environment:
        - MYSQL_DATABASE=huginn
        - MYSQL_USER=huginn
        - MYSQL_PASSWORD=${ADMIN_PASSWORD}
        - MYSQL_ROOT_PASSWORD=${ADMIN_PASSWORD}
      volumes:
        - ./mysqldata:/var/lib/mysql

    web:
      image: elestio4test/huginn:${SOFTWARE_VERSION_TAG}
      restart: always
      ports:
        - "172.17.0.1:4678:3000"
      environment:
        - DATABASE_NAME=huginn
        - DATABASE_USERNAME=huginn
        - DATABASE_PASSWORD=${ADMIN_PASSWORD}
        - APP_SECRET_TOKEN=${APP_SECRET_TOKEN}
        - MYSQL_PORT_3306_TCP_ADDR=mysql
        - HUGINN_DATABASE_PASSWORD=${ADMIN_PASSWORD}
        - HUGINN_DATABASE_USERNAME=root
        - HUGINN_DATABASE_NAME=huginn
        - SMTP_DOMAIN=${SMTP_DOMAIN}
        - SMTP_USER_NAME=""
        - SMTP_PASSWORD=""
        - SMTP_SERVER=${SMTP_SERVER}
        - SMTP_PORT=${SMTP_PORT}
        - SMTP_AUTHENTICATION=login
        - SMTP_ENABLE_STARTTLS_AUTO=SMTP_ENABLE_STARTTLS_AUTO
        - EMAIL_FROM_ADDRESS=${EMAIL_FROM_ADDRESS}
      depends_on:
        - mysql

    threaded:
      image: elestio4test/huginn:${SOFTWARE_VERSION_TAG}
      command: /scripts/init bin/threaded.rb
      restart: always
      environment:
        - DATABASE_NAME=huginn
        - DATABASE_USERNAME=huginn
        - DATABASE_PASSWORD=${ADMIN_PASSWORD}
        - APP_SECRET_TOKEN=${APP_SECRET_TOKEN}
        - MYSQL_PORT_3306_TCP_ADDR=mysql
        - HUGINN_DATABASE_PASSWORD=${ADMIN_PASSWORD}
        - HUGINN_DATABASE_USERNAME=root
        - HUGINN_DATABASE_NAME=huginn
        - SMTP_DOMAIN=${SMTP_DOMAIN}
        - SMTP_USER_NAME=""
        - SMTP_PASSWORD=""
        - SMTP_SERVER=${SMTP_SERVER}
        - SMTP_PORT=${SMTP_PORT}
        - SMTP_AUTHENTICATION=login
        - SMTP_ENABLE_STARTTLS_AUTO=SMTP_ENABLE_STARTTLS_AUTO
        - EMAIL_FROM_ADDRESS=${EMAIL_FROM_ADDRESS}
      depends_on:
        - mysql
        - web

### Environment variables

|         Variable          |              Value (example)              |
| :-----------------------: | :---------------------------------------: |
|   SOFTWARE_VERSION_TAG    |                  latest                   |
|        ADMIN_EMAIL        |              your@email.com               |
|      ADMIN_PASSWORD       |          GCdsZwHJ-c4ew-jzO5EvcX           |
|     APP_SECRET_TOKEN      | a-long-random-password-with-128-character |
|        SMTP_SERVER        |                172.17.0.1                 |
|         SMTP_PORT         |                    25                     |
| SMTP_ENABLE_STARTTLS_AUTO |                   false                   |
|    EMAIL_FROM_ADDRESS     |             sender@email.com              |
|        SMTP_DOMAIN        |                your.domain                |

# Maintenance

## Logging

The huginn Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://github.com/huginn/huginn.git">huginn Github repository</a>

- <a target="_blank" href="https://github.com/huginn/huginn/blob/master/doc/README.md">huginn documentation</a>

- <a target="_blank" href="https://github.com/elestio-examples/huginn">elastio-examples/huginn Github repository</a>
