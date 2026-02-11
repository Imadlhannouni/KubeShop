#!/bin/bash
echo "🔍 Checking Lab 02..."

# Check network
if docker network ls | grep -q "kubeshop-net"; then
  echo "✅ Network 'kubeshop-net' exists."
else
  echo "❌ Network 'kubeshop-net' missing."
  exit 1
fi

# Check Catalog Alias
if docker inspect catalog | grep -q "kubeshop-net"; then
  echo "✅ Catalog connected to network."
else
  echo "❌ Catalog container not in network."
  exit 1
fi

# Check Frontend Access
if curl -s localhost:3000 | grep -q "Kubernetes T-Shirt"; then
  echo "✅ Frontend successfully fetching products from Catalog!"
else
  echo "❌ Frontend failed to show products. Check CATALOG_URL env var."
  exit 1
fi

echo "🎉 Lab 02 Complete!"
