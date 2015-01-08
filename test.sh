#!/bin/sh
LD_LIBRARY_PATH=. ./app_s
rc=$? && echo $rc
LD_LIBRARY_PATH=. ./app_d11
rc=$? && echo $rc
LD_PRELOAD=./libfoo.so LD_LIBRARY_PATH=. ./app_d12
rc=$? && echo $rc
LD_LIBRARY_PATH=. ./app_d21
rc=$? && echo $rc
LD_LIBRARY_PATH=. ./app_d22
rc=$? && echo $rc
