#!/bin/bash
echo "🔍 Checking Lab 21..."

# Check Volume
POD=$(kubectl get pod -l app=order -o jsonpath="{.items[0].metadata.name}")
VOL_TYPE=$(kubectl get pod $POD -o jsonpath="{.spec.volumes[0].emptyDir}")

if [ -n "$VOL_TYPE" ]; then
  echo "✅ EmptyDir volume found."
else
  echo "❌ No emptyDir volume found."
  exit 1
fi

echo "🎉 Lab 21 Complete!"
