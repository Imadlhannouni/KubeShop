#!/bin/bash
echo "🔍 Checking Lab 22..."

if kubectl get pv task-pv-volume > /dev/null 2>&1; then
  echo "✅ PersistentVolume 'task-pv-volume' found."
else
  echo "❌ PV 'task-pv-volume' NOT found."
  exit 1
fi

echo "🎉 Lab 22 Complete!"
