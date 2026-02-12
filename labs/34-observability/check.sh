#!/bin/bash
echo "🔍 Checking Lab 34..."

if helm list -n monitoring | grep -q "kube-prometheus-stack"; then
    echo "✅ Kube-Prometheus-Stack installed."
else
    echo "❌ Helm release not found in 'monitoring' namespace."
    exit 1
fi

echo "🎉 Lab 34 Complete!"
