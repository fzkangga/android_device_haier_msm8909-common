#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

VENDOR_PATH := device/haier/msm8909-common

# Platform
TARGET_BOARD_PLATFORM := msm8909
TARGET_BOARD_PLATFORM_GPU := qcom-adreno304

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8909
TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true

ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true

# Properties
TARGET_SYSTEM_PROP := $(VENDOR_PATH)/system.prop
TARGET_NO_RADIOIMAGE := true
TARGET_HARDWARE_3D := false

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Audio
BOARD_USES_GENERIC_AUDIO := true
AUDIO_FEATURE_DEEP_BUFFER_RINGTONE := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := false
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true
AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_COMPRESS_CAPTURE := true
AUDIO_FEATURE_ENABLED_SSR := true
BOARD_USES_SRS_TRUEMEDIA := true
AUDIO_FEATURE_ENABLED_PM_SUPPORT := true
BOARD_USES_ALSA_AUDIO := true
BOARD_SUPPORTS_SOUND_TRIGGER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# malloc implementation
MALLOC_IMPL := dlmalloc

# Crypto
TARGET_HW_DISK_ENCRYPTION := true

# Enables CSVT
#TARGET_USES_CSVT := true

# Dex
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

# Display
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_CONTINUOUS_SPLASH_ENABLED := true
#TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true
#GET_FRAMEBUFFER_FORMAT_FROM_HWC := true
#TARGET_USES_QCOM_DISPLAY_PP := true

# FM
AUDIO_FEATURE_ENABLED_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Logging
TARGET_USES_LOGD := false

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
TARGET_LIBINIT_DEFINES_FILE := $(VENDOR_PATH)/init/init_A16C3H.c

# Power
TARGET_POWERHAL_VARIANT := qcom

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true

# RIL
TARGET_RIL_VARIANT := caf
PROTOBUF_SUPPORTED := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    $(VENDOR_PATH)/sepolicy

BOARD_SEPOLICY_UNION += \
    atfwd.te \
    bluetooth_loader.te \
    healthd.te \
    init.te \
    init_shell.te \
    qseecomd.te \
    sdcardd.te \
    surfaceflinger.te \
    system_server.te \
    usb_uicc_daemon.te \
    wcnss_service.te \
    file_contexts \
    property_contexts

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# QC PROPRIETARY
ifneq ($(QCPATH),)
BOARD_USES_QCNE := true
endif

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"

# Wifi
WIFI_DRIVER_MODULE_PATH := /system/lib/modules/wlan.ko
WIFI_DRIVER_MODULE_NAME:= wlan
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
TARGET_USES_WCNSS_CTRL := true
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X
