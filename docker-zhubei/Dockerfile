FROM php:7.4-fpm-alpine3.13

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk update && \
    apk add --no-cache \
    autoconf \
    build-base \
    libevent-dev \
    libuuid \
    e2fsprogs-dev \
    libzip-dev \
    openssl-dev && \
    docker-php-ext-install sockets pcntl pdo_mysql bcmath zip fileinfo && \
    pecl install redis uuid && \
    docker-php-ext-enable redis uuid opcache fileinfo && \
    pecl install event && \
    pecl install mongodb

COPY ./event.ini /usr/local/etc/php/conf.d/

RUN apk add --no-cache \
    libpng-dev \
    libwebp-dev \
    libjpeg-turbo-dev \
    freetype-dev && \
    docker-php-ext-configure gd \
    --with-jpeg=/usr/include/ \
    --with-freetype=/usr/include/ && \
    docker-php-ext-install gd

EXPOSE 9000
VOLUME /var/www
WORKDIR /var/www
