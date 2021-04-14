FROM python:3.7.6-alpine3.11

RUN pip install detect-secrets==1.0.3
RUN apk --no-cache add git less openssh bash gcc
RUN apk add jq

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
