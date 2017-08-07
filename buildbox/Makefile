docker_image := superwatermelon/gitlist-buildbox
gitlist_version := 0.5.0
build_dir := build
gitlist_dist := $(build_dir)/gitlist-dist-$(gitlist_version).tar.gz
gitlist_sources := $(build_dir)/gitlist-$(gitlist_version).tar.gz

.PHONY: default image test

default: $(gitlist_dist) $(gitlist_sources) test

$(build_dir):
	mkdir -p $(build_dir)

$(gitlist_sources): $(build_dir) image
	docker run --rm --volume $(shell pwd)/build:/var/build \
		$(docker_image):$(gitlist_version) \
		cp gitlist-$(gitlist_version).tar.gz /var/build/

$(gitlist_dist): $(build_dir) image
	docker run --rm --volume $(shell pwd)/build:/var/build \
		$(docker_image):$(gitlist_version) \
		cp gitlist-dist-$(gitlist_version).tar.gz /var/build/

image:
	docker build --build-arg gitlist_version=$(gitlist_version) \
		--tag $(docker_image):$(gitlist_version) .

test:
	dist=$(gitlist_dist) sources=$(gitlist_sources) bats test/suite.bats
