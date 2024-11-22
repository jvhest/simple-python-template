#!/bin/bash

echo "🚀 set pyenv local python version..."
pyenv local {{ cookiecutter.python_version }}

if [ ! -d .venv ]
then
    echo "🚀 creating virtual environment..."
    python -m venv .venv
fi

echo "🚀 create symlink to activate venv..."
ln -sf .venv/bin/activate .activate.sh
echo "deactivate" > .deactivate.sh
source .venv/bin/activate

echo "🚀 pip install requirements..."
pip install -r requirements.txt
pip install -r requirements-dev.txt

echo "🚀 make editable install..."
pip install -e .

if [ ! -d .git ]
then
    echo "🚀 creating git repository..."
    git init -b main
    git remote add origin git@github.com:{{ cookiecutter.__github_user }}/{{ cookiecutter.__project_slug }}.git

    echo "🚀 install pre-commit hooks..."
    pre-commit install
fi

git add .
git commit -m "initial commit"
