ARG PHP_VERSION=""
FROM php:${PHP_VERSION:+${PHP_VERSION}-}fpm-alpine

RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
        freetype \
        freetype-dev \
        libpng \
        libpng-dev \
        jpeg-dev \
        libjpeg \
        libjpeg-turbo \
        libjpeg-turbo-dev \
    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr/lib/ \
        --with-png-dir=/usr/lib/ \
        --with-jpeg-dir=/usr/lib/ \
        --with-gd \
    && docker-php-ext-install gd \
    && docker-php-ext-install mysqli \
    && apk add --no-cache \
        libzip-dev \
        zip \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-install zip \
    && apk add icu-libs \
        icu-dev \
    && docker-php-ext-install intl \
    && docker-php-ext-install opcache \
    && apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && apk add graphicsmagick

COPY development.ini /usr/local/etc/php/conf.d

RUN addgroup -S appgroup && adduser -S appuser -u 1000 -G appgroup
USER appuser
