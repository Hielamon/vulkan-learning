CFLAGS = -std=c++17 -O2
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

hello_world: 
	g++ ${CFLAGS} hello_world.cpp -o hello_world ${LDFLAGS}

.PHONY: test clean

test: hello_world
	./hello_world

clean:
	rm -f hello_world