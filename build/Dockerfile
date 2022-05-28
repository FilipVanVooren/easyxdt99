FROM library/python:3.10
ARG VERSION=3.5.0

ENV easyxdt99=1.0.1
ENV xdt99=$VERSION

#
# Create app user
#
RUN groupadd -g 1000 app && \
    useradd -u 1000 -g 1000 -m -d /app -s /bin/bash app

#
# Install xdt99 package in target directory /app/xdt99
#
USER app
WORKDIR /app
RUN echo "Building XDT99 version ${VERSION}...."                            \
    && mkdir -p /app/xdt99                                                  \
    && python3 -m pip install --upgrade --no-warn-script-location pip setuptools wheel                \
    && wget -q https://github.com/endlos99/xdt99/releases/download/${VERSION}/xdt99-${VERSION}.tar.gz \
    && tar --strip-components=1 -xvf xdt99-${VERSION}.tar.gz -C /app/xdt99  \
    && rm -rf xdt99-${VERSION}.tar.gz .wget-hsts

COPY --chown=app src/* /app/

ENTRYPOINT [ "/app/entrypoint.sh" ]
