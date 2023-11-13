$(call  inherit-product,  $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call  inherit-product,  $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# ================= Production Options =================
PRODUCT_NAME            :=  jaodroid
PRODUCT_DEVICE          :=  jaoboard
PRODUCT_BRAND           :=  generic
PRODUCT_MODEL           :=  XPTO
PRODUCT_MANUFACTURER    :=  jao
# ================= END =================

# ================= Local Variables =================
KERNEL_VERSION    :=  6.1-TS050_OLED_ADC
LOCAL_DTB         :=  device/casa/jaodroid/blackbox/kernel/${KERNEL_VERSION}
DTBO_UNSIGNED     :=  dtbo-unsigned.img
LOCAL_KERNEL      :=  device/casa/jaodroid/blackbox/kernel/${KERNEL_VERSION}/Image.lz4
HARDWARE_NAME     :=  jaodroid
TARGET_BOARD_PLATFORM := yukawa
# ================= END =================

# ================= Copy Kernel =================
PRODUCT_COPY_FILES  +=  \
  $(LOCAL_KERNEL):kernel
# ================= END =================

# ================= Super Partition Options =================
PRODUCT_BUILD_SUPER_PARTITION   :=  true
PRODUCT_USE_DYNAMIC_PARTITIONS  :=  true
# ================= END =================

# ================= Fstab Files =================
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/fstab/fstab.ramdisk.common:$(TARGET_COPY_OUT_RAMDISK)/fstab.$(HARDWARE_NAME)  \
  $(LOCAL_PATH)/fstab/fstab:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.$(HARDWARE_NAME)
# ================= END =================

# ================= Init Files =================
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/init/init.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.${HARDWARE_NAME}.rc \
  $(LOCAL_PATH)/init/init.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.${HARDWARE_NAME}.usb.rc \
  $(LOCAL_PATH)/init/init.adb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.${HARDWARE_NAME}.adb.rc \
  $(LOCAL_PATH)/init/init.recovery.rc:recovery/root/init.recovery.${HARDWARE_NAME}.rc  \
  $(LOCAL_PATH)/init/init.usb.rc:recovery/root/init.recovery.${HARDWARE_NAME}.usb.rc  \
  $(LOCAL_PATH)/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc \
# ================= END =================

# ================= Fastboot =================
PRODUCT_PACKAGES += \
  android.hardware.fastboot@1.0 \
  android.hardware.fastboot@1.0-impl-mock \
  fastbootd
# ================= END =================

# ================= keystore2 =================
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service
# ================= END =================

# ================= OpenGL ES implementation =================
PRODUCT_PACKAGES +=  \
    libGLES_mali \
    libGLES_android
# ================= END =================

# ================= suitable EGLConfig =================
PRODUCT_PACKAGES += \
    gralloc.yukawa \
    android.hardware.graphics.composer@2.2-impl \
    android.hardware.graphics.composer@2.2-service \
    android.hardware.graphics.allocator@2.0-service \
	android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.mapper@2.0-impl-2.1
# ================= END =================

# ================= SHIPPING_API_LEVEL =================
PRODUCT_SHIPPING_API_LEVEL := 31
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

PRODUCT_PACKAGES += \
    android.hardware.power-service.example

PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl-cuttlefish \
    android.hardware.health@2.1-service

PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service.software
# ================= END =================

# ================= DRM =================
PRODUCT_PACKAGES += \
    hwcomposer.drm_meson
# ================= END =================

# ================= Audio =================
PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    android.hardware.audio@7.0-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.soundtrigger@2.3-impl

PRODUCT_COPY_FILES += \
    device/casa/jaodroid/xml/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    device/casa/jaodroid/xml/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    device/casa/jaodroid/xml/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml
# ================= END =================

# ================= Settings Personal Configuration =================
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.sf.lcd_density=390 \

DEVICE_PACKAGE_OVERLAYS := \
  device/casa/jaodroid/overlay

PRODUCT_COPY_FILES +=  \
  frameworks/native/data/etc/android.software.app_widgets.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.app_widgets.xml
# ================= END =================

# ================= Bt/wifi firmware =================
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/blackbox/bt-wifi-firmware/BCM.hcd:$(TARGET_COPY_OUT_VENDOR)/firmware/brcm/BCM4359C0.hcd \
  $(LOCAL_PATH)/blackbox/bt-wifi-firmware/fw_bcm4359c0_ag.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/brcm/fw_bcm4359c0_ag.bin \
  $(LOCAL_PATH)/blackbox/bt-wifi-firmware/nvram.txt:$(TARGET_COPY_OUT_VENDOR)/firmware/brcm/nvram.txt
# ================= END =================

# ================= Wifi =================
PRODUCT_PACKAGES += \
  libwpa_client \
  wpa_supplicant \
  hostapd \
  wificond \
  wpa_cli 

PRODUCT_COPY_FILES +=  \
  frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml

PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/blackbox/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
  $(LOCAL_PATH)/blackbox/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
  $(LOCAL_PATH)/blackbox/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf
# ================= END =================

# ================= Bluetooth =================

PRODUCT_PACKAGES += \
  android.hardware.bluetooth@1.1-service.btlinux

PRODUCT_COPY_FILES +=  \
  frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
  frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
  frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
  frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
# ================= END =================

# ================= BootAnimation =================
PRODUCT_COPY_FILES += \
    device/casa/jaodroid/blackbox/bootanimation/bootanimation.zip:system/media/bootanimation.zip
# ================= END =================

# ================= USB Audio =================
PRODUCT_PACKAGES += \
    audio.usb.default \

PRODUCT_COPY_FILES += \
    device/casa/jaodroid/xml/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
# ================= END =================


PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.media_vol_steps=15 \
    ro.config.media_vol_default=15 \
    persist.dbg.keep_debugfs_mounted=True

PRODUCT_PACKAGES += \
    testOLED \
    casa.hal.oled \
    casa.hal.oled-service \
    OLedTest \
	casa.hal.oledmanager
	


