# Software Packaging in Popular Frameworks

## Project Overview

This project demonstrates software packaging, dependency management, semantic versioning, environment-specific configuration, distributable artifacts, staging verification, and dependency security auditing across three popular software ecosystems:

* Node.js with npm and Express
* Python with Django
* Java with Maven

The goal is to demonstrate how applications can be packaged into reproducible and distributable artifacts, installed or executed in clean staging environments, and verified independently of the original development environment.

---

## Project Objectives

This project demonstrates the following software packaging and DevOps practices:

* Dependency management
* Dependency version pinning
* Semantic versioning
* Application packaging
* Distributable artifact generation
* Environment-specific configuration
* Clean staging environment verification
* Dependency security auditing
* Artifact and audit report management

---

## Project Structure

```text
software-packaging-project/
├── artifacts/
│   ├── checksums.sha256
│   ├── java-dependency-tree.txt
│   ├── java-security-audit.txt
│   ├── node-audit.json
│   ├── python-audit.json
│   ├── software-packaging-java-app-1.0.0.jar
│   ├── software-packaging-node-app-1.0.0.tgz
│   ├── software_packaging_django_app-1.0.0-py3-none-any.whl
│   └── software_packaging_django_app-1.0.0.tar.gz
├── java-app/
├── node-app/
├── python-app/
├── scripts/
│   └── validate_artifacts.sh
├── screenshots/
├── docs/
│   └── RELEASE_NOTES_v1.0.0.md
├── CHANGELOG.md
└── README.md
```

---
# 1. Node.js Packaging

## Framework and Dependency Management

The Node.js application uses Express as its web framework and npm for dependency management.

Application dependencies are defined in `node-app/package.json`.

The Express dependency is specified as:

`express: ^5.2.1`

The dependency lock file is `node-app/package-lock.json`.

The lock file ensures that the required dependency versions can be reproduced consistently during installation.

## Install Dependencies

From the Node.js application directory, dependencies can be installed using:

`npm install`

## Run the Application

The application can be started using:

`npm start`

The application supports environment-specific configuration through environment variables.

For example, a staging environment can be configured using:

`NODE_ENV=staging PORT=3001 node index.js`

This allows the runtime environment and port to be changed without modifying the application source code.

## Create the Package

The Node.js application is packaged using the npm packaging command:

`npm pack`

The generated package is:

`software-packaging-node-app-1.0.0.tgz`

The package was copied to the project's `artifacts/` directory.

## Staging Verification

The generated package was installed into a clean staging directory using:

`npm install ../artifacts/software-packaging-node-app-1.0.0.tgz`

The packaged application was then started using:

`NODE_ENV=staging PORT=3001 node node_modules/software-packaging-node-app/index.js`

The application responded successfully on port `3001` and reported the staging environment.

This verified that the generated package could be installed and executed independently of the original development environment.

## Security Audit

The Node.js dependencies were audited using:

`npm audit`

The audit reported:

`found 0 vulnerabilities`

The audit output was saved to `artifacts/node-audit.json`.

---

# 2. Python/Django Packaging

## Framework and Dependency Management

The Python application uses Django as its web framework.

Python dependencies are pinned in `python-app/requirements.txt`.

The project dependencies include:

* Django `6.1.1`
* asgiref `3.12.1`
* sqlparse `0.6.0`

The project also defines package metadata and dependencies in `python-app/pyproject.toml`.

## Install Dependencies

A Python virtual environment is used to isolate the application's dependencies.

The environment can be created using:

`python3 -m venv .venv`

After creating the virtual environment, it can be activated using:

`source .venv/bin/activate`

Dependencies can then be installed using:

`pip install -r requirements.txt`

## Run the Development Application

The Django development application can be started using:

`python manage.py runserver`

## Build Configuration and Distributable Packages

The Python application uses `pyproject.toml` for modern Python packaging configuration and includes `setup.py` for build configuration compatibility.

Python packages can be built using:

`python -m build`

The project also supports building with:

`python setup.py sdist bdist_wheel`

The build process generates the following packages:

* `software_packaging_django_app-1.0.0-py3-none-any.whl`
* `software_packaging_django_app-1.0.0.tar.gz`

The generated packages were copied to the project's `artifacts/` directory.

## Staging Verification

A clean staging virtual environment was created and the generated wheel package was installed using:

`pip install artifacts/software_packaging_django_app-1.0.0-py3-none-any.whl`

The packaged application was then started on port `8001` using:

`DJANGO_SETTINGS_MODULE=config.settings django-admin runserver 127.0.0.1:8001`

The application responded successfully and displayed:

**Django application is running successfully.**

**Framework:** Django

**Version:** 1.0.0

This confirmed that the packaged Django application could be installed and executed successfully in a separate staging environment.

## Security Audit

The Python dependencies were audited using:

`pip-audit`

The audit reported:

**No known vulnerabilities found**

The audit report was saved to:

`artifacts/python-audit.json`

The local project package itself was skipped by `pip-audit` because it is not published on PyPI.

Therefore, the audit result applies to the auditable installed dependencies.

---

# 3. Java/Maven Packaging

## Build and Dependency Management

The Java application uses Maven for project management, dependency management, and packaging.

Project metadata and build configuration are defined in:

`java-app/pom.xml`

The application version is:

`1.0.0`

## Build the Application

The Java application was built using:

`mvn clean package`

Maven successfully generated:

`target/software-packaging-java-app-1.0.0.jar`

## Run the Packaged JAR

The packaged application can be executed using:

`java -jar target/software-packaging-java-app-1.0.0.jar`

The application produced the following output:

**Software Packaging Project**

**Java application is running successfully.**

**Framework:** Maven

**Version:** 1.0.0

## Staging Verification

The generated JAR was copied into a clean staging directory and executed independently using:

`java -jar software-packaging-java-app-1.0.0.jar`

The packaged application ran successfully.

This confirmed that the generated JAR could be executed independently from the original Maven build directory.

## Dependency Tree

The Maven dependency tree was generated and saved to:

`artifacts/java-dependency-tree.txt`

The application does not contain application-level external dependencies.

## Security Audit

OWASP Dependency-Check was attempted using:

`mvn org.owasp:dependency-check-maven:check`

The scan was inconclusive because the NVD database update required a valid NVD API key.

The resulting log was saved to:

`artifacts/java-security-audit.txt`

The Java application should therefore not be described as vulnerability-free based on this scan.

---

# 4. Semantic Versioning

All three applications use Semantic Versioning (SemVer):

`MAJOR.MINOR.PATCH`

## Current Project Versions

| Application   | Version |
| ------------- | ------- |
| Node.js       | `1.0.0` |
| Python/Django | `1.0.0` |
| Java/Maven    | `1.0.0` |

## Version Components

| Component | Meaning                           |
| --------- | --------------------------------- |
| MAJOR     | Incompatible or breaking changes  |
| MINOR     | Backward-compatible functionality |
| PATCH     | Backward-compatible bug fixes     |

Semantic versioning allows package consumers and build systems to understand the significance of application changes.

## Release Documentation

Version `1.0.0` is documented in:

`CHANGELOG.md`

Release-specific information is documented in:

`docs/RELEASE_NOTES_v1.0.0.md`

The changelog records project changes by version, while the release notes describe the contents and validation status of the `1.0.0` release.

---

# 5. Environment-Specific Configuration

The applications demonstrate separation between application code and environment-specific runtime configuration.

## Node.js

The Node.js application uses environment variables:

`NODE_ENV=staging`

`PORT=3001`

The packaged application was verified in a staging environment without modifying the application source code.

## Python/Django

The Django application was installed into a separate staging virtual environment and executed on:

`127.0.0.1:8001`

This demonstrates the ability to install and execute the packaged application independently from the original development environment.

## Java

The Java JAR was copied to a separate staging directory and executed independently from the Maven build directory.

---

# 6. Security Audit Summary

| Ecosystem | Security Tool          | Result                                                      |
| --------- | ---------------------- | ----------------------------------------------------------- |
| Node.js   | npm audit              | 0 vulnerabilities found                                     |
| Python    | pip-audit              | No known vulnerabilities found for auditable dependencies   |
| Java      | OWASP Dependency-Check | Inconclusive due to NVD API key/database update requirement |

The security audit reports are stored in the `artifacts/` directory.

---

# 7. Generated Artifacts

The project produces the following distributable artifacts.

## Node.js

`artifacts/software-packaging-node-app-1.0.0.tgz`

## Python/Django

`artifacts/software_packaging_django_app-1.0.0-py3-none-any.whl`

`artifacts/software_packaging_django_app-1.0.0.tar.gz`

## Java/Maven

`artifacts/software-packaging-java-app-1.0.0.jar`

Supporting dependency and security reports are also stored in the `artifacts/` directory.

---
# 8. Artifact Integrity Verification

SHA-256 checksums are generated for all primary distributable artifacts to provide integrity  verification.

The checksum file is:

`artifacts/checksums.sha256`

Checksums are generated using:

`sha256sum artifacts/software-packaging-node-app-1.0.0.tgz artifacts/software_packaging_django_app-1.0.0-py3-none-any.whl artifacts/software_packaging_django_app-1.0.0.tar.gz artifacts/software-packaging-java-app-1.0.0.jar > artifacts/checksums.sha256`

Artifact integrity is verified using:

`sha256sum -c artifacts/checksums.sha256`

All four artifacts successfully returned:

`OK`

This confirms that the packaged artifacts match the recorded SHA-256 checksums at the time of verification.

---

# 9. Testing and Validation

The project includes an automated artifact validation script:

`scripts/validate_artifacts.sh`

The validation script checks:

* Required artifacts exist
* SHA-256 checksums match
* Node.js package archive is valid
* Python wheel archive is valid
* Python source distribution is valid
* Java JAR archive is valid

The validation process is executed using:

`./scripts/validate_artifacts.sh`

The validation completed successfully for all packaged artifacts.

This provides a repeatable validation process for confirming artifact availability, integrity, and archive validity before distribution.

---

# 10. Verification Summary

Each packaged application was independently verified after packaging.

| Application       | Package Format    | Staging Verification | Security Audit                                      |
| ----------------- | ----------------- | -------------------- | --------------------------------------------------- |
| Node.js / Express | `.tgz`            | Successful           | 0 vulnerabilities                                   |
| Python / Django   | `.whl`, `.tar.gz` | Successful           | No known vulnerabilities for auditable dependencies |
| Java / Maven      | `.jar`            | Successful           | Inconclusive                                        |

The staging tests demonstrate that the generated artifacts can be installed or executed independently of the original development environment.

---

# 11. Tools Used

| Category         | Tools                              |
| ---------------- | ---------------------------------- |
| JavaScript       | Node.js, npm, Express              |
| Python           | Python, Django, pip, setuptools    |
| Python Packaging | Python Build, setuptools, setup.py |
| Python Security  | pip-audit                          |
| Java             | Java, Maven                        |
| Java Security    | OWASP Dependency-Check             |
| Version Control  | Git                                |
| Operating System | Linux / Ubuntu                     |

---

# 12. Project Workflow

The overall software packaging workflow is:

**Source Code**

↓

**Dependency Management**

↓

**Semantic Versioning**

↓

**Package / Build**

↓

**Distributable Artifact**

↓

**Clean Staging Environment**

↓

**Installation / Execution**

↓

**Application Verification**

↓

**Security Audit**

This workflow demonstrates a practical approach to packaging and validating applications before they are distributed or deployed.

---

# Conclusion

This project demonstrates a complete software packaging workflow across Node.js, Python/Django, and Java/Maven.

The project covers:

1. Dependency definition and management
2. Dependency version pinning
3. Semantic versioning
4. Distributable package creation
5. Environment-specific configuration
6. Clean staging installation and execution
7. Artifact verification
8. Dependency security auditing

The resulting artifacts and supporting audit reports provide evidence that the applications were packaged, tested, and evaluated as part of a reproducible software delivery workflow.

