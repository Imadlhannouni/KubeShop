#!/bin/bash
echo "🔍 Checking Lab 23..."

STATUS=$(kubectl get pvc task-pv-claim -o jsonpath='{.status.phase}')

if [ "$STATUS" == "Bound" ]; then
  echo "✅ PVC is Bound."
else
  echo "❌ PVC status is '$STATUS' (expected Bound)."
  exit 1
fi

echo "🎉 Lab 23 Complete!"
