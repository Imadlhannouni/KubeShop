#!/bin/bash
echo "🔍 Checking Lab 32..."

# We check if the user modified the chart file locally OR applied it
# Let's check the *Chart file* since they might not urge to push to git yet.
FILE="charts/kubeshop/templates/frontend-deployment.yaml"

if grep -q "argocd.argoproj.io/sync-wave" "$FILE" 2>/dev/null; then
    echo "✅ Sync Wave annotation found in Chart."
elif kubectl get deploy frontend -o yaml | grep -q "argocd.argoproj.io/sync-wave"; then
    echo "✅ Sync Wave annotation found on live Deployment."
else
    echo "❌ Annotation not found. Add 'argocd.argoproj.io/sync-wave' to metadata.annotations."
    exit 1
fi

echo "🎉 Lab 32 Complete!"
