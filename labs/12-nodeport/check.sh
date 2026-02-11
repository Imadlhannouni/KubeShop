#!/bin/bash
echo "🔍 Checking Lab 12..."

# Check Service
if ! kubectl get svc frontend-service > /dev/null 2>&1; then
  echo "❌ Service 'frontend-service' NOT found."
  exit 1
fi

# Check Type
TYPE=$(kubectl get svc frontend-service -o jsonpath='{.spec.type}')
if [ "$TYPE" == "NodePort" ]; then
  echo "✅ Service type is NodePort."
else
  echo "❌ Service type is $TYPE (expected NodePort)."
  exit 1
fi

echo "🎉 Lab 12 Complete! Try opening http://localhost:30080 (or minikube ip:30080)"
