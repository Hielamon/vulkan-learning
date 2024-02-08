CFLAGS = -std=c++17 
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi
program = triangle_demo

${program}: 
	g++ ${CFLAGS} ${program}.cpp -o ${program} ${LDFLAGS}

.PHONY: test clean

test: ${program}
	./${program}

clean:
	rm -f ${program}