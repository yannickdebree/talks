image=talks
container=$(image)_talks

all: build serve

.PHONY: build
build:
	docker build -t $(image) .
	docker run --rm -v $(PWD):/talks $(image) yarn

.PHONY: serve
serve:
	docker run -d -p 8080:8000 -p 35729:35729 -v $(PWD):/talks --name $(container) $(image)

.PHONY: clean
clean:
	docker stop $(container)
	docker rm $(container)