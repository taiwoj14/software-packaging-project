#!/bin/bash

set -e

echo "Starting artifact validation..."
echo

echo "1. Checking required artifacts..."

artifacts=(
    "artifacts/software-packaging-node-app-1.0.0.tgz"
    "artifacts/software_packaging_django_app-1.0.0-py3-none-any.whl"
    "artifacts/software_packaging_django_app-1.0.0.tar.gz"
    "artifacts/software-packaging-java-app-1.0.0.jar"
)

for artifact in "${artifacts[@]}"; do
    if [ -f "$artifact" ]; then
        echo "PASS: $artifact exists"
    else
        echo "FAIL: $artifact is missing"
        exit 1
    fi
done

echo
echo "2. Verifying SHA-256 checksums..."

sha256sum -c artifacts/checksums.sha256

echo
echo "3. Validating Node.js package..."

tar -tzf artifacts/software-packaging-node-app-1.0.0.tgz > /dev/null
echo "PASS: Node.js package archive is valid"

echo
echo "4. Validating Python packages..."

python -m zipfile -t \
    artifacts/software_packaging_django_app-1.0.0-py3-none-any.whl

echo "PASS: Python wheel archive is valid"

tar -tzf \
    artifacts/software_packaging_django_app-1.0.0.tar.gz > /dev/null

echo "PASS: Python source distribution is valid"

echo
echo "5. Validating Java artifact..."

jar tf artifacts/software-packaging-java-app-1.0.0.jar > /dev/null
echo "PASS: Java JAR archive is valid"

echo
echo "Artifact validation completed successfully."
