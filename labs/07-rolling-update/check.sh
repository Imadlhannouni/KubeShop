#!/bin/bash
echo "🔍 Checking Lab 07..."

# Check Image Version
IMAGE=$(kubectl get deploy catalog-deploy -o jsonpath='{.spec.template.spec.containers[0].image}')
if [ "$IMAGE" == "kubeshop/catalog:v2" ]; then
  echo "✅ Deployment is using image 'v2'."
else
  echo "❌ Deployment is using '$IMAGE' (expected v2)."
  exit 1
fi

# Check Rollout Status
if kubectl rollout status deploy/catalog-deploy --timeout=10s > /dev/null; then
  echo "✅ Rollout is complete."
else
  echo "❌ Rollout is not complete or failed."
  exit 1
fi

echo "🎉 Lab 07 Complete!"
