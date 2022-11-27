# ================= Architecture =================
# Primary Arch
TARGET_ARCH				:= arm64
TARGET_ARCH_VARIANT		:= armv8-a
TARGET_CPU_ABI			:= arm64-v8a
TARGET_CPU_VARIANT		:= cortex-a53

# Secondary Arch
TARGET_2ND_ARCH			:= arm
TARGET_2ND_ARCH_VARIANT	:= armv8-a
TARGET_2ND_CPU_ABI		:= armeabi-v7a
TARGET_2ND_CPU_ABI2		:= armeabi
TARGET_2ND_CPU_VARIANT	:= cortex-a53
# ================= END =================

# ================= MANIFEST =================
DEVICE_MANIFEST_FILE	+= device/casa/jaodroid/xml/manifest.xml
# ================= END =================

# ================= Kernel Configs =================
BOARD_KERNEL_CMDLINE		+= no_console_suspend 
BOARD_KERNEL_CMDLINE		+= console=ttyAML0,115200
BOARD_KERNEL_CMDLINE		+= earlycon
BOARD_KERNEL_CMDLINE		+= printk.devkmsg=off
BOARD_KERNEL_CMDLINE		+= loglevel=7
BOARD_KERNEL_CMDLINE		+= init=/init
BOARD_KERNEL_CMDLINE		+= firmware_class.path=/vendor/firmware
BOARD_KERNEL_CMDLINE		+= androidboot.boot_devices=soc/ffe07000.mmc 
BOARD_KERNEL_CMDLINE		+= androidboot.hardware=$(HARDWARE_NAME)
BOARD_KERNEL_CMDLINE		+= androidboot.selinux=permissive
# ================= END =================

# ================= Boot Image =================
BOARD_INCLUDE_DTB_IN_BOOTIMG	:= true
BOARD_KERNEL_OFFSET				:= 0x1080000
BOARD_MKBOOTIMG_ARGS			:= --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_BOOT_HEADER_VERSION		:= 2
BOARD_KERNEL_TAGS_OFFSET		:= 0x1000000
BOARD_MKBOOTIMG_ARGS			+= --header_version $(BOARD_BOOT_HEADER_VERSION)
# ================= END =================

# ================= Partitions Size =================
BOARD_BOOTIMAGE_PARTITION_SIZE			:=	33554432
# ================= END =================