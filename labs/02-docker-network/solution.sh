#!/bin/bash

# 1. Create Network
docker network create kubeshop-net

# 2. Run Catalog (attached to network)
# Note: We reuse the image from Lab 01
docker run -d \
  --network kubeshop-net \
  --name catalog \
  --network-alias catalog \
  kubeshop/catalog:v1

# 3. Build Frontend
cd ../../src/frontend
docker build -t kubeshop/frontend:v1 .

# 4. Run Frontend (attached to network, pointing to catalog)
docker run -d \
  -p 3000:3000 \
  --network kubeshop-net \
  -e CATALOG_URL="http://catalog:8080" \
  kubeshop/frontend:v1

echo "Frontend is running at http://localhost:3000"
