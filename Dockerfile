FROM alpine:3.7

ENV RUNTIME_PACKAGES="bash mariadb-client dcron py-pip"

RUN apk add --update --no-cache $RUNTIME_PACKAGES && \
    pip install --no-cache-dir awscli

COPY backup.sh .
COPY restore.sh .
COPY crontab .
COPY docker-entrypoint.sh .

RUN cat crontab > /var/spool/cron/crontabs/root

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD crond -f -d 8
