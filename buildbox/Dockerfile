FROM alpine:latest

ARG gitlist_version

RUN apk add --no-cache git php5 php5-openssl php5-json php5-phar php5-zlib openssl ca-certificates && \
  wget -O gitlist-${gitlist_version}.tar.gz https://github.com/klaussilveira/gitlist/archive/${gitlist_version}.tar.gz && \
  tar -xzvf gitlist-${gitlist_version}.tar.gz && \
  cd gitlist-${gitlist_version} && \
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
  php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
  php composer-setup.php && \
  php -r "unlink('composer-setup.php');" && \
  php composer.phar install --no-dev && \
  cd .. && \
  tar -czvf gitlist-dist-${gitlist_version}.tar.gz gitlist-${gitlist_version}
