
DOCKER = docker
IMAGE = locksmith


build:
	$(DOCKER) build -t $(IMAGE) .

run:
	$(DOCKER) run -v "$(PWD):/home" -it --rm $(IMAGE)
