# modapto-api-gateway

## Overview

API Gateway utilizes Traefik reverse proxy to route specific domains / subdomains to MODAPTO components.

## Table of Contents

1. [Installation](#installation)
2. [Deployment](#deployment)
3. [Usage](#usage)
4. [Contributors](#contributors)

### Installation

Clone the repository:

```sh
git clone https://github.com/Modapto/modapto-deployment.git
cd modapto-deployment/Api Gateway
```

### Deployment

1. Install or make sure Docker is running

2. Create a hashed password for a specific user and update the traefik_dynamic.toml file under the config folder with the following:

     ```sh
    # Generate a hashed password using htpasswd
    htpasswd -nb [user] [password]

    # Copy the generated password and configure the dynamic config
    [hostPath] = URL of the Traefic Dashboard (if enabled)
    [user]:[hashedPassword] = Copy the contents of the generated hashed value

    # Configure your email on traefik.toml
    [email]: Your personal email

   ```

3. Deploy API Gateway from Docker Compose:

    ```sh
    docker compose up -d
   ```

4. After some time Traefik dashboard will be available on: `https://[hostPath]`.

5. To terminate Docker compose simply run:

    ```sh
    docker compose down
    ```

### Usage

For each new component that will de deployed through API Gateway we must define the following labels in each docker compose configuration:

```sh
    - traefik.http.routers.[containerName].rule=Host(`[desiredURLPath]`)
    - traefik.http.routers.[containerName].tls=true
    - traefik.http.routers.[containerName].tls.certresolver=lets-encrypt
    - traefik.port=[containerExposePort]
```

## Contributors

- Alkis Aznavouridis (<a.aznavouridis@atc.gr>)
