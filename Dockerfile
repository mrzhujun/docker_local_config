FROM php:7.1-fpm

RUN apt-get update -y \
&& apt-get install -y libwebp-dev libjpeg-dev libpng-dev libfreetype6-dev \
&& apt-get install -y libcurl4-openssl-dev pkg-config libssl-dev \
&&  docker-php-ext-configure gd \
    --enable-gd \
    --with-webp \
    --with-jpeg \
    --with-freetype \
    --with-freetype-dir=/usr/local/freetype
&& docker-php-ext-install pcntl \
&& docker-php-ext-install gd && docker-php-ext-enable gd \
&& docker-php-ext-install pdo && docker-php-ext-enable pdo \
&& docker-php-ext-install pdo_mysql && docker-php-ext-enable pdo_mysql \
&& docker-php-ext-install mysqli && docker-php-ext-enable mysqli 
#&& docker-php-ext-install bcmath && docker-php-ext-enable bcmath \
#&& pecl install redis && pecl install mongodb

#docker build -t php:v4 .

#docker run --name php-fpm  -v D:/phpstudy_zj/WWW:/www:cached -v D:/phpstudy_zj/docker/php:/usr/local/etc/php/:cached -d php:v3
#docker run --name nginx -p 80:80 -d -v D:/phpstudy_zj/WWW:/www:cached -v D:/phpstudy_zj/docker/nginx/conf/conf.d:/etc/nginx/conf.d:cached  nginx
#docker inspect php容器 | grep "IPAddress"  查看php容器的网络

#注意php7.4之前gd库配置
#docker-php-ext-configure gd \
#    --with-webp-dir==/usr/local/webp \
#    --with-jpeg-dir=/usr/local/jpeg \
#    --with-freetype-dir=/usr/local/freetype