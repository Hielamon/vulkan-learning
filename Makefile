.PHONY: test clean

test:
	make test -C hello_world
	make test -C triangle_demo

clean:
	make clean -C hello_world
	make clean -C triangle_demo