FROM php:7.3-apache-bullseye

ENV VERSION 2.02

RUN sed -i s/deb.debian.org/mirrors.ustc.edu.cn/g /etc/apt/sources.list && sed -i s/security.debian.org/mirrors.ustc.edu.cn/g /etc/apt/sources.list \
  && apt-get update && apt-get install -y libzip-dev libfreetype6-dev vim postfix \
  && docker-php-ext-install mysqli \
  && docker-php-ext-install gd \
  && docker-php-ext-install zip

RUN curl -o /tmp/dzzoffice-${VERSION}.tar.gz https://api.ineko.cc/gh/https://codeload.github.com/zyx0814/dzzoffice/tar.gz/${VERSION} \
  && tar -xzvf /tmp/dzzoffice-${VERSION}.tar.gz -C /tmp \
  && rm -rf /tmp/dzzoffice-${VERSION}.tar.gz /tmp/dzzoffice-${VERSION}/*.md \
  && mv /tmp/dzzoffice-${VERSION}/* /var/www/html/

RUN chown -R www-data:www-data /var/www/html/
