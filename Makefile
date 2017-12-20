IMAGE_NAME ?= owncloudci/nodejs:latest

BUILD_VERSION ?= latest
BUILD_DATE ?= $(shell date -u '+%Y-%m-%dT%H:%M:%SZ')

VCS_REF ?= $(shell git rev-parse HEAD)
VCS_URL ?= $(shell git remote get-url origin)

DOCKER_CMD ?= docker

.PHONY: build
build:
	$(DOCKER_CMD) build --label org.label-schema.version=$(BUILD_VERSION) --label org.label-schema.build-date=$(BUILD_DATE) --label org.label-schema.vcs-url=$(VCS_URL) --label org.label-schema.vcs-ref=$(VCS_REF) -t $(IMAGE_NAME) .
