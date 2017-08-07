gitlist_version := 0.5.0

.PHONY: build nginx nginx-test php-fpm php-fpm-test example release

default: build nginx nginx-test php-fpm php-fpm-test

build:
	make -C buildbox

nginx: build
	make -C nginx

nginx-release:
	make -C nginx release

php-fpm: build
	make -C php-fpm

php-fpm-release:
	make -C php-fpm release

example:
	make -C example

example-clean:
	make -C example clean

release: nginx-release php-fpm-release
