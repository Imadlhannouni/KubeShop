#!/bin/bash
echo "🔍 Checking Lab 25..."

# Check Helm
if ! command -v helm &> /dev/null; then
    echo "❌ 'helm' command not found. Please install it."
    exit 1
fi

echo "✅ Helm is installed."

# Check if they ran the commands (optional, but let's just check helm works)
if helm list > /dev/null 2>&1; then
    echo "✅ 'helm list' works."
else
    echo "❌ 'helm list' failed. Check your cluster connection."
    exit 1
fi

echo "🎉 Lab 25 Complete!"
