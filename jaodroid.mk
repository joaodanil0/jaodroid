$(call  inherit-product,  $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call  inherit-product,  $(SRC_TARGET_DIR)/product/full_base.mk)

# ================= Production Options =================
PRODUCT_NAME            :=  jaodroid
PRODUCT_DEVICE          :=  jaoboard
PRODUCT_BRAND           :=  generic
PRODUCT_MODEL           :=  XPTO
PRODUCT_MANUFACTURER    :=  jao
# ================= END =================

# ================= Local Variables =================
KERNEL_VERSION    :=  5.4
LOCAL_DTB         :=  device/casa/jaodroid/blackbox/${KERNEL_VERSION}
DTBO_UNSIGNED     :=  dtbo-unsigned.img
LOCAL_KERNEL      :=  device/casa/jaodroid/blackbox/${KERNEL_VERSION}/Image.lz4
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