LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_CPP_EXTENSION := .cpp

LOCAL_CPPFLAGS := -std=c++11 -fexceptions

LOCAL_MODULE := libboost_android_demo

LOCAL_SRC_FILES := \
	demo.cpp

LOCAL_SHARED_LIBRARIES := \
	libboost_android

include $(EXECUTABLE)


include $(LOCAL_PATH)/boost.mk
