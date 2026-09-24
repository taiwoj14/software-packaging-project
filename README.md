cat > README.md <<'EOF'
# Software Packaging in Popular Frameworks

## Project Overview

This project demonstrates software packaging, dependency management,
semantic versioning, environment-specific configuration, distributable
artifacts, staging verification, and dependency security auditing across
three popular software ecosystems:

- Node.js with npm and Express
- Python with Django
- Java with Maven

The goal is to demonstrate how applications can be packaged into
reproducible and distributable artifacts and then verified in clean
staging environments.

## Project Structure

```text
software-packaging-project/
├── artifacts/
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
├── screenshots/
└── README.md

## 1. Node.js Packaging
## Framework and Dependency Management
The Node.js application uses Express as its web framework.

Dependencies are defined in package.json:

"dependencies": {
  "express": "^5.2.1"
}

The dependency lock file is:

node-app/package-lock.json

## Install Dependencies

cd node-app
npm install

## Run the Application

npm start

The application supports environment-specific configuration using
environment variables:

NODE_ENV=staging PORT=3001 node index.js

## Create the Package

npm pack

Generated package:

software-packaging-node-app-1.0.0.tgz

The package was installed into a clean staging directory and verified
successfully.

## Staging Verification

npm install ../artifacts/software-packaging-node-app-1.0.0.tgz
NODE_ENV=staging PORT=3001 node node_modules/software-packaging-node-app/index.js

The application responded successfully on port 3001 and reported the
staging environment.

## Security Audit

npm audit

Result:

found 0 vulnerabilities

Audit output was saved to:

artifacts/node-audit.json

## 2. Python/Django Packaging
# Framework and Dependency Management

The Python application uses Django.

Dependencies are pinned in:

python-app/requirements.txt

Example:

Django==6.1.1
asgiref==3.12.1
sqlparse==0.6.0

The project also defines package metadata and dependencies in:

python-app/pyproject.toml

## Install Dependencies

python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

## Run Development Application

python manage.py runserver

## Build Distributable Packages

python -m build

This generated:

software_packaging_django_app-1.0.0-py3-none-any.whl
software_packaging_django_app-1.0.0.tar.gz

The generated packages were copied to:

artifacts/

## Staging Verification

A clean staging virtual environment was created and the wheel package
was installed:

pip install artifacts/software_packaging_django_app-1.0.0-py3-none-any.whl

The packaged application was then started on port 8001:

DJANGO_SETTINGS_MODULE=config.settings django-admin runserver 127.0.0.1:8001

The application responded successfully and displayed:

Django application is running successfully.
Framework: Django
Version: 1.0.0

## Security Audit

pip-audit

Result:

No known vulnerabilities found

The audit report was saved to:

artifacts/python-audit.json

The local project package itself was skipped by pip-audit because it is
not published on PyPI. The audit result therefore applies to the
auditable installed dependencies.

## 3. Java/Maven Packaging

# Framework and Dependency Management

The Java application uses Maven for build and dependency management.

Project metadata and build configuration are defined in:

java-app/pom.xml

The application version is:

1.0.0

## Build the Application

mvn clean package

Maven successfully generated:

target/software-packaging-java-app-1.0.0.jar

## Run the Packaged JAR

java -jar target/software-packaging-java-app-1.0.0.jar

Output:

Software Packaging Project
Java application is running successfully.
Framework: Maven
Version: 1.0.0

## Staging Verification

The generated JAR was copied into a clean staging directory and
executed independently:

java -jar software-packaging-java-app-1.0.0.jar

The packaged application ran successfully.

## Dependency Tree

The Maven dependency tree was saved to:

artifacts/java-dependency-tree.txt

The application does not contain application-level external
dependencies.

## Security Audit

OWASP Dependency-Check was attempted with:

mvn org.owasp:dependency-check-maven:check

The scan was inconclusive because the NVD database update required a
valid NVD API key.

The resulting log was saved to:

artifacts/java-security-audit.txt

Therefore, the Java application should not be described as
vulnerability-free based on this scan.

## 4. Semantic Versioning

All three applications use semantic versioning:

MAJOR.MINOR.PATCH

Current project versions:

Node.js: 1.0.0
Python/Django: 1.0.0
Java/Maven: 1.0.0

Semantic versioning allows package consumers and build systems to
understand the significance of application changes.

MAJOR - incompatible API or breaking changes
MINOR - backward-compatible functionality
PATCH - backward-compatible bug fixes

## 5. Environment-Specific Configuration

The applications demonstrate separation between application code and
environment-specific runtime configuration.

## Node.js

The Node.js application uses environment variables:

NODE_ENV=staging
PORT=3001

The packaged application was verified in a staging environment without
changing the application source code.

## Python/Django

The Django application was installed into a separate staging virtual
environment and executed on a different port:

127.0.0.1:8001

# Java

The Java JAR was copied to a separate staging directory and executed
independently from the Maven build directory.


| Ecosystem | Tool                   | Result                                                      |
| --------- | ---------------------- | ----------------------------------------------------------- |
| Node.js   | npm audit              | 0 vulnerabilities found                                     |
| Python    | pip-audit              | No known vulnerabilities found for auditable dependencies   |
| Java      | OWASP Dependency-Check | Inconclusive due to NVD API key/database update requirement |


Security audit reports are stored in:

artifacts/

## 7. Generated Artifacts

The project produces the following distributable artifacts:

# Node.js

artifacts/software-packaging-node-app-1.0.0.tgz

Python/Django

artifacts/software_packaging_django_app-1.0.0-py3-none-any.whl
artifacts/software_packaging_django_app-1.0.0.tar.gz


## Java/Maven

artifacts/software-packaging-java-app-1.0.0.jar

Supporting dependency and security reports are also stored in the
artifacts/ directory.

## 8. Verification Summary

Each packaged application was verified after packaging.

| Application     | Package Format    | Staging Verification | Security Audit                                            |
| --------------- | ----------------- | -------------------- | --------------------------------------------------------- |
| Node.js/Express | `.tgz`            | Successful           | 0 vulnerabilities                                         |
| Python/Django   | `.whl`, `.tar.gz` | Successful           | No known vulnerabilities found for auditable dependencies |
| Java/Maven      | `.jar`            | Successful           | Inconclusive                                              |


The staging tests demonstrate that the generated artifacts can be
installed or executed independently of the original development
environment.

## 9. Tools Used
 1. Node.js
 2. npm
 3. Express
 4. Python
 5. Django
 6. pip
 7. pip-audit
 8. setuptools
 9. Python Build
10. Java
11. Maven
12. OWASP Dependency-Check
13. Git
14. Linux/Ubuntu

## Conclusion

This project demonstrates the complete software packaging workflow:

1. Define dependencies.
2. Pin and manage dependency versions.
3. Apply semantic versioning.
4. Build distributable artifacts.
5. Separate runtime environment configuration.
6. Install or execute packages in clean staging environments.
7. Verify packaged applications.
8. Perform dependency security audits.
9. Store generated artifacts and audit reports for submission.
