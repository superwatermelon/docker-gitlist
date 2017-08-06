FROM nginx:1.13-alpine

ARG gitlist_version

WORKDIR /var/www/html

ADD build/gitlist-${gitlist_version}.tar.gz .

RUN mv gitlist-${gitlist_version} gitlist

COPY server.conf /etc/nginx/conf.d/default.conf

RUN chown -R nginx:nginx .

EXPOSE 80
