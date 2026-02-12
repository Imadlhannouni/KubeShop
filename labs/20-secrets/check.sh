#!/bin/bash
echo "🔍 Checking Lab 20..."

# Check Secret
if ! kubectl get secret payment-secret > /dev/null 2>&1; then
  echo "❌ Secret 'payment-secret' NOT found."
  exit 1
fi

# Check if Order pod is running (might need to start it)
if ! kubectl get pod -l app=order > /dev/null 2>&1; then
  echo "⚠️ Order pod not found. Trying to start it..."
  kubectl apply -f solution.yaml
  sleep 5
fi

# Check usage
POD=$(kubectl get pod -l app=order -o jsonpath="{.items[0].metadata.name}")
SECRET_REF=$(kubectl get pod $POD -o jsonpath="{.spec.containers[0].env[0].valueFrom.secretKeyRef.name}")

if [ "$SECRET_REF" == "payment-secret" ]; then
  echo "✅ Order service is using Secret 'payment-secret'."
else
  echo "❌ Order service is NOT using the Secret. Found ref: '$SECRET_REF'"
  exit 1
fi

echo "🎉 Lab 20 Complete!"
