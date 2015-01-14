project(test)

# Do not insert rpath when linking against a shared library
set(CMAKE_SKIP_RPATH TRUE)

# Create libfoo.so
add_library(foo SHARED foo.c)

# Create libbar.so
add_library(bar SHARED bar.c)
# Add libfoo as a private dependency
target_link_libraries(bar PRIVATE foo)
    
# Create libbar_s.a (has to have a different name)
add_library(bar_s STATIC bar.c)
# Add libfoo dependency (it o
target_link_libraries(bar_s foo)

# Create 'dynamic' app
add_executable(app_d main.c)
# Add libbar dependency
target_link_libraries(app_d bar)

# Create 'static' app
add_executable(app_s main.c)
# Add libbar_s dependency
target_link_libraries(app_s bar_s)


