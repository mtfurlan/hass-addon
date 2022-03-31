ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk upgrade --update-cache --available && \
    apk add openssl nginx && \
    rm -rf /var/cache/apk/*

COPY rootfs /

CMD [ "/run.sh" ]
