These are a few examples illustrating how to properly link against a Linux shared library having secondary dependencies.

Please refer to [this article](http://kaizou.org/2015/01/linux-libraries/) for a better understanding of the samples.

You can build the samples either using:
- manually using the provided Makefile,
- with CMake using the provided CMakeLists.txt
- with Autotools using the provided configure.ac/Makefile.am 

##Manual build

The Makefile illustrates the way things should be done as described in the aforementioned post.

To build the samples:

    make VERBOSE=1

##CMake build

    mkdir cmake-build
    cd cmake-build
    cmake ..
    make VERBOSE=1

The key points with the CMake build are that:
- you have to tell CMake not to insert an rpath whenever a shared object is linked against,
- you must specify that the dependency between bar and foo is private to avoid it being exported to app

##Autotools/libtool build

    autoreconf -fi
    mkdir autotools-build
    cd autotools-build
    ../configure
    make VERBOSE=1

The key points with the autotools/libtool build are that:
- for each library, both a static and a shared version are generated,
- when you force a static link, it applies to all libraries (you cannot tell libtool to link statically with libbar and dynamically with libfoo)
- libtool inserts rpath in all objects linked to a shared library unless it is in the dynamic linker search path. This behaviour is usually not compatible with component packaging and patched by every single distribution (including cross environments).
