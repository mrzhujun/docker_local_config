FROM php:7.3-fpm
ENV PHP_DIR D:/phpstudy_zj/docker/php
ENV WWW_DIR D:/phpstudy_zj/WWW
ENV PHP_INI_DIR /usr/local/etc/php

RUN apt-get update -y && apt-get install -y libpng-dev \
&&  docker-php-ext-configure gd \
    --with-gd \
    --with-webp-dir \
    --with-jpeg-dir \
    --with-png-dir \
    --with-zlib-dir \
    --with-freetype-dir
&& docker-php-ext-install gd && docker-php-ext-enable gd \
&& docker-php-ext-install pdo && docker-php-ext-enable pdo \
&& docker-php-ext-install pdo_mysql && docker-php-ext-enable pdo_mysql \
&& docker-php-ext-install mysqli && docker-php-ext-enable mysqli \

&&  pecl install redis && pecl install mongodb

#docker build -t php:v1 .

#docker run --name php-fpm --mount type=bind,source="D:/phpstudy_zj/WWW",target=/www --mount type=bind,source="D:/phpstudy_zj/docker/php",target=/usr/local/etc/php/ -d php:v2

#docker run --name php-nginx -p 80:80 -d -v D:/phpstudy_zj/WWW:/www -v D:/phpstudy_zj/docker/nginx/conf/conf.d:/etc/nginx/conf.d --link php-fpm:php nginx