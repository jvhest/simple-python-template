#!/bin/bash

project_name="{{cookiecutter.project_name}}"
if [[ $(grep -E -c '^[a-zA-Z][-a-zA-Z]+$' <<< $project_name) -eq 0 ]]
then
    echo "ERROR: The project name ${project_name} is not a valid Python module name. Please do not use a _ and use - instead"
    exit 1
fi

package_name="{{cookiecutter.__package_name}}"
if [[ $(grep -E -c '^[a-zA-Z][_a-zA-Z]+$' <<< $package_name) -eq 0 ]]
then
    echo "ERROR: The project slug ${package_name} is not a valid Python module name. Please do not use a - and use _ instead"
    exit 1
fi

echo "project_dir=$(pwd)" > .env
