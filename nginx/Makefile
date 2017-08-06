docker_image := superwatermelon/gitlist-nginx
gitlist_version := 0.5.0
source_dir := ../buildbox/build
gitlist_source := $(source_dir)/gitlist-$(gitlist_version).tar.gz
build_dir := build
gitlist_dest := $(build_dir)/gitlist-$(gitlist_version).tar.gz

.PHONY: default image test release

default: image test

$(build_dir):
	mkdir -p $(build_dir)

$(gitlist_dest): $(gitlist_source) $(build_dir)
	cp $(gitlist_source) $(gitlist_dest)

image: $(gitlist_dest)
	docker build --build-arg gitlist_version=$(gitlist_version) \
		--tag $(docker_image):$(gitlist_version) .

test:
	image=$(docker_image):$(gitlist_version) bats test/suite.bats

release:
	docker tag $(docker_image):$(tag) $(docker_image):latest
	../scripts/docker-login
	docker push $(docker_image):$(gitlist_version)
	docker push $(docker_image):latest
