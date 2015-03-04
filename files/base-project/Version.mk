ifndef PROJECT_BUILD_HASH
    PROJECT_BUILD_NO := $(shell git rev-parse --short=0 HEAD)
else
    PROJECT_BUILD_NO := 0
endif

ifndef DIRECTGPS_BUILD_DATE
    PROJECT_BUILD_DATE := $(shell date --iso-8601)
else
    PROJECT_BUILD_DATE := 2015-03-04
endif
