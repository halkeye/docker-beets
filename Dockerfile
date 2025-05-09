ARG UPSTREAM_VERSION=2.3.0
FROM ghcr.io/home-operations/beets:${UPSTREAM_VERSION}
LABEL org.opencontainers.image.source=https://github.com/beetbox/beets \
  org.opencontainers.image.version=${UPSTREAM_VERSION}
USER root
COPY requirements.txt /src
RUN pip install -r /src/requirements.txt && rm /src/requirements.txt
USER nobody:nogroup
