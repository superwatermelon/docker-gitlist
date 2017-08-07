php_fpm_image := superwatermelon/gitlist-php-fpm
nginx_image := superwatermelon/gitlist-nginx
gitlist_version := 0.5.0
build_dir := build
repos_dir := $(build_dir)/repos
example_bare_repo := $(repos_dir)/example.git
example_repo := $(build_dir)/example

.PHONY: default clean

default: $(example_repo)
	docker run --rm --detach --volume $(shell pwd)/$(repos_dir):/var/git:ro \
		--name gitlist-php-fpm $(php_fpm_image):$(gitlist_version)
	docker run --rm --detach --publish 8080:80 --link gitlist-php-fpm:gitlist-php-fpm \
		--name gitlist-nginx $(nginx_image):$(gitlist_version)

$(build_dir):
	mkdir -p $(build_dir)

$(repos_dir): $(build_dir)
	mkdir -p $(repos_dir)

$(example_bare_repo): $(repos_dir)
	git init --bare $(example_bare_repo)
	echo "This is an example" >$(example_bare_repo)/description

$(example_repo): $(build_dir) $(example_bare_repo)
	git clone $(example_bare_repo) $(example_repo)
	echo "Example\n---\nThis is an example readme." >$(example_repo)/README.md
	git -C $(example_repo) add .
	git -C $(example_repo) commit -m "Initial commit"
	git -C $(example_repo) push -u origin master

clean:
	rm -rf $(build_dir)
	docker stop gitlist-nginx gitlist-php-fpm
