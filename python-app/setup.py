from setuptools import setup, find_packages

setup(
    name="software_packaging_django_app",
    version="1.0.0",
    description="Django application demonstrating Python software packaging",
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        "Django==6.1.1",
        "asgiref==3.12.1",
        "sqlparse==0.6.0",
    ],
)
