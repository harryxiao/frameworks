LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
        MediaSender.cpp                 \
        Parameters.cpp                  \
        rtp/RTPSender.cpp               \
        source/Converter.cpp            \
        source/MediaPuller.cpp          \
        source/PlaybackSession.cpp      \
        source/RepeaterSource.cpp       \
        source/TSPacketizer.cpp         \
        source/WifiDisplaySource.cpp    \
        VideoFormats.cpp                \

LOCAL_C_INCLUDES:= \
        $(TOP)/frameworks/av/media/libstagefright \
        $(TOP)/frameworks/native/include/media/openmax \
        $(TOP)/frameworks/av/media/libstagefright/mpeg2ts \

LOCAL_SHARED_LIBRARIES:= \
        libbinder                       \
        libcutils                       \
        liblog                          \
        libgui                          \
        libmedia                        \
        libstagefright                  \
        libstagefright_foundation       \
        libui                           \
        libutils                        \

LOCAL_CFLAGS += -Wno-multichar -Werror -Wall
LOCAL_CLANG := true

#sp9860g support 1920*1080 p30
ifeq ($(strip $(TARGET_BOARD_PLATFORM)),sp9860g)
    LOCAL_CFLAGS += -DWIFIDISPLAY_PLATFORM_SP9860G
endif

LOCAL_MODULE:= libstagefright_wfd

LOCAL_MODULE_TAGS:= optional

include $(BUILD_SHARED_LIBRARY)
