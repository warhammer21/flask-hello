IMAGE_NAME := flask-helo-slim
DOCKER_REGISTRY := docker.io
DOCKER_USERNAME := $(DOCKER_USERNAME)
DOCKER_PASSWORD := $(DOCKER_PASSWORD)

build:
	docker build -t $(IMAGE_NAME) .

tag:
	docker tag $(IMAGE_NAME) $(DOCKER_REGISTRY)/$(DOCKER_USERNAME)/$(IMAGE_NAME)

login:
	@echo $(DOCKER_PASSWORD) | docker login -u $(DOCKER_USERNAME) --password-stdin

push:
	docker push $(DOCKER_REGISTRY)/$(DOCKER_USERNAME)/$(IMAGE_NAME)

clean:
	docker rmi $(IMAGE_NAME) $(DOCKER_REGISTRY)/$(DOCKER_USERNAME)/$(IMAGE_NAME)

.PHONY: build tag login push clean
