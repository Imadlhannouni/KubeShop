#!/bin/bash
echo "😈 UNLEASHING CHAOS..."

# 1. Kill the Catalog Service
kubectl delete svc catalog-service

# 2. Scale Frontend to 0
kubectl scale deploy frontend --replicas=0

# 3. Corrupt ConfigMap
kubectl patch cm app-config -p '{"data": {"catalog.url": "http://evil-site.com"}}'

echo "🔥 Chaos complete. The cluster is broken. Fix it!"
