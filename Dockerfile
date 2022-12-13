FROM python:3.9.4-slim-buster

RUN pip install detect-secrets==1.2.0
RUN set -eux \
    && apt-get update \
    && apt-get install -y --no-install-recommends git less bash gcc jq

RUN git config --global --add safe.directory /github/workspace

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
