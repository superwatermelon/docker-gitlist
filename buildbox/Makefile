gitlist_version := 0.5.0
gitlist_dist := build/gitlist-dist-$(gitlist_version).tar.gz
gitlist_sources := build/gitlist-$(gitlist_version).tar.gz

.PHONY: default image test

default: $(gitlist_dist) $(gitlist_sources) test

$(gitlist_sources): image
	docker run --rm --volume $(shell pwd)/build:/var/build \
		superwatermelon/docker-gitlist-build:$(gitlist_version) \
		cp gitlist-$(gitlist_version).tar.gz /var/build/

$(gitlist_dist): image
	docker run --rm --volume $(shell pwd)/build:/var/build \
		superwatermelon/docker-gitlist-build:$(gitlist_version) \
		cp gitlist-dist-$(gitlist_version).tar.gz /var/build/

image:
	docker build --build-arg gitlist_version=$(gitlist_version) \
		--tag superwatermelon/docker-gitlist-build:$(gitlist_version) .

test:
	dist=$(gitlist_dist) sources=$(gitlist_sources) bats test/suite.bats
