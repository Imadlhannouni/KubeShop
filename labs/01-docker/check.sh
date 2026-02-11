#!/bin/bash
echo "🔍 Checking Lab 01..."

if docker ps --format '{{.Names}}' | grep -q "^catalog$"; then
  echo "✅ Container 'catalog' is running."
else
  echo "❌ Container 'catalog' NOT found."
  exit 1
fi

if curl -s localhost:8080/health | grep -q "OK"; then
  echo "✅ Application is responding on port 8080."
else
  echo "❌ Application NOT healthy on port 8080."
  exit 1
fi

echo "🎉 Lab 01 Complete!"
