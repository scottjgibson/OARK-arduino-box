ifndef GUT_CC_NAME
    GUT_CC_NAME = gcc
endif

ifndef GUT_CXX_NAME
    GUT_CXX_NAME = g++
endif

GUT_SRC_DIR = gen-test

ifndef GUT_OBJ_DIR
    GUT_OBJ_DIR = build-test-obj
endif

GUT_CPPFLAGS += -I. -I$(GUT_SRC_DIR) -Wall
# GUT_LDFLAGS += -lcppunit

# Sources
LOCAL_GUT_CC_SRCS ?= $(wildcard $(GUT_SRC_DIR)/*.cpp)
LOCAL_GUT_SRCS = $(LOCAL_GUT_CC_SRCS)
LOCAL_GUT_OBJ_FILES = $(LOCAL_GUT_CC_SRCS:.cpp=.o)
LOCAL_GUT_OBJS = $(patsubst %,$(GUT_OBJ_DIR)/%,$(LOCAL_GUT_OBJ_FILES))

-include $(LOCAL_GUT_OBJS:.o=.d)

$(GUT_OBJ_DIR)/%.o: %.cpp
	@$(MKDIR) $(dir $@)
	$(GUT_CXX_NAME) -MMD -g -c $(GUT_CPPFLAGS) $(GUT_CXXFLAGS) $< -o $@

genunittest: $(LOCAL_GUT_OBJS)
	$(GUT_CXX_NAME) $(GUT_LDFLAGS) -g -o $@ $(LOCAL_GUT_OBJS) -lc -lm
	./genunittest

genunittest-clean:
	$(REMOVE) $(LOCAL_GUT_OBJS) $(GUT_OBJ_DIR) genunittest

.PHONY: genunittest
