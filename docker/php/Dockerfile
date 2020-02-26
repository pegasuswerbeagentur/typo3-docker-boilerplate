ARG PHP_VERSION=""
FROM michasus/php:${PHP_VERSION}-typo3

COPY development.ini /usr/local/etc/php/conf.d

RUN addgroup -S appgroup && adduser -S appuser -u 1000 -G appgroup
USER appuser
