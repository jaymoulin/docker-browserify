VERSION ?= 17.0.0
CACHE ?= --no-cache=1

.PHONY: help all build publish
help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

all: build publish
build: ## build docker image
	docker buildx build --platform linux/amd64,linux/arm64/v8 ${PUSH} --build-arg VERSION=${VERSION} -t jaymoulin/browserify -t jaymoulin/browserify:${VERSION}  ${CACHE} .
publish: ## publish docker image
	CACHE= PUSH=--push make build
