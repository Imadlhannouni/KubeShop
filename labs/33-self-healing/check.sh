#!/bin/bash
echo "🔍 Checking Lab 33..."

if kubectl get deploy frontend > /dev/null 2>&1; then
    echo "✅ Frontend deployment is present (Self-Healed?)"
else
    echo "❌ Frontend deployment missing. ArgoCD hasn't healed it yet."
    exit 1
fi

echo "🎉 Lab 33 Complete!"
