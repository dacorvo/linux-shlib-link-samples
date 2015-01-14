# Create the libfoo library
lib_LTLIBRARIES = libfoo.la
libfoo_la_SOURCES = foo.c

# Create the libbar library
lib_LTLIBRARIES += libbar.la
libbar_la_SOURCES = bar.c
# Add the libfoo dependency
libbar_la_LDADD = $(top_builddir)/libfoo.la

# Create the 'static' application
bin_PROGRAMS = app_s
app_s_SOURCES = main.c
# Add the libbar dependency
app_s_LDADD = $(top_builddir)/libbar.la
# Request a static link
app_s_LDFLAGS = -static

# Create the 'dynamic' application
bin_PROGRAMS += app_d
app_d_SOURCES = main.c
# Add the libbar dependency
app_d_LDADD = $(top_builddir)/libbar.la
