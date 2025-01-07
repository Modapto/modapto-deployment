# modapto-message-bus

## Overview

MODAPTO's Message Bus component is a Kafka Cluster deployment initialized with 3 Brokers and 3 Controllers utilizing KRaft algorithm to select leaders amongst the brokers.

An initial configuration is attached for the Message Bus deployment with some of the utilized topics. Additionally, the deployment comes with a Kafka UI, Kafka REST Proxy and Kafka Schema Registry.

**NOTE:** At the moment only the single broker/controller deployment is supported. This configuration will be used for development purposes and in production the above setup will be configured.

## Table of Contents

1. [Installation](#installation)
2. [Deployment](#deployment)
3. [Usage](#usage)
4. [Contributors](#contributors)

### Installation

Clone the repository:

```sh
git clone https://github.com/Modapto/modapto-deployment.git
cd modapto-deployment/Message Bus
```

### Deployment

1. Install or make sure Docker is running

2. Deploy Kafka Cluster from Docker Compose:

    ```sh
    docker compose up -d --build
   ```

3. After some time Kafka UI will be available on: `http://localhost:8095`.

4. To terminate Docker compose simply run:

    ```sh
    docker compose down
    ```

### Usage

In order to use the Message Bus component configure to connect to : `http://localhost:9092`

Additionally the following services are exposed:

1. `http://localhost:8081` -> Kafka Schema Registry to register the Data Schemas

2. `http://localhost:8082` -> Kafka Rest Proxy to make HTTP requests into Kafka Cluster

## Contributors

- Alkis Aznavouridis (<a.aznavouridis@atc.gr>)
