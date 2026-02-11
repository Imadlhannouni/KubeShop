#!/bin/bash
echo "🔍 Checking Lab 17..."

# Check Policy Presence
if ! kubectl get netpol allow-frontend-to-catalog > /dev/null 2>&1; then
  echo "❌ Policy 'allow-frontend-to-catalog' NOT found."
  exit 1
fi

# Check Target
TARGET=$(kubectl get netpol allow-frontend-to-catalog -o jsonpath='{.spec.podSelector.matchLabels.app}')
if [ "$TARGET" == "catalog" ]; then
  echo "✅ Policy targets 'app: catalog'."
else
  echo "❌ Policy targets '$TARGET' (expected 'app: catalog')."
  exit 1
fi

# Check Source rule
SOURCE=$(kubectl get netpol allow-frontend-to-catalog -o jsonpath='{.spec.ingress[0].from[0].podSelector.matchLabels.app}')
if [ "$SOURCE" == "frontend" ]; then
  echo "✅ Ingress rule allows 'app: frontend'."
else
  echo "❌ Ingress rule allows '$SOURCE' (expected 'app: frontend')."
  exit 1
fi

echo "🎉 Lab 17 Complete!"
