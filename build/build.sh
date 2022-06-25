#!/usr/bin/env bash

xdtversion=${1:-3.5.0}
pyimage=${2:-library/python}
pyversion=${3:-3.10}
xdt99tar="xdt99-${version}.tar.gz"

if [[ $pyimage == *"/python"* ]]; then
  pyinterp="cpython"
elif [[ $pyimage == *"/pypy"* ]]; then
  pyinterp="pypy"
else
    echo "Unknown Python interpreter. Stopping here."
    exit 1
fi

echo "Check xdt99 source package"
mkdir -p filecache
if [[ -f  "./.filecache/${xdt99tar}" ]]; then
  echo "xdt99 source package already cached"
else
  echo "Getting xdt99 source package from github"
  wget -P .filecache "https://github.com/endlos99/xdt99/releases/download/${version}/${xdt99tar}"
fi

echo "Prepare building docker image with XDT99-${version} on Python ${pyversion}"
echo "Building from \"${pyimage}\" image"

docker build --build-arg XDTVERSION="${xdtversion}"  \
             --build-arg PYIMAGE="${pyimage}"        \
             --build-arg PYVERSION="${pyversion}"   \
             --tag "easyxdt99:${xdtversion}-${pyinterp}${pyversion}" .
