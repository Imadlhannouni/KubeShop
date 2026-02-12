#!/bin/bash
echo "🔍 Checking Lab 28..."

IMG=$(kubectl get deploy frontend -o jsonpath='{.spec.template.spec.containers[0].image}')

if [[ "$IMG" == *"v2"* ]]; then
    echo "✅ Frontend is running image '$IMG' (Deployed via CI)."
else
    echo "❌ Frontend is running image '$IMG'. Did you run ./ci.sh v2?"
    exit 1
fi

echo "🎉 Lab 28 Complete!"
