# ⚡ Zedex OS 1.0 OFFICIAL — Build Guide & Patches

<p align="center">
  <img src="https://raw.githubusercontent.com/KaKE-567/zedex_os_patches/main/banner.png" alt="Zedex OS" width="100%" onerror="this.style.display='none'"/>
</p>

<p align="center">
  <b>Modern Material You Quick Settings • iOS Status Bar • 90 FPS Gaming • Pitch Black Theme</b><br>
  <i>Designed for Xiaomi SM6250 (Redmi Note 9 Pro / Pro Max / 9S / POCO M2 Pro — miatoll)</i>
</p>

---

## 🌟 Features & Highlights

### 🎨 Material You Quick Settings (Android 13 / 16 Style)
- **Portrait Mode:** Android 13/14-style **2×2 capsule pill grid** with full panel width expansion, generous `10dp` spacing, and integrated modern thick brightness slider.
- **Landscape Mode:** True **edge-to-edge fullscreen** Quick Settings (`match_parent`) with a spacious **4×2 pill grid** across the display with full, untruncated text labels.
- **Pitch Black Scrim (QASSA Style):** Seamless solid pitch-black (`#FF000000`) background when pulling down notification shade.
- **Dynamic Lockscreen QS:** Lockscreen wallpaper is **100% visible and vivid** when idling; dynamically turns to pitch black when pulling down Quick Settings.
- **Clean UI:** Hidden footer drag handle in Half QS and status bar network traffic monitor positioned away from punch-hole.

### 🔋 iOS Status Bar & Battery
- **iOS Battery Meter:** Authentic translucent capsule pill with dynamic dual-contrast split text and vibrant green charging indicator.
- **Apple 3-Bar Wi-Fi Icon:** Custom bold 3-arc Wi-Fi vector drawables with 1.25x scaling for clean visibility.

### 🎮 Extreme Gaming & Performance
- **PUBG & BGMI 90 FPS Unlock:** Native OnePlus 8 Pro device profile spoofing on game launch.
- **Gaming Thermal Engine:** Sustained 2.3 GHz Kryo Gold boost with 75°C throttle ceiling and zero display dimming.

### 🛠️ System Customizations
- **Launcher Icon Size Slider:** Dynamic 70% to 140% app icon scaling in Trebuchet Home Settings.
- **Gesture Navigation Pill:** Wide 136dp × 4.4dp modern navigation bar.
- **Three-Finger Gesture:** Native three-finger swipe down screenshot toggle in Settings.
- **Custom Boot Animation:** Full-screen 1080×2400 Sukuna boot animation.
- **Signed Official Release:** Built with `release-keys` and clean build display fingerprints.

---

## 📱 Device Trees & Repositories

| Component | Repository | Branch | Path |
|---|---|---|---|
| **Kernel** | [android_kernel_xiaomi_sm6250-artix](https://github.com/KaKE-567/android_kernel_xiaomi_sm6250-artix) | `artixv4` | `kernel/xiaomi/sm6250` |
| **Device Common** | [device_xiaomi_sm6250-common](https://github.com/KaKE-567/device_xiaomi_sm6250-common) | `lineage-17.1` | `device/xiaomi/sm6250-common` |
| **Device Miatoll** | [device_xiaomi_miatoll](https://github.com/KaKE-567/device_xiaomi_miatoll) | `lineage-17.1` | `device/xiaomi/miatoll` |
| **Vendor Common** | [vendor_xiaomi_sm6250-common](https://github.com/KaKE-567/vendor_xiaomi_sm6250-common) | `lineage-17.1` | `vendor/xiaomi/sm6250-common` |
| **Vendor Miatoll** | [vendor_xiaomi_miatoll](https://github.com/KaKE-567/vendor_xiaomi_miatoll) | `lineage-17.1` | `vendor/xiaomi/miatoll` |
| **Patches** | [zedex_os_patches](https://github.com/KaKE-567/zedex_os_patches) | `main` | `zedex_os_patches` |

---

## 🛠️ Step-by-Step Build Guide

### 1. Set Up Build Environment (Ubuntu 20.04 / 22.04 LTS)

Install all required build tools and dependencies:
```bash
sudo apt update && sudo apt install -y \
    bc bison build-essential ccache curl flex g++-multilib gcc-multilib git \
    gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev \
    liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 \
    libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip \
    zlib1g-dev openjdk-8-jdk python3 python-is-python3 libtinfo5
```

Install the Android `repo` tool:
```bash
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
export PATH=~/bin:$PATH
```

---

### 2. Initialize LineageOS 17.1 Source Tree

Create your working directory and initialize the LineageOS 17.1 manifest:
```bash
mkdir -p ~/zedex-os
cd ~/zedex-os

repo init -u https://github.com/LineageOS/android.git -b lineage-17.1 --git-lfs
```

---

### 3. Add Miatoll Local Manifest

Create a local manifest file at `.repo/local_manifests/miatoll.xml`:
```bash
mkdir -p .repo/local_manifests
cat << 'EOF' > .repo/local_manifests/miatoll.xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <!-- Kernel -->
  <project name="KaKE-567/android_kernel_xiaomi_sm6250-artix" path="kernel/xiaomi/sm6250" remote="github" revision="artixv4" />

  <!-- Device Trees -->
  <project name="KaKE-567/device_xiaomi_sm6250-common" path="device/xiaomi/sm6250-common" remote="github" revision="lineage-17.1" />
  <project name="KaKE-567/device_xiaomi_miatoll" path="device/xiaomi/miatoll" remote="github" revision="lineage-17.1" />

  <!-- Vendor Blobs -->
  <project name="KaKE-567/vendor_xiaomi_sm6250-common" path="vendor/xiaomi/sm6250-common" remote="github" revision="lineage-17.1" />
  <project name="KaKE-567/vendor_xiaomi_miatoll" path="vendor/xiaomi/miatoll" remote="github" revision="lineage-17.1" />
</manifest>
EOF
```

Sync the entire source tree (this will download ~35-40 GB):
```bash
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
```

---

### 4. Apply Zedex OS Patches

Clone this repository and run the automated patch applier:
```bash
cd ~/zedex-os
git clone https://github.com/KaKE-567/zedex_os_patches.git

# Run the automated patcher
./zedex_os_patches/apply_patches.sh
```

#### *Alternative: Apply Patches Manually*
If you prefer applying patches manually:
```bash
git -C frameworks/base apply --whitespace=nowarn zedex_os_patches/patches/frameworks_base_complete.patch
git -C packages/apps/Settings apply --whitespace=nowarn zedex_os_patches/patches/packages_apps_Settings.patch
git -C packages/apps/Trebuchet apply --whitespace=nowarn zedex_os_patches/patches/packages_apps_Trebuchet.patch
git -C packages/apps/LineageParts apply --whitespace=nowarn zedex_os_patches/patches/packages_apps_LineageParts.patch
git -C build/make apply --whitespace=nowarn zedex_os_patches/patches/build_make.patch
git -C vendor/lineage apply --whitespace=nowarn zedex_os_patches/patches/vendor_lineage.patch
```

---

### 5. Compile Zedex OS

Configure CCache (recommended for fast incremental builds):
```bash
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 50G
```

Initialize build environment and compile:
```bash
source build/envsetup.sh
lunch lineage_miatoll-userdebug
mka bacon -j$(nproc --all)
```

Upon completion, your flashable ROM zip will be located at:
```bash
out/target/product/miatoll/lineage-Zedex-1.0-*-OFFICIAL-miatoll.zip
```

---

## 📲 Installation / Flashing Instructions

### Requirements:
- Unlocked Bootloader
- OrangeFox Recovery (R11.1+ recommended) or TWRP

### Clean Flash (First-time install):
1. Boot to Recovery (**Power + Volume Up**).
2. Wipe **Dalvik / ART Cache, Cache, System, Vendor, Data**.
3. Flash `lineage-Zedex-1.0-*-OFFICIAL-miatoll.zip`.
4. *(Optional)* Flash GApps (Android 10 ARM64 BitGApps / OpenGApps Nano).
5. *(Optional)* Flash Magisk / KernelSU for root.
6. Format Data (`yes`) if encrypted.
7. Reboot System.

### Dirty Flash / Updating from previous Zedex build:
1. Boot to Recovery.
2. Wipe **Dalvik / ART Cache & Cache**.
3. Flash update `lineage-Zedex-1.0-*-OFFICIAL-miatoll.zip`.
4. *(Optional)* Re-flash Magisk / KernelSU if needed.
5. Reboot System.

---

## 👨‍💻 Maintainer & Credits

- **ROM Maintainer / Developer:** [@KaKE-567](https://github.com/KaKE-567)
- **Base:** [LineageOS Project](https://github.com/LineageOS)
- **Kernel:** [Artix Kernel Tree](https://github.com/KaKE-567/android_kernel_xiaomi_sm6250-artix)
- **Community:** Xiaomi SM6250 / Miatoll Community

---
<p align="center">Made with ❤️ for Xiaomi Miatoll</p>
