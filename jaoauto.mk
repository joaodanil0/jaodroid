$(call  inherit-product,  device/casa/jaodroid/device.mk)
$(call inherit-product, packages/services/Car/car_product/build/car.mk)

DEVICE_FRAMEWORK_MANIFEST_FILE += device/google_car/common/manifest.xml

PRODUCT_PACKAGES += \
	librs_jni \
    DroidSansMono.ttf \
    AndroidClock.ttf \
    fonts.xml

PRODUCT_PACKAGES += \
    android.hardware.automotive.vehicle@V1-emulator-service \


