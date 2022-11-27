$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# ================= Production Options =================
PRODUCT_NAME            := jaodroid
PRODUCT_DEVICE          := jaoboard
PRODUCT_BRAND           := generic
PRODUCT_MODEL           := XPTO
PRODUCT_MANUFACTURER    := jao
# ================= END =================

# ================= Local Variables =================
KERNEL_VERSION			:= 5.4
LOCAL_KERNEL            := device/casa/jaodroid/blackbox/${KERNEL_VERSION}/Image.lz4
LOCAL_DTB               := device/casa/jaodroid/blackbox/${KERNEL_VERSION}
DTBO_UNSIGNED			:= dtbo-unsigned.img
# ================= END =================