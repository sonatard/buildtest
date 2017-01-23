SRC_PATH="$(GOPATH)/src"
PKG_PATH="$(GOPATH)/pkg/darwin_amd64"

.PHONY: all clean run

all:
	cd hello;  go tool compile -o ../hello.a -p github.com/sonatard/buildtest/hello -pack ./hello.go

	go tool compile -o buildtest.a -p main -I $(SRC_PATH) -I $(PKG_PATH) -pack ./main.go ./test.go
	go tool link -o buildtest -L $(SRC_PATH) -L $(PKG_PATH) buildtest.a

clean:
	cd hello; go clean
	go clean

run:
	./buildtest
