ARG UPSTREAM_VERSION=2.3.1
FROM ghcr.io/home-operations/beets:${UPSTREAM_VERSION}
ARG UPSTREAM_VERSION=2.3.1
LABEL org.opencontainers.image.source=https://github.com/beetbox/beets \
  org.opencontainers.image.version=v${UPSTREAM_VERSION}
USER root
COPY requirements.txt /src
RUN pip install -r /src/requirements.txt && rm /src/requirements.txt
RUN sed -i -e 's/"r+"/"r"/g' /usr/local/lib/python3.12/site-packages/betanin/beets.py
USER nobody:nogroup
