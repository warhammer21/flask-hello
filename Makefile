IMAGE_NAME := flask-helo-slim
DOCKER_REGISTRY := docker.io
DOCKER_USERNAME := warhammer21
DOCKER_REPOSITORY := ci_test

build:
	docker build -t $(IMAGE_NAME) .

tag:
	docker tag $(IMAGE_NAME) $(DOCKER_REGISTRY)/$(DOCKER_USERNAME)/$(DOCKER_REPOSITORY):latest

login:
	@echo $(DOCKER_PASSWORD) | docker login -u $(DOCKER_USERNAME) --password-stdin

push:
	docker push $(DOCKER_REGISTRY)/$(DOCKER_USERNAME)/$(DOCKER_REPOSITORY):latest

clean:
	docker rmi $(IMAGE_NAME) $(DOCKER_REGISTRY)/$(DOCKER_USERNAME)/$(DOCKER_REPOSITORY):latest

.PHONY: build tag login push clean
