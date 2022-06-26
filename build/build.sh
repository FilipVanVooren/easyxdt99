#!/usr/bin/env bash

xdtversion=${1:-3.5.0}
xdt99tar="xdt99-${xdtversion}.tar.gz"
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

mkdir -p .filecache

echo "Check xdt99 source package: ${xdt99tar}"
if [[ -f  "./.filecache/${xdt99tar}" ]]; then
  echo "xdt99 source package already cached"

else
  exist_wget="$(which wget)"
  exist_curl="$(which curl)"

  if [ "${#exist_wget}" -gt "0" ]; then
    echo "Getting xdt99 source package from github using wget"
    wget -P .filecache \
      "https://github.com/endlos99/xdt99/releases/download/${xdtversion}/${xdt99tar}"

  elif [ "${#exist_curl}" -gt "0" ]; then
    echo "Getting xdt99 source package from github using curl"
    curl -s -o ".filecache/${xdt99tar}" \
      "https://github.com/endlos99/xdt99/releases/download/${xdtversion}/${xdt99tar}"

  else
    echo "Not found"
    exit 255
  fi

fi

echo "Prepare building docker image with XDT99-${xdtversion} on Python ${pyversion}"
echo "Building from \"${pyimage}\" image"

docker build --build-arg XDTVERSION="${xdtversion}"  \
             --build-arg PYIMAGE="${pyimage}"        \
             --build-arg PYVERSION="${pyversion}"   \
             --tag "easyxdt99:${xdtversion}-${pyinterp}${pyversion}" .
