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
#

LOCAL_PATH := device/motorola/smi

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# xt890 specific overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Device uses high-density artwork where available
PRODUCT_LOCALES := en_US
PRODUCT_LOCALES += hdpi
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	libaudioutils \
	libdashplayer

# Stk
PRODUCT_PACKAGES += \
    Stk

# Intel Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240

# Intel Bootimage Tools
PRODUCT_PACKAGES += \
    pack_intel \
    unpack_intel

# Ramdisk
PRODUCT_COPY_FILES += \
        $(call find-copy-subdir-files,*,$(LOCAL_PATH)/rootdir,root) \
        $(call find-copy-subdir-files,*,$(LOCAL_PATH)/modules/prebuilt/lib/modules,system/lib/modules)

# Motorola
#PRODUCT_PACKAGES += \
#    aplogd

#############################open-source
# psb video
#PRODUCT_PACKAGES += \
#    pvr_drv_video

# libva
#PRODUCT_PACKAGES += \
#    libva \
#    libva-android \
#    libva-tpi \
#    vainfo

#libstagefrighthw
#PRODUCT_PACKAGES += \
#    libstagefrighthw

# libmix
#PRODUCT_PACKAGES += \
#    libmixvbp_mpeg4 \
#    libmixvbp_h264 \
#    libmixvbp_h264secure \
#    libmixvbp_vc1 \
#    libmixvbp_vp8 \
#    libmixvbp \
#    libva_videodecoder \
#    libva_videoencoder

#PRODUCT_PACKAGES += \
#    libwrs_omxil_common \
#    libwrs_omxil_core_pvwrapped \
#    libOMXVideoDecoderAVC \
#    libOMXVideoDecoderH263 \
#    libOMXVideoDecoderMPEG4 \
#   libOMXVideoDecoderWMV \
#    libOMXVideoDecoderVP8 \
#    libOMXVideoDecoderVP9HWR \
#    libOMXVideoDecoderVP9Hybrid \
#    libOMXVideoEncoderAVC \
#   libOMXVideoEncoderH263 \
#    libOMXVideoEncoderMPEG4 \
#    libOMXVideoEncoderVP8

# libdrm
#PRODUCT_PACKAGES += \
#    libdrm \
#    dristat \
#    drmstat
#############################open-source

# Misc
PRODUCT_PACKAGES += \
    curl \
    libbson \
    libcurl \
    tcpdump \
    Torch \
    com.android.future.usb.accessory

# Charger
PRODUCT_PACKAGES += charger charger_res_images

# Crda
PRODUCT_PACKAGES += \
    crda \
    regulatory.bin

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    HoloSpiralWallpaper \
    VisualizationWallpapers \
    librs_jni

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    resize2fs \
    setup_fs

# NFC packages
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc

# Houdini
PRODUCT_COPY_FILES += \
        $(call find-copy-subdir-files,*,$(LOCAL_PATH)/houdini/system,system)

PRODUCT_PACKAGES += \
   libhoudini_hook \
   houdini_hook

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/modules/prebuilt/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/modules/prebuilt/bin/fix-mac.sh:system/bin/fix-mac.sh
PRODUCT_PACKAGES += \
    lib_driver_cmd_wl12xx \
    dhcpcd.conf \
    hostapd.conf \
    calibrator \
    crda \
    regulatory.bin
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

PRODUCT_PROPERTY_OVERRIDES += \
    ro.mot.deep.sleep.supported=true \
    persist.mot.nfc.ce=50 \
    ro.com.google.clientid=android-motorola \
    ro.mot.proximity.delay=450 \
    mot.proximity.distance=60 \
    ro.mot.NfcEnabled=false \
    ro.product.drm.sd.enable=1 \
    ro.product.drm.cd.enable=1 \
    keyguard.no_require_sim=true \
    persist.radio.apn_delay=5000 \
    ro.mot.cambtntime=400 \
    ro.ril.status.polling.enable=0 \
    ro.config.personality=compat_layout \
    qemu.hw.mainkeys=0


ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.sf.lcd_density=240 \
    panel.physicalWidthmm=52 \
    panel.physicalHeightmm=89 \
    ro.opengles.version=131072 \
    gsm.net.interface=rmnet0 \
    persist.service.crashlog.enable=1 \
    persist.system.at-proxy.mode=0 \
    persist.ril-daemon.disable=0 \
    persist.sys.usb.config=mtp \
    persist.radio.ril_modem_state=1 \
    ro.secure=0 \
    ro.adb.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1

# SGX540 is slower with the scissor optimization enabled
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.disable_scissor_opt=true

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# IDC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/atmxt-i2c.idc:system/usr/idc/atmxt-i2c.idc \
    $(LOCAL_PATH)/idc/mxt224_touchscreen_0.idc:system/usr/idc/mxt224_touchscreen_0.idc \
    $(LOCAL_PATH)/idc/atmxt-i2c.idc:recovery/root/vendor/firmware/atmxt-i2c.idc \
    $(LOCAL_PATH)/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab \
    vendor/motorola/smi/proprietary/etc/firmware/atmxt-r2.tdat:recovery/root/vendor/firmware/atmxt-r2.tdat

# MediaProfile for xt890
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
#    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \

# Device specific permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/modules/prebuilt/etc/permissions/com.intel.internal.telephony.OemTelephony.xml:system/etc/permissions/com.intel.internal.telephony.OemTelephony.xml \
    $(LOCAL_PATH)/modules/prebuilt/etc/permissions/com.motorola.android.drmcommonconfig.xml:system/etc/permissions/com.motorola.android.drmcommonconfig.xml \
    $(LOCAL_PATH)/modules/prebuilt/etc/permissions/com.motorola.android.tcmd.xml:system/etc/permissions/com.motorola.android.tcmd.xml \
    $(LOCAL_PATH)/modules/prebuilt/etc/permissions/com.motorola.android.usbpermission.xml:system/etc/permissions/com.motorola.android.usbpermission.xml \
#    $(LOCAL_PATH)/modules/prebuilt/etc/permissions/com.motorola.android.dm.service.xml:system/etc/permissions/com.motorola.android.dm.service.xml \

# Device specific frameworks
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/modules/prebuilt/framework/com.intel.internal.telephony.OemTelephony.jar:system/framework/com.intel.internal.telephony.OemTelephony.jar \
#    $(LOCAL_PATH)/modules/prebuilt/framework/com.motorola.android.telephony.jar:system/framework/com.motorola.android.telephony.jar \
#    $(LOCAL_PATH)/modules/prebuilt/framework/com.motorola.atcmd.base.jar:system/framework/com.motorola.atcmd.base.jar \
#    $(LOCAL_PATH)/modules/prebuilt/framework/com.motorola.atcmd.pluginMgr.jar:system/framework/com.motorola.atcmd.pluginMgr.jar

PRODUCT_GMS_CLIENTID_BASE ?= android-motorola

$(call inherit-product, vendor/motorola/smi/smi-vendor.mk)

# FM Radio
#PRODUCT_PACKAGES += \
        kfmapp \
        FmRxApp \
        FmTxApp \
        FmService \
        libfmradio \
        fmradioif \
        com.ti.fm.fmradioif.xml

# Wifi Configuration Files
$(call inherit-product, hardware/ti/wlan/mac80211/wl128x-wlan-products.mk)

# Shared Transport (BLUETOOTH,FM,GPS)
#$(call inherit-product-if-exists, hardware/ti/wpan/ti-wpan-products.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
