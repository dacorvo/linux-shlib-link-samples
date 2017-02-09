all: app_s app_d

app_s: libbar.a main.c
	gcc -o app_s main.c libbar.a -L$(shell pwd) -lfoo

app_d: libbar.so main.c
	gcc -o app_d main.c -L$(shell pwd) -lbar -Wl,-rpath-link=$(shell pwd)

libbar.a: libfoo.so bar.o
	ar rcs libbar.a bar.o

bar.o: bar.c
	gcc -c bar.c

libbaz.so: libbar.so baz.c
	gcc -shared -o libbaz.so -fPIC baz.c -Wl,--copy-dt-needed-entries -lbar -L$(shell pwd)

libbar.so: libfoo.so bar.c
	gcc -shared -o libbar.so -fPIC bar.c -lfoo -L$(shell pwd)

libfoo.so: foo.c
	gcc -shared -o libfoo.so -fPIC foo.c

clean:
	rm *.o *.a *.so app_*

test: all
	./test.sh
