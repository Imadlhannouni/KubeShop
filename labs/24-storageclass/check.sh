#!/bin/bash
echo "🔍 Checking Lab 24..."

POD=$(kubectl get pod -l app=order -o jsonpath="{.items[0].metadata.name}")
PVC_REF=$(kubectl get pod $POD -o jsonpath="{.spec.volumes[0].persistentVolumeClaim.claimName}")

if [ "$PVC_REF" == "task-pv-claim" ]; then
  echo "✅ Pod is using the PVC."
else
  echo "❌ Pod is NOT using the PVC. Found: '$PVC_REF'"
  exit 1
fi

echo "🎉 Lab 24 Complete!"
