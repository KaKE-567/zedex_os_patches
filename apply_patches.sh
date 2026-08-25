#!/usr/bin/env bash
#
# Zedex OS 1.0 — Automated Patch Applier
#

set -e

SRC_DIR="${1:-$(pwd)}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ ! -d "$SRC_DIR/frameworks/base" ]; then
    echo "[-] Error: '$SRC_DIR' does not appear to be an Android source root directory!"
    echo "[*] Usage: ./apply_patches.sh /path/to/lineage-17.1"
    exit 1
fi

echo "======================================================"
echo "      🚀 Applying Zedex OS 1.0 OFFICIAL Patches       "
echo "======================================================"
echo "[*] Target Android Tree: $SRC_DIR"

echo "[1/7] 📱 Patching frameworks/base (SystemUI, Material You QS, iOS battery, K30 Ultra 90FPS+HDR)..."
git -C "$SRC_DIR/frameworks/base" apply --whitespace=nowarn "$SCRIPT_DIR/patches/frameworks_base_complete.patch"

echo "[2/7] ⚙️  Patching packages/apps/Settings (Three-finger gesture, Telegram Maintainer button)..."
git -C "$SRC_DIR/packages/apps/Settings" apply --whitespace=nowarn "$SCRIPT_DIR/patches/packages_apps_Settings.patch"

echo "[3/7] 🏠 Patching packages/apps/Trebuchet (Launcher icon size slider 70-140%)..."
git -C "$SRC_DIR/packages/apps/Trebuchet" apply --whitespace=nowarn "$SCRIPT_DIR/patches/packages_apps_Trebuchet.patch"

echo "[4/7] 📊 Patching packages/apps/LineageParts (Network traffic monitor on notch)..."
git -C "$SRC_DIR/packages/apps/LineageParts" apply --whitespace=nowarn "$SCRIPT_DIR/patches/packages_apps_LineageParts.patch"

echo "[5/7] 📶 Patching lineage-sdk (Accurate real-time network traffic speed meter & dynamic units)..."
git -C "$SRC_DIR/lineage-sdk" apply --whitespace=nowarn "$SCRIPT_DIR/patches/lineage_sdk.patch"

echo "[6/7] 🔨 Patching build/make (Release keys signing, clean build fingerprint)..."
git -C "$SRC_DIR/build/make" apply --whitespace=nowarn "$SCRIPT_DIR/patches/build_make.patch"

echo "[7/7] 🎨 Patching vendor/lineage (Zedex OS branding, OFFICIAL buildtype, wallpaper)..."
git -C "$SRC_DIR/vendor/lineage" apply --whitespace=nowarn "$SCRIPT_DIR/patches/vendor_lineage.patch"

echo "======================================================"
echo "  ✅ All Zedex OS 1.0 patches applied successfully!   "
echo "======================================================"
