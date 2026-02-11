#!/bin/bash
echo "🔍 Checking Lab 14..."

# Check Ingress
if ! kubectl get ingress kubeshop-ingress > /dev/null 2>&1; then
  echo "❌ Ingress 'kubeshop-ingress' NOT found."
  exit 1
fi

# Check Host
HOST=$(kubectl get ingress kubeshop-ingress -o jsonpath='{.spec.rules[0].host}')
if [ "$HOST" == "kubeshop.local" ]; then
  echo "✅ Ingress Host is set to 'kubeshop.local'."
else
  echo "❌ Ingress Host is '$HOST' (expected kubeshop.local)."
  exit 1
fi

echo "🎉 Lab 14 Complete!"
