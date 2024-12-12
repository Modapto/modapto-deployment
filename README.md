# modapto-deployment

## Overview

This repository contains all the deployments for the MODAPTO system for the components that can be dockerized. Each partner must include docker compose files with the respective environmental variables.

## Documentation

Each partner must provide in a separate README.md file the process for deploying the component. In case there are some environmental variables that must be filled in, make sure you include it in the README.md file. Example given below:

1. Complete the .env missing fields

   ```sh
   HOST_IP=...
   PORT=...
   etc.
   ```

2. Deployment options

   ```sh
    docker compose --profile all up -d
   ```

3. Connection options

    Make sure you include all the connectivity options and in which URL/PORT the interface/service can be located. Example given below:

    ```sh
        Access UI on http://localhost:3000

        or

        Access Message Bus on http://localhost:9092
    ```

It is preferred to have a unique docker network among MODAPTO components so we can access them directly with the container name. For that case, we suggest that we utilize network "modapto" for services that must be connected inside the deployment plan.

   ```sh
     networks:
      - kafka
      - modapto

    ...

    networks:
        kafka:
            driver: bridge
        modapto:
            driver: bridge -> *
            
           * -> This eventually will be a created as a docker network under the Host environment so it will be changed in "external: true"
   ```

To create a new network just execute the following command in the deployment environment:

  ```sh
    docker network create --driver bridge modapto
   ```

## License

This project has received funding from the European Union's Horizon 2022 research and innovation programm, under Grant Agreement 101091996.

For more details about the licence, see the [LICENSE](LICENSE) file.

## Contributors

- Alkis Aznavouridis (<a.aznavouridis@atc.gr>)
