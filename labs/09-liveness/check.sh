#!/bin/bash
echo "🔍 Checking Lab 09..."

# Check Liveness
if kubectl get deploy catalog-deploy -o jsonpath='{.spec.template.spec.containers[0].livenessProbe.httpGet.path}' | grep -q "/health"; then
  echo "✅ Liveness probe configured."
else
  echo "❌ Liveness probe missing or incorrect path."
  exit 1
fi

# Check Readiness
if kubectl get deploy catalog-deploy -o jsonpath='{.spec.template.spec.containers[0].readinessProbe.httpGet.path}' | grep -q "/health"; then
  echo "✅ Readiness probe configured."
else
  echo "❌ Readiness probe missing or incorrect path."
  exit 1
fi

echo "🎉 Lab 09 Complete!"
