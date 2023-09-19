#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# A/B
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Product characteristics
PRODUCT_CHARACTERISTICS := nosdcard

# Rootdir
PRODUCT_PACKAGES += \
    init.fingerprint.sh \
    init.insmod.sh \
    init.power.sh \
    init.qcom.devstart.sh \
    init.qcom.ipastart.sh \
    init.radio.sh \
    init.ramoops.sh \

PRODUCT_PACKAGES += \
    fstab.taimen \
    init.taimen.rc \
    init.taimen.usb.rc \
    init.wahoo.usb.rc \
    ueventd.rc \
    init.recovery.taimen.rc \
    init.rc \

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 26

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/google/taimen/taimen-vendor.mk)
