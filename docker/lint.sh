#!/usr/bin/env bash

set -euxo pipefail

echo "Running linters and formatters..."

isort democritus_json/ tests/

black democritus_json/ tests/

mypy democritus_json/ tests/

pylint --fail-under 9 democritus_json/*.py

flake8 democritus_json/ tests/

bandit -r democritus_json/

# we run black again at the end to undo any odd changes made by any of the linters above
black democritus_json/ tests/
