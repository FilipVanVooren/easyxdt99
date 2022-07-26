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
ARG XDTVERSION=3.5.0

#
# Environment
#
ENV xdt99=$XDTVERSION
ENV easyxdt99=1.0.1
ENV pyimage="${PYIMAGE}:${PYVERSION}"
ENV pyver=$PYVERSION
ENV PATH="/app/xdt99:$PATH"

#
# Prepare shell and create app user on Debian, Alpine, ...
#
RUN . /etc/os-release && \
    [ "$ID" = "alpine" ] && apk update   || true && \
    [ "$ID" = "alpine" ] && apk upgrade  || true && \
    [ "$ID" = "alpine" ] && apk add bash || true && \
    addgroup --gid 1000 app || true &&  \
    adduser -u 1000 --ingroup app --home /app --disabled-password --shell /bin/bash app || true

#
# Install some python tools
#
USER app
WORKDIR /app
RUN echo ">>> Building XDT99 version ${VERSION} on Python image ${PYIMAGE}:${PYVERSION}"              \
    && echo ">>> STEP 1: pip install some modules...."                                                \
    && python3 -m pip install --upgrade --disable-pip-version-check --no-warn-script-location pip setuptools wheel

#
# Copy and unpacks xdt99 source package
#
ADD --chown=app ./.filecache/xdt99-${XDTVERSION}.tar.gz /app
RUN mv /app/xdt99-${XDTVERSION} /app/xdt99

#
# Install convenience wrapper scripts
#
COPY --chown=app src/* /app/

ENTRYPOINT [ "/app/entrypoint.sh" ]
