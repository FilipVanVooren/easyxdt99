#
# Get the base image
#
ARG PYIMAGE=library/python
ARG PYVERSION=3.10
FROM ${PYIMAGE}:${PYVERSION}


#
# Keep build arguments
#
ARG PYIMAGE
ARG PYVERSION
ARG VERSION=3.5.0

#
# Environment
#
ENV xdt99=$VERSION
ENV easyxdt99=1.0.1
ENV pyimage="${PYIMAGE}:${PYVERSION}"
ENV pyver=$PYVERSION


#
# Create app user on Clear Linux OS
#
RUN . /etc/os-release &&                                              \
    [ "$ID" = "clear-linux-os" ] && swupd bundle-add wget || true &&  \
    [ "$ID" = "clear-linux-os" ] && groupadd -g 1000 app || true &&   \
    [ "$ID" = "clear-linux-os" ] && useradd -u 1000 -g 1000 -m -d /app -s /bin/bash app || true


#
# Create app user on Debian, Alpine, ...
#
RUN . /etc/os-release &&                                                 \
    [ "$ID" != "clear-linux-os" ] && addgroup --gid 1000 app || true &&  \
    [ "$ID" != "clear-linux-os" ] && adduser -u 1000 --ingroup app --home /app --disabled-password --shell /bin/bash app || true



#
# Install xdt99 package in target directory /app/xdt99
#
USER app
WORKDIR /app
RUN echo ">>> Building XDT99 version ${VERSION} on Python image ${PYIMAGE}:${PYVERSION}"              \
    && echo ">>> STEP 1: pip install some modules...."                                                \
    && mkdir -p /app/xdt99                                                                            \
    && python3 -m pip install --upgrade --disable-pip-version-check --no-warn-script-location pip setuptools wheel \
    && echo ">>> STEP 2: Get xdt99 source code...."                                                   \
    && wget -q https://github.com/endlos99/xdt99/releases/download/${VERSION}/xdt99-${VERSION}.tar.gz \
    && echo "STEP 3 >>>: xdt99 source code successfully fetched"

RUN tar --strip-components=1 -xvf xdt99-${VERSION}.tar.gz -C /app/xdt99  \
    && rm -rf xdt99-${VERSION}.tar.gz .wget-hsts

COPY --chown=app src/* /app/

ENTRYPOINT [ "/app/entrypoint.sh" ]
