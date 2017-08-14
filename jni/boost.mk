LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

BOOST_TOP := $(LOCAL_PATH)/boost


### build boost shared library for target ###
LOCAL_MODULE := libboost_android

define find_boost_module_src_files
  $(shell find $(BOOST_TOP)/libs/${1}/src -name '*.cpp')
endef

define find_boost_module_include_files
  $(BOOST_TOP)/libs/${1}/include
endef

boost_base_src_files := \
  $(call find_boost_module_src_files,config) \
  $(call find_boost_module_src_files,system) \
  $(call find_boost_module_src_files,assert) \
  $(call find_boost_module_src_files,core) \
  $(call find_boost_module_src_files,foreach) \
  $(call find_boost_module_src_files,type_traits) \
  $(call find_boost_module_src_files,smart_ptr) \
  $(call find_boost_module_src_files,iterator) \
  $(call find_boost_module_src_files,utility) \

boost_lite_src_files := \
  $(call find_boost_module_src_files,asio) \
  $(call find_boost_module_src_files,type_index) \
  $(call find_boost_module_src_files,uuid) \
  #$(call find_boost_module_src_files,date_time) \
  #$(call find_boost_module_src_files,context) \
  #$(call find_boost_module_src_files,exception) \
  #$(call find_boost_module_src_files,locale) \
  $(call find_boost_module_src_files,log) \



boost_all_src_files := \
  $(boost_base_src_files) \
  $(boost_lite_src_files)

$(info "FILES:"$(boost_all_src_files))

boost_base_c_includes := \
  $(call find_boost_module_include_files,config) \
  $(call find_boost_module_include_files,system) \
  $(call find_boost_module_include_files,assert) \
  $(call find_boost_module_include_files,context) \
  $(call find_boost_module_include_files,core) \
  $(call find_boost_module_include_files,foreach) \
  $(call find_boost_module_include_files,locale) \
  $(call find_boost_module_include_files,smart_ptr) \
  $(call find_boost_module_include_files,type_traits) \
  $(call find_boost_module_include_files,utility) \
  $(call find_boost_module_include_files,exception) \
  $(call find_boost_module_include_files,iterator) \
  $(call find_boost_module_include_files,asio) \
  $(call find_boost_module_include_files,date_time) \
  $(call find_boost_module_include_files,type_index) \
  $(call find_boost_module_include_files,uuid) \
  #$(call find_boost_module_include_files,log) \


LOCAL_SRC_FILES := \
  $(boost_all_src_files)

LOCAL_C_INCLUDES := \
  $(boost_base_c_includes)

$(info "INCLUDES:"$(LOCAL_C_INCLUDES))
LOCAL_CFLAGS := -DBOOST_NO_EXCEPTIONS=1

include $(BUILD_SHARED_LIBRARY)


### build boost static library for target ###

