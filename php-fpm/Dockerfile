FROM php:7.1.8-fpm-alpine

ARG gitlist_version
ARG git_group=git
ARG git_gid=1001

ADD build/gitlist-dist-${gitlist_version}.tar.gz .

RUN addgroup -g ${git_gid} ${git_group} && adduser www-data ${git_group} && \
  apk --no-cache add git && \
  chown -R www-data:www-data . && \
  mv gitlist-${gitlist_version} gitlist && \
  sed -i "s/group = www-data/group = ${git_group}/" /usr/local/etc/php-fpm.d/www.conf

COPY config.ini gitlist/config.ini

VOLUME /var/git

EXPOSE 9000
