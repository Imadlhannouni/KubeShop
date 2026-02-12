#!/bin/bash
echo "🔍 Checking Lab 26..."

if helm list | grep -q "kubeshop"; then
    echo "✅ Helm release 'kubeshop' found."
else
    echo "❌ Helm release 'kubeshop' NOT found. Did you run 'helm install kubeshop ./charts/kubeshop'?"
    exit 1
fi

echo "🎉 Lab 26 Complete!"
