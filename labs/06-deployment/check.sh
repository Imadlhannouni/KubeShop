#!/bin/bash
echo "🔍 Checking Lab 06..."

# Check Deployment
if kubectl get deploy catalog-deploy > /dev/null 2>&1; then
  echo "✅ Deployment 'catalog-deploy' found."
else
  echo "❌ Deployment 'catalog-deploy' NOT found."
  exit 1
fi

# Check Replicas (Ready)
READY=$(kubectl get deploy catalog-deploy -o jsonpath='{.status.readyReplicas}')
if [ "$READY" -eq "3" ]; then
  echo "✅ 3/3 Replicas are Ready."
else
  echo "❌ Only $READY/3 Replicas are Ready."
  exit 1
fi

echo "🎉 Lab 06 Complete!"
