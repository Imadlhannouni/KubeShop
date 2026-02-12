#!/bin/bash
echo "🔍 Checking Lab 30..."

# Check Namespace
if ! kubectl get ns argocd > /dev/null 2>&1; then
    echo "❌ Namespace 'argocd' not found."
    exit 1
fi

# Check Server Pod
if kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server | grep Running > /dev/null 2>&1; then
    echo "✅ ArgoCD Server is running."
else
    echo "❌ ArgoCD Server not running yet. Wait a moment or check installation."
    exit 1
fi

echo "🎉 Lab 30 Complete!"
