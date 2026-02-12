#!/bin/bash
echo "🔍 Checking Lab 31..."

if kubectl get application -n argocd kubeshop > /dev/null 2>&1; then
    echo "✅ Application 'kubeshop' created in ArgoCD."
else
    echo "❌ Application 'kubeshop' NOT found in namespace 'argocd'."
    exit 1
fi

echo "🎉 Lab 31 Complete!"
