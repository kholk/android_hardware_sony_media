LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
        C2DColorConverter.cpp

LOCAL_C_INCLUDES := \
    $(TARGET_OUT_HEADERS)/adreno


LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include

LOCAL_HEADER_LIBRARIES := \
        libutils_headers \
        libhardware_headers \
        display_headers

ifeq ($(TARGET_USES_GRALLOC1), true)
LOCAL_HEADER_LIBRARIES += display_intf_headers_gralloc1
else
LOCAL_HEADER_LIBRARIES += display_intf_headers_gralloc
endif

LOCAL_SHARED_LIBRARIES := liblog libdl

LOCAL_MODULE_TAGS := optional

LOCAL_MODULE := libc2dcolorconvert

LOCAL_VENDOR_MODULE := true

LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

include $(BUILD_SHARED_LIBRARY)
