FROM python:3.14.2
ARG UPSTREAM_VERSION=2.3.1

EXPOSE 3000

LABEL org.opencontainers.image.source=https://github.com/beetbox/beets \
  org.opencontainers.image.version=v${UPSTREAM_VERSION}

USER root
WORKDIR /src
COPY requirements.txt /src
RUN git clone https://github.com/Vansmak/beetiful && cd beetiful && git checkout be8054ccd7474ecd1eb5adf86a8d842974c37adf  && pip install -r requirements.txt
RUN pip install -r /src/requirements.txt && rm /src/requirements.txt
RUN sed -i -e 's/"r+"/"r"/g' $(python -c 'import site; print(site.getsitepackages()[0])')/betanin/beets.py
USER nobody:nogroup

CMD [ "python3", "/src/beetiful/app.py", "--host", "0.0.0.0" ]
