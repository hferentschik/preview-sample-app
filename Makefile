REGISTRY ?= hferentschik
IMAGE ?= preview-sample-app
VERSION ?= $(shell git rev-parse HEAD)

all: docker-build

docker-build:
	docker build -t $(REGISTRY)/$(IMAGE):$(VERSION) .

docker-push: docker-build
	docker push $(REGISTRY)/$(IMAGE):$(VERSION)	

kind-load-image: docker-build
	kind load docker-image $(REGISTRY)/$(IMAGE):$(VERSION)
