LOCAL_PATH := $(call my-dir)
ifneq ($(filter P70, $(TARGET_DEVICE)),)
include $(CLEAR_VARS)
LOCAL_IS_HOST_MODULE =
LOCAL_MODULE = volte_stack
LOCAL_MODULE_CLASS = EXECUTABLES
LOCAL_MODULE_PATH =
LOCAL_MODULE_RELATIVE_PATH =
LOCAL_MODULE_SUFFIX =
LOCAL_MODULE_STEM =
LOCAL_MODULE_STEM_32 =
LOCAL_MODULE_STEM_64 =
LOCAL_SHARED_LIBRARIES = libcrypto libnetutils libnetd_client libhardware libhardware_legacy libc++
LOCAL_MULTILIB = 32
LOCAL_SRC_FILES_32 = volte_stack
include $(BUILD_PREBUILT)
endif
  