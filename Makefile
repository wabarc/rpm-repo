export GIT_COMMITTER_NAME="github-actions[bot]"
export GIT_COMMITTER_NAME="41898282+github-actions[bot]@users.noreply.github.com"

DOCKER ?= $(shell which docker || which podman)
VERSION = $(shell curl -s 'https://api.github.com/repos/wabarc/wayback/tags?per_page=1' | grep '"name":' | sed -E 's/.*"([^"]+)".*/\1/')

.PHONY: build
build:
	$(DOCKER) build -t rpm-builder .
	$(DOCKER) run --rm -v ${PWD}:/rpm-repo rpm-builder

.PHONY: publish
publish:
	git add x86_64
	git commit --no-gpg-sign --author="github-actions[bot] <41898282+github-actions[bot]@users.noreply.github.com>" -m "Release $(VERSION)"
	git push origin main
