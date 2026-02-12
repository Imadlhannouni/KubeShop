#!/bin/bash
echo "🔍 Checking Lab 19..."

# Check ConfigMap
if ! kubectl get cm app-config > /dev/null 2>&1; then
  echo "❌ ConfigMap 'app-config' NOT found."
  exit 1
fi

# Check Pod Usage
POD=$(kubectl get pod -l app=frontend -o jsonpath="{.items[0].metadata.name}")
ENV_REF=$(kubectl get pod $POD -o jsonpath="{.spec.containers[0].env[0].valueFrom.configMapKeyRef.name}")

if [ "$ENV_REF" == "app-config" ]; then
  echo "✅ Frontend is using ConfigMap 'app-config'."
else
  echo "❌ Frontend is NOT using the ConfigMap. Found ref: '$ENV_REF'"
  exit 1
fi

echo "🎉 Lab 19 Complete!"
