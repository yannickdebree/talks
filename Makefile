IMAGE=node:lts-alpine
CONTAINER=talks
WORKDIR=/$(CONTAINER)

all: build serve

.PHONY: build
build:
	docker run --rm -w $(WORKDIR) -v $(PWD):$(WORKDIR) $(IMAGE) yarn

.PHONY: serve
serve:
	docker run -d -p 8080:8000 -p 35729:35729 -w $(WORKDIR) -v $(PWD):$(WORKDIR) --name $(CONTAINER) $(IMAGE) yarn start

.PHONY: clean
clean:
	docker stop $(CONTAINER)
	docker rm $(CONTAINER)