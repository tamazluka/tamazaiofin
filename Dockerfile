FROM python:alpine

COPY ./content /workdir/

RUN apk add --no-cache curl caddy jq bash findutils runit apache2-utils tzdata ttyd \
    && chmod +x /workdir/service/*/run /workdir/service/*/log/run /workdir/*.sh \
    && /workdir/install.sh \
    && rm -f /workdir/install.sh

ENTRYPOINT ["sh","/workdir/entrypoint.sh"]
