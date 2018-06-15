NS := webfront
VERSION := 0.1
IMAGE := net-tools
CONTAINER := net-tools
CMD := "docker run -it --rm \
                --network=host \
                --name=$(CONTAINER) \
                $(NS)/$(IMAGE):$(VERSION)"

build:
	docker build -t $(NS)/$(IMAGE):$(VERSION) -f Dockerfile .

run:
	@eval $(CMD)

echo-run:
	@echo $(CMD)

default: build

