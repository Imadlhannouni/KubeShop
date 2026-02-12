#!/bin/bash
echo "🔍 Checking Lab 36..."

if kubectl get netpol -n monitoring > /dev/null 2>&1; then
    echo "✅ Network Policy found in monitoring namespace."
else
    echo "❌ No Network Policy found in monitoring."
    exit 1
fi

echo "🎉 Lab 36 Complete!"
