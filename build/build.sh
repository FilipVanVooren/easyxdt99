#!/usr/bin/env bash

version=${1:-3.5.0}
pyimage=${2:-library/python}
pyversion=${3:-3.10}

if [[ $pyimage == *"/python"* ]]; then
  pyinterp="cpython"
elif [[ $pyimage == *"/pypy"* ]]; then
  pyinterp="pypy"
else
    echo "Unknown Python interpreter. Stopping here."
    exit 1
fi


echo "Prepare building docker image with XDT99-${version} on Python ${pyversion}"
echo "Building from \"${pyimage}\" image"

docker build --build-arg VERSION="${version}"     \
             --build-arg PYIMAGE="${pyimage}"     \
             --build-arg PYVERSION="${pyversion}" \
             --tag "easyxdt99:${version}-${pyinterp}${pyversion}" .
