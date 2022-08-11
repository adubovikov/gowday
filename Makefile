NAME?=gowday

all:
	#CGO_ENABLED=0 GOOS=linux go build -ldflags "-s -w" -o $(NAME) 
	LDFLAGS=-fno-lto go build -a -ldflags '-extldflags "-static"' -o $(NAME) 

debug:
	go build -o $(NAME) 

modules:
	go get ./...

docker:
	./build_docker.sh

package:
	./build_package.sh

.PHONY: clean
clean:
	rm -fr $(NAME)
