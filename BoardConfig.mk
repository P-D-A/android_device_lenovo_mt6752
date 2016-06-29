#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Special thanks to Zormax @ 4pda - for providing working tree

# inherit from the proprietary version
-include vendor/lenovo/mt6752/BoardConfigVendor.mk

LOCAL_PATH := device/lenovo/mt6752
 
MTK_K64_SUPPORT := yes

#USE_CCACHE:=1
#CCACHE_DIR:=$(LOCAL_PATH)/../../.ccache

# Platform
TARGET_BOARD_PLATFORM := mt6752
MTK_BOARD_PLATFORMS += mt6752
TARGET_NO_BOOTLOADER := true
TARGET_NO_FACTORYIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := mt6752

# make_ext4fs requires numbers in dec format
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_PROTECT1IMAGE_PARTITION_SIZE:=10485760
BOARD_PROTECT2IMAGE_PARTITION_SIZE:=10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE:=2147483648
BOARD_CACHEIMAGE_PARTITION_SIZE:=117440512
BOARD_USERDATAIMAGE_PARTITION_SIZE:=1237319680
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

BLOCK_BASED_OTA := false

BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
#TARGET_USERIMAGES_USE_F2FS := true

TARGET_KERNEL_HAVE_EXFAT := true
TARGET_KERNEL_HAVE_NTFS := true
#TARGET_KERNEL_HAVE_F2FS := true

#TARGET_LDPRELOAD += libxlog.so

# Use custom init.rc
TARGET_PROVIDES_INIT_RC := true

# MKImage
TARGET_MKIMAGE := $(LOCAL_PATH)/tools/mkimage
TARGET_USE_BUILT_BOOTIMAGE := true

# kernel stuff
MTK_PLATFORM := mt6752
MTK_PROJECT := 6752

# Kernel
#TARGET_KERNEL_ARCH := arm64
#KERNEL_ARCH := arm64
#TARGET_KERNEL_HEADER_ARCH := arm64
#BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel

#KERNEL_TOOLCHAIN := /home/toolchains/aarch64-linux-android-5.3/bin
#KERNEL_TOOLCHAIN_PREFIX := aarch64-linux-android-

BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/tools/bootimg.mk
#TARGET_KERNEL_CONFIG := aio_row_defconfig
#TARGET_KERNEL_SOURCE := kernel/lenovo/mt6752

ifneq ($(MTK_K64_SUPPORT),yes)
ARCH := arm
TARGET_ARCH := arm
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_VARIANT := cortex-a53
BOARD_KERNEL_CMDLINE := bootopt=64S3,32S1,32S1 androidboot.hardware=mt6752 androidboot.selinux=permissive
BOARD_KERNEL_OFFSET := 0x00008000
else
ARCH := arm64
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.hardware=mt6752 androidboot.selinux=permissive
TARGET_USES_64_BIT_BINDER := true
TARGET_IS_64_BIT :=true
TARGET_BOARD_SUFFIX := _64
TARGET_CPU_ABI_LIST := arm64-v8a,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_64_BIT := arm64-v8a
TARGET_SUPPORTS_32_BIT_APPS := true
TARGET_SUPPORTS_64_BIT_APPS := true
BOARD_KERNEL_OFFSET := 0x00080000
endif
TARGET_CPU_CORTEX_A53 := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_CPU_SMP := true

BOARD_RAMDISK_OFFSET := 0x04000000
BOARD_TAGS_OFFSET := 0xE000000
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_KMODULES := true
#TARGET_NO_RECOVERY := true

# recovery
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun/file"

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/ramdisk/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"

# TWRP
#RECOVERY_VARIANT := twrp
#TW_THEME := portrait_hdpi
#BUILD_TINY_ANDROID := true
#HAVE_SELINUX := true
#TW_INCLUDE_L_CRYPTO := true
#TW_NO_USB_STORAGE := false
#RECOVERY_GRAPHICS_USE_LINELENGTH := true
#TW_NO_REBOOT_BOOTLOADER := false
#TW_USE_TOOLBOX := false
#RECOVERY_SDCARD_ON_DATA := true
#TW_INTERNAL_STORAGE_PATH := "/data/media"
#TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
#TW_EXTERNAL_STORAGE_PATH := "/external_sd"
#TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
#TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/twrp/init.rc
#TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
#TW_SECONDARY_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/button-backlight/brightness
#TW_MAX_BRIGHTNESS := 255
#TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
#TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true

# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# Display
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# MTK Hardware
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
BOARD_USES_LEGACY_MTK_AV_BLOB := true
COMMON_GLOBAL_CFLAGS += -DMTK_HARDWARE  -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
COMMON_GLOBAL_CPPFLAGS += -DMTK_HARDWARE  -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
#COMMON_GLOBAL_CFLAGS += -DMTK_AOSP_ENHANCEMENT
#COMMON_GLOBAL_CPPFLAGS += -DMTK_AOSP_ENHANCEMENT

# Flags
TARGET_GLOBAL_CFLAGS   += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_USES_MTK_AUDIO := true
USE_CAMERA_STUB := true

# LightHAL
#TARGET_PROVIDES_LIBLIGHT := true

# Deodex
WITH_DEXPREOPT := false
DISABLE_DEXPREOPT := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true
MALLOC_IMPL := dlmalloc

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true
# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# GPS
BOARD_GPS_LIBRARIES := true
BOARD_CONNECTIVITY_MODULE := conn_soc 
BOARD_MEDIATEK_USES_GPS := true

# FM
MTK_FM_SUPPORT:=yes

# RIL
MTK_CIP_SUPPORT := no
MTK_DT_SUPPORT := no
MTK_VT3G324M_SUPPORT := no
MTK_UMTS_TDD128_MODE := no
MTK_SHARE_MODEM_CURRENT := 2
MTK_SHARE_MODEM_SUPPORT := 2
MTK_MD_SHUT_DOWN_NT := yes
MTK_FD_SUPPORT := yes
MTK_IPV6_SUPPORT := yes
MTK_LTE_SUPPORT := yes
MTK_LTE_DC_SUPPORT := no
MTK_SVLTE_SUPPORT := no
MTK_EAP_SIM_AKA := yes
MTK_IRAT_SUPPORT := no
MTK_DTAG_DUAL_APN_SUPPORT := no
MTK_MD1_SUPPORT := 5
MTK_MD2_SUPPORT := 4
MTK_MD3_SUPPORT := 2
MTK_MD5_SUPPORT := 5
MTK_ENABLE_MD1 = yes
MTK_ENABLE_MD2 = no
MTK_ENABLE_MD3 = no
MTK_ENABLE_MD5 = no
MTK_TC1_FEATURE := no
MTK_SIM_RECOVERY := yes
MTK_SIM_HOT_SWAP_COMMON_SLOT := yes
MTK_WORLD_PHONE := no
MTK_VOLTE_SUPPORT := no
MTK_VILTE_SUPPORT := no
MTK_WIFI_CALLING_RIL_SUPPORT := no

#GOOGLE_RELEASE_RIL := no
#MTK_RILD_READ_IMSI := no
#SIM_ME_LOCK_MODE := 0
#SIM_REFRESH_RESET_BY_MODEM := yes
#MTK_SIM1_SOCKET_TYPE := 1
#MTK_SIM2_SOCKET_TYPE := 1
#MTK_SIM_AUTHENTICATION_SUPPORT := no
#MTK_SIM_HOT_SWAP := yes
#MTK_GEMINI_3SIM_SUPPORT := no
#MTK_GEMINI_4SIM_SUPPORT := no
#MTK_GEMINI_ENHANCEMENT := yes

COMMON_GLOBAL_CFLAGS += \
	-DMTK_SHARE_MODEM_CURRENT=2 \
	-DMTK_SHARE_MODEM_SUPPORT=2 \
	-DMTK_MD_SHUTDOWN_NT=1 \
	-DMTK_FD_SUPPORT=1 \
	-DMTK_IPV6_SUPPORT=1 \
	-DMTK_LTE_SUPPORT=1 \
	-DMTK_EAP_SIM_AKA=1 \
	-DMTK_MD1_SUPPORT=5 \
	-DMTK_MD2_SUPPORT=4 \
	-DMTK_MD3_SUPPORT=2 \
	-DMTK_MD5_SUPPORT=5 \
	-DMTK_ENABLE_MD1=1 \
	-DMTK_SIM_RECOVERY=1 \
	-DMTK_SIM_HOT_SWAP_COMMON_SLOT=1
	
COMMON_GLOBAL_CPPFLAGS += \
	-DMTK_SHARE_MODEM_CURRENT=2 \
	-DMTK_SHARE_MODEM_SUPPORT=2 \
	-DMTK_MD_SHUTDOWN_NT=1 \
	-DMTK_FD_SUPPORT=1 \
	-DMTK_IPV6_SUPPORT=1 \
	-DMTK_LTE_SUPPORT=1 \
	-DMTK_EAP_SIM_AKA=1 \
	-DMTK_MD1_SUPPORT=5 \
	-DMTK_MD2_SUPPORT=4 \
	-DMTK_MD3_SUPPORT=2 \
	-DMTK_MD5_SUPPORT=5 \
	-DMTK_ENABLE_MD1=1 \
	-DMTK_SIM_RECOVERY=1 \
	-DMTK_SIM_HOT_SWAP_COMMON_SLOT=1


# MTK_WLAN_SUPPORT
BOARD_CONNECTIVITY_VENDOR        := MediaTek
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM        := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA          := STA
WIFI_DRIVER_FW_PATH_AP           := AP
WIFI_DRIVER_FW_PATH_P2P          := P2P
 

TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file


ifneq ($(MTK_K64_SUPPORT),yes)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.zygote=zygote32
else
PRODUCT_COPY_FILES += system/core/rootdir/init.zygote64_32.rc:root/init.zygote64_32.rc
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.zygote=zygote64_32
endif

# Hack for build
#$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/lenovo/mt6752/sepolicy
    
