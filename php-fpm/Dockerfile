FROM php:7.1.8-fpm-alpine

ARG gitlist_version

RUN apk --no-cache add git

ADD build/gitlist-dist-${gitlist_version}.tar.gz .

RUN mv gitlist-${gitlist_version} gitlist

COPY config.ini gitlist/config.ini

RUN chown -R www-data:www-data .

VOLUME /var/git

EXPOSE 9000
