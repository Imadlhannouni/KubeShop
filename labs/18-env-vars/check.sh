#!/bin/bash
echo "🔍 Checking Lab 18..."

# Get Pod Name
POD=$(kubectl get pod -l app=frontend -o jsonpath="{.items[0].metadata.name}")

if [ -z "$POD" ]; then
  echo "❌ No Frontend pod found. Did you apply the deployment?"
  exit 1
fi

# Check Env Var
ENV=$(kubectl exec $POD -- env | grep CATALOG_URL)

if [[ "$ENV" == *"http://catalog-service"* ]]; then
  echo "✅ CATALOG_URL is set correctly: $ENV"
else
  echo "❌ CATALOG_URL is missing or wrong. Found: '$ENV'"
  exit 1
fi

echo "🎉 Lab 18 Complete!"
