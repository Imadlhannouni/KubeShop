#!/bin/bash
echo "🔍 Checking Final Exam..."

ERRORS=0

# 1. Check Service
if ! kubectl get svc catalog-service > /dev/null 2>&1; then
    echo "❌ Catalog Service matches missing."
    ((ERRORS++))
fi

# 2. Check replicas
REPLICAS=$(kubectl get deploy frontend -o jsonpath='{.spec.replicas}')
if [ "$REPLICAS" -eq "0" ]; then
    echo "❌ Frontend is scaled to 0."
    ((ERRORS++))
fi

# 3. Check ConfigMap
URL=$(kubectl get cm app-config -o jsonpath='{.data.catalog\.url}')
if [ "$URL" != "http://catalog-service" ]; then
    echo "❌ ConfigMap is corrupted: $URL"
    ((ERRORS++))
fi

if [ "$ERRORS" -eq "0" ]; then
    echo "🎉 CONGRATULATIONS! You passed the Final Exam!"
else
    echo "⚠️ System is still broken. $ERRORS issues found."
    exit 1
fi
