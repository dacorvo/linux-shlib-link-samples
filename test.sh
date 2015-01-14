#!/bin/sh
LD_LIBRARY_PATH=. ./app_s
rc=$? && echo $rc
LD_LIBRARY_PATH=. ./app_d
rc=$? && echo $rc
