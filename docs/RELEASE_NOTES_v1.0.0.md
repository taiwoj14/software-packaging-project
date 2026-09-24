# Release Notes — Version 1.0.0

**Release Date:** September 24, 2026

## Overview

Version 1.0.0 is the initial release of the Software Packaging project. The project demonstrates software packaging, dependency management, artifact generation, staging verification, security auditing, versioning, and artifact integrity validation across Node.js, Python, and Java applications.

## Included Packages

### Node.js

- Package: `software-packaging-node-app`
- Version: `1.0.0`
- Artifact: `software-packaging-node-app-1.0.0.tgz`

### Python

- Package: `software_packaging_django_app`
- Version: `1.0.0`
- Wheel: `software_packaging_django_app-1.0.0-py3-none-any.whl`
- Source distribution: `software_packaging_django_app-1.0.0.tar.gz`
- Build configuration: `setup.py` and `pyproject.toml`

### Java

- Package: `software-packaging-java-app`
- Version: `1.0.0`
- Artifact: `software-packaging-java-app-1.0.0.jar`

## Validation

The release includes:

- SHA-256 checksum generation.
- SHA-256 checksum verification.
- Artifact existence validation.
- Node.js package archive validation.
- Python wheel validation.
- Python source distribution validation.
- Java JAR validation.

All packaged artifacts successfully passed the validation process.

## Security and Dependency Auditing

The project includes dependency and security audit reports for the supported applications.

## Artifact Management

All release artifacts are stored in the `artifacts/` directory together with the SHA-256 checksum file used for integrity verification.
