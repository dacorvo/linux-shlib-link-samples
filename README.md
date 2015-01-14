These are a few examples illustrating how to properly link against a Linux shared library having secondary dependencies.

Please refer to [this article](http://kaizou.org/2015/01/linux-libraries/) for a better understanding of the samples.

You can build the samples either using:
- manually using the provided Makefile,
- through CMake using the provided CMakeLists.txt

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
