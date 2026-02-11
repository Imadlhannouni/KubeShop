#!/bin/bash
echo "🔍 Checking Lab 16..."

# Check Policy
if kubectl get netpol default-deny-all > /dev/null 2>&1; then
  echo "✅ NetworkPolicy 'default-deny-all' found."
else
  echo "❌ NetworkPolicy 'default-deny-all' NOT found."
  exit 1
fi

echo "🎉 Lab 16 Complete!"
