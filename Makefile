ROOT	:= $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
NAME	:= bgp
TAG 	:= frankzhao/$(NAME)

.PHONY: all build

all: build

build:
	@docker build -t $(TAG) $(ROOT)

run:
	@docker run -it -d -v `pwd`/routes:/root/routes --name $(NAME) $(TAG)

clean:
	@docker stop $(NAME)
	@docker rm -v $(NAME)
	@docker rmi -f $(TAG)
