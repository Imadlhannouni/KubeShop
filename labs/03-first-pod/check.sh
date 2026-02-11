#!/bin/bash
echo "🔍 Checking Lab 03..."

# Check Pod Existence
if kubectl get pod catalog-pod > /dev/null 2>&1; then
  echo "✅ Pod 'catalog-pod' found."
else
  echo "❌ Pod 'catalog-pod' NOT found. Did you run 'kubectl apply -f pod.yaml'?"
  exit 1
fi

# Check Pod Status
STATUS=$(kubectl get pod catalog-pod -o jsonpath='{.status.phase}')
if [ "$STATUS" == "Running" ]; then
  echo "✅ Pod is RUNNING."
else
  echo "❌ Pod status is $STATUS (expected Running)."
  exit 1
fi

echo "🎉 Lab 03 Complete!"
