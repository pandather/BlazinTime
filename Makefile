ARCHS = arm64 arm64e
TARGET := iphone:clang:latest:latest

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BlazinTime

BlazinTime_FILES = BongHit.x
BlazinTime_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
