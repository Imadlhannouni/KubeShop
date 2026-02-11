#!/bin/bash
echo "🔍 Checking Lab 04..."

# Check Pod
if ! kubectl get pod catalog-sidecar > /dev/null 2>&1; then
  echo "❌ Pod 'catalog-sidecar' NOT found."
  exit 1
fi

# Check Container Count
COUNT=$(kubectl get pod catalog-sidecar -o jsonpath='{.spec.containers[*].name}' | wc -w)
if [ "$COUNT" -eq "2" ]; then
  echo "✅ Found 2 containers in the pod."
else
  echo "❌ Found $COUNT containers (expected 2: catalog and sidecar)."
  exit 1
fi

# Check Sidecar Image
IMAGE=$(kubectl get pod catalog-sidecar -o jsonpath='{.spec.containers[?(@.name=="sidecar")].image}')
if [[ "$IMAGE" == *"busybox"* ]]; then
  echo "✅ Sidecar is using busybox."
else
  echo "❌ Sidecar image is '$IMAGE' (expected busybox)."
  exit 1
fi

echo "🎉 Lab 04 Complete!"
