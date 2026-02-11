#!/bin/bash
echo "🔍 Checking Lab 05..."

# Check RS
if kubectl get rs catalog-rs > /dev/null 2>&1; then
  echo "✅ ReplicaSet 'catalog-rs' found."
else
  echo "❌ ReplicaSet 'catalog-rs' NOT found."
  exit 1
fi

# Check Pod Count
COUNT=$(kubectl get pods -l app=catalog --field-selector=status.phase=Running --no-headers | wc -l)
if [ "$COUNT" -eq "3" ]; then
  echo "✅ Found 3 Running pods managed by RS."
else
  echo "❌ Found $COUNT Running pods (expected 3)."
  exit 1
fi

echo "🎉 Lab 05 Complete!"
