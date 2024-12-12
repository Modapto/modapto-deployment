# Deployment of Access Control component

## Overview

Access control component consists of Identity Manager and the User Manager. Identity manager is a configured Keycloak service with Postgres DB and User Manager is a Spring Boot application acting as a wrapper to the Identity Manager to cover the needs of MODAPTO system.

## Table of Contents

1. [Installation](#installation)
2. [Deployment](#deployment)
3. [License](#license)
4. [Contributors](#contributors)

### Installation

Clone the repository:

```sh
git clone https://github.com/Modapto/modapto-deployment.git
cd modapto-deployment/Access Control
```

### Deployment

1. Install or make sure Docker is running

2. Configure the .env for deployment with the parameters required

    ```sh
    POSTGRES_USER=
    POSTGRES_PASSWORD=
    KEYCLOAK_ADMIN_USER=
    KEYCLOAK_ADMIN_PASSWORD=
    PGADMIN_DEFAULT_EMAIL=
    PGADMIN_DEFAULT_PASSWORD=
    HOST_IP=
    MAIL_USERNAME=
    MAIL_PASSWORD=
    ```

3. Deploy Access Control from Docker Compose:

    ```sh
    docker compose up -d
   ```

4. After some time when all services are healthy and available Keycloak admin interface can be accessed at : `http://localhost:9080`.

    Additionally Spring Boot app API can be accessed at : `http://localhost:8093`.

    The corresponding Swagger file can be located at : `http://localhost:8093/api/user-manager/swagger-ui/index.html`.

5. Upload the JSON configuration file under "Keycloak Configuration" folder:

    Upon the initialization of Keycloak container, we implement the following steps to initialize the realm:

    1. Press to create a new Realm

    2. Upload the **Realm-Client Configuration.json**

    3. Press create realm

    To accordingly upload the initial users in the system:

    1. Navigate to Realm Settings

    2. On the top right corner of UI press "Action"

    3. Select "Partial Import"

    4. Upload the **Initial Users Configuration** file

    5. Select the box for user creation and set the resource strategy to overwrite / skip

    6. Press "Import"

    For the created Users you can use the following credentials (username / password):

    1. **CRF User**: crf@test.com / CRF@user123@

    2. **Super Admin**: superadmin@admin.com / S@admin123@

6. To terminate Docker compose simply run:

    ```sh
    docker compose down
    ```

## License

This project has received funding from the European Union's Horizon 2022 research and innovation programm, under Grant Agreement 101091996.

For more details about the licence, see the [LICENSE](LICENSE) file.

## Contributors

- Alkis Aznavouridis (<a.aznavouridis@atc.gr>)
