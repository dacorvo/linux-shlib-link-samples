all: app_s app_d11 app_d12 app_d21 app_d22

app_s: libbar.a main.c
	gcc -o app_s main.c libbar.a -L$(shell pwd) -lfoo

app_d11: libbar_dumb.so main.c
	gcc -o app_d11 main.c -L$(shell pwd) -lbar_dumb -lfoo

app_d12: libbar_dumb.so main.c
	gcc -o app_d12 main.c -L$(shell pwd) -lbar_dumb -Wl,--allow-shlib-undefined

app_d21: libbar.so main.c
	gcc -o app_d21 main.c -L$(shell pwd) -lbar -Wl,-rpath-link=$(shell pwd)

app_d22: libbar.so main.c
	gcc -o app_d22 main.c -L$(shell pwd) -lbar -Wl,--allow-shlib-undefined

libbar.a: libfoo.so bar.o
	ar rcs libbar.a bar.o

bar.o: bar.c
	gcc -c bar.c

libbar_dumb.so: libfoo.so bar.c
	gcc -shared -o libbar_dumb.so -fPIC bar.c

libbar.so: libfoo.so bar.c
	gcc -shared -o libbar.so -fPIC bar.c -lfoo -L$(shell pwd)

libfoo.so: foo.c
	gcc -shared -o libfoo.so -fPIC foo.c

clean:
	rm *.o *.a *.so app_*

test: all
	./test.sh
