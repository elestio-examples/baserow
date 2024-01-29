<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# Baserow, verified and packaged by Elestio

[Baserow](https://github.com/bram2w/baserow) is an open source no-code database tool and Airtable alternative.

<img src="https://github.com/elestio-examples/baserow/raw/main/baserow.png" alt="activepieces" width="800">

Deploy a <a target="_blank" href="https://elest.io/open-source/activepieces">fully managed Baserow</a> on <a target="_blank" href="https://elest.io/">elest.io</a> Create your own online database without technical experience. This user-friendly no-code tool gives you the powers of a developer without leaving your browser.

[![deploy](https://github.com/elestio-examples/baserow/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/baserow)

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/baserow.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Create data folders with correct permissions

    mkdir -p ./storage/baserow_data
    mkdir -p ./storage/pgdata
    mkdir -p ./servers.json

    chown -R 1000:1000 ./storage/baserow_data
    chown -R 1000:1000 ./storage/pgdata
    chown -R 1000:1000 ./servers.json


Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:8725`

## Docker-compose

Here are some example snippets to help you get started creating a container.

    version: "3.3"
    services:
    baserow:
        image: elestio4test/baserow-allinone:${SOFTWARE_VERSION_TAG}
        container_name: 'baserow'
        restart: always
        environment:
        BASEROW_PUBLIC_URL: "https://${DOMAIN}"
        DATABASE_HOST: db
        DATABASE_NAME: baserow
        DATABASE_USER: postgres
        DATABASE_PASSWORD: ${ADMIN_PASSWORD}
        DATABASE_PORT: 5432
        EMAIL_SMTP: "True"
        EMAIL_SMTP_HOST: ${EMAIL_SMTP_HOST}
        EMAIL_SMTP_PASSWORD: ${EMAIL_SMTP_PASSWORD}
        FROM_EMAIL: ${FROM_EMAIL}
        EMAIL_SMTP_USE_TLS: "False"
        ports:
        - "172.17.0.1:8725:80"
        volumes:
        - ./storage/baserow_data:/baserow/data

    db:
        image: elestio/postgres:15
        restart: always
        ports:
        - "172.17.0.1:5735:5432"
        environment:
        POSTGRES_USER: postgres
        POSTGRES_PASSWORD: ${ADMIN_PASSWORD}
        POSTGRES_DB: baserow
        volumes:
        - ./storage/pgdata:/var/lib/postgresql/data/

    pgadmin4:
        image: dpage/pgadmin4:latest
        restart: always
        environment:
        PGADMIN_DEFAULT_EMAIL: ${ADMIN_EMAIL}
        PGADMIN_DEFAULT_PASSWORD: ${ADMIN_PASSWORD}
        PGADMIN_LISTEN_PORT: 8080
        ports:
        - "172.17.0.1:8924:8080"
        volumes:
        - ./servers.json:/pgadmin4/servers.json

# Maintenance

## Logging

The Elestio Baserow Docker image sends the container logs to stdout. To view the logs, you can use the following command:

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

- <a target="_blank" href="https://github.com/bram2w/baserow">Baserow Github repository</a>

- <a target="_blank" href="https://baserow.io/docs/index">Baserow documentation</a>

- <a target="_blank" href="https://github.com/elestio-examples/baserow">Elestio/Baserow Github repository</a>
