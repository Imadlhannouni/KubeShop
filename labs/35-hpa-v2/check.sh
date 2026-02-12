#!/bin/bash
echo "🔍 Checking Lab 35..."

if kubectl get hpa frontend-hpa > /dev/null 2>&1; then
    echo "✅ HPA 'frontend-hpa' found."
else
    echo "❌ HPA not found."
    exit 1
fi

echo "🎉 Lab 35 Complete!"
