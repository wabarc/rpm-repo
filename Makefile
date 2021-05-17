DOCKER ?= $(shell which docker || which podman)
VERSION = $(shell curl -s 'https://api.github.com/repos/wabarc/wayback/tags?per_page=1' | grep '"name":' | sed -E 's/.*"([^"]+)".*/\1/')

.PHONY: build
build:
	$(DOCKER) build -t rpm-builder .
	$(DOCKER) run --rm -v ${PWD}:/rpm-repo rpm-builder

.PHONY: publish
publish:
	git commit -am "Release $(VERSION)"
	git push origin main
