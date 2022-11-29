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
  $(LOCAL_PATH)/fstab/fstab.ramdisk.common:$(TARGET_COPY_OUT_RAMDISK)/fstab.$(HARDWARE_NAME)
# ================= END =================

# ================= Init Files =================
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/init/init.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.${HARDWARE_NAME}.rc \
	$(LOCAL_PATH)/init/init.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.${HARDWARE_NAME}.usb.rc \
	$(LOCAL_PATH)/init/init.adb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.${HARDWARE_NAME}.adb.rc
# ================= END =================