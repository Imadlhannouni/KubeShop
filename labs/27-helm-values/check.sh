#!/bin/bash
echo "🔍 Checking Lab 27..."

REPLICAS=$(kubectl get deploy frontend -o jsonpath='{.spec.replicas}')

if [ "$REPLICAS" -eq "2" ]; then
    echo "✅ Frontend has 2 replicas (Updated via Helm)."
else
    echo "❌ Frontend has $REPLICAS replicas (Expected 2). Did you update values.yaml and upgrade?"
    exit 1
fi

echo "🎉 Lab 27 Complete!"
