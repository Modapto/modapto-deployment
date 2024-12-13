# modapto-notification-center

## Overview

Notification center is responsible for notifying users in MODAPTO regarding events from MODAPTO modules or Smart Services and assignments that can be created between two users.

Notification Center is connected with User Inteface, Production Knowledge Base and Message Bus to facilitate such operations.

It is based on Java Spring Boot framework utilizing Java 21. At the moment all endpoints require no authentication - JWT tokens / CSRF token.

## Table of Contents

1. [Installation](#installation)
2. [Usage](#usage)
3. [Deployment](#deployment)
4. [Contributors](#contributors)

### Installation

Create a .env file or fill in the following variables in the `docker-compose.yml` file

```sh
    SERVER_PORT=${APP_PORT}
    ELASTICSEARCH_URL=${ELASTICSEARCH_URL}
    ELASTIC_USERNAME=${ELASTIC_USERNAME}
    ELASTIC_PASSWORD=${ELASTIC_PASSWORD}
    KEYCLOAK_REALM_URL=${KEYCLOAK_REALM_URL}
    KEYCLOAK_CLIENT=modapto
    KEYCLOAK_CLIENT_SECRET=${KEYCLOAK_CLIENT_SECRET}
    USER_MANAGER_URL=
    KAFKA_BROKERS_URL=
```

### Usage

1. Run the application after Keycloak is deployed

2. The application will start on `http://localhost:8091`.

3. Access the OpenAPI documentation at `http://localhost:8091/api/notification-center/swagger-ui/index.html`.

### Deployment

1. Ensure Docker is installed and running.

2. Run:

    ```sh
    docker compose up -d
    ```

3. Stop the Deployment:

    ```sh
    docker compose down
    ```

## Contributors

- Alkis Aznavouridis (<a.aznavouridis@atc.gr>)
