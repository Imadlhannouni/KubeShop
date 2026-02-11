#!/bin/bash
echo "🔍 Checking Lab 11..."

# Check Service
if kubectl get svc catalog-service > /dev/null 2>&1; then
  echo "✅ Service 'catalog-service' found."
else
  echo "❌ Service 'catalog-service' NOT found."
  exit 1
fi

# Check Type
TYPE=$(kubectl get svc catalog-service -o jsonpath='{.spec.type}')
if [ "$TYPE" == "ClusterIP" ]; then
  echo "✅ Service type is ClusterIP."
else
  echo "❌ Service type is $TYPE (expected ClusterIP)."
  exit 1
fi

# Check Endpoints (Are pods connected?)
EPS=$(kubectl get endpoints catalog-service -o jsonpath='{.subsets[*].addresses[*].ip}' | wc -w)
if [ "$EPS" -gt "0" ]; then
  echo "✅ Service has $EPS endpoints (Pods connected)."
else
  echo "❌ Service has NO endpoints. Check your selector 'app: catalog'."
  exit 1
fi

echo "🎉 Lab 11 Complete!"
