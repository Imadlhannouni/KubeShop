# Lab 02: Docker Networking

## Objective
Containers need to talk to each other. We will run the **Frontend** and **Catalog** services and connect them.

## The Task
1.  Create a docker network named `kubeshop-net`.
2.  Run the **Catalog** service in this network with the alias `catalog`.
3.  Build the **Frontend** image (`src/frontend`) as `kubeshop/frontend:v1`.
4.  Run the **Frontend** service in the same network.
5.  Pass the environment variable `CATALOG_URL=http://catalog:8080` to the Frontend so it can find the Catalog.
6.  Access the Frontend at `localhost:3000`.

## Commands
-   `docker network create ...`
-   `docker run --network ... --env ...`

## Verification
Open your browser or curl `localhost:3000`. You should see the HTML page listing products fetched from the Catalog.
