FROM python:3.14.2
ARG UPSTREAM_VERSION=2.3.1

EXPOSE 3000

LABEL org.opencontainers.image.source=https://github.com/beetbox/beets \
  org.opencontainers.image.version=v${UPSTREAM_VERSION}

USER root
WORKDIR /src
COPY requirements.txt /src
RUN pip install -r /src/requirements.txt && rm /src/requirements.txt
#RUN sed -i -e 's/"r+"/"r"/g' $(python -c 'import site; print(site.getsitepackages()[0])')/betanin/beets.py
USER nobody:nogroup

CMD ["waitress-serve", "--port=3000", "beetiful:app"]
