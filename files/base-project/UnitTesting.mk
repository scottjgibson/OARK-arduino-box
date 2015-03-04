ifndef UT_CC_NAME
    UT_CC_NAME = gcc
endif

ifndef UT_CXX_NAME
    UT_CXX_NAME = g++
endif

UT_SRC_DIR = test

ifndef UT_OBJ_DIR
    UT_OBJ_DIR = build-test-obj
endif

UT_CPPFLAGS += -I. -I$(UT_SRC_DIR) -Wall
UT_LDFLAGS += -lcppunit

# Sources
LOCAL_UT_CC_SRCS ?= $(wildcard $(UT_SRC_DIR)/*.cpp)
LOCAL_UT_SRCS = $(LOCAL_UT_CC_SRCS)
LOCAL_UT_OBJ_FILES = $(LOCAL_UT_CC_SRCS:.cpp=.o)
LOCAL_UT_OBJS = $(patsubst %,$(UT_OBJ_DIR)/%,$(LOCAL_UT_OBJ_FILES))

-include $(LOCAL_UT_OBJS:.o=.d)

$(UT_OBJ_DIR)/%.o: %.cpp
	@$(MKDIR) $(dir $@)
	$(UT_CXX_NAME) -MMD -g -c $(UT_CPPFLAGS) $(UT_CXXFLAGS) $< -o $@

unittest: $(LOCAL_UT_OBJS)
	$(UT_CXX_NAME) $(UT_LDFLAGS) -g -o $@ $(LOCAL_UT_OBJS) -lc -lm
	./unittest

unittest-clean:
	$(REMOVE) $(LOCAL_UT_OBJS) $(UT_OBJ_DIR) unittest

.PHONY: unittest
