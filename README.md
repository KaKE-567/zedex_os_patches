# Zedex OS 1.0 — Source Patches & Device Trees

This repository contains the complete custom patches and manifest for building **Zedex OS 1.0 OFFICIAL** for Xiaomi SM6250 (Miatoll).

## 📱 Device & Vendor Trees (GitHub Repositories)
- **Kernel Tree:** https://github.com/KaKE-567/android_kernel_xiaomi_sm6250-artix
- **Common Device Tree:** https://github.com/KaKE-567/device_xiaomi_sm6250-common
- **Miatoll Device Tree:** https://github.com/KaKE-567/device_xiaomi_miatoll
- **Common Vendor Tree:** https://github.com/KaKE-567/vendor_xiaomi_sm6250-common
- **Miatoll Vendor Tree:** https://github.com/KaKE-567/vendor_xiaomi_miatoll

## 🚀 Features Included
1. **iOS Battery Meter:** Pixel-perfect translucent pill track with dual-contrast dynamic text splitting and green charging indicator.
2. **Gesture Navigation Pill:** Wide 136dp x 4.4dp thick handle bar.
3. **Gaming Thermals Engine:** Sustained 2.3 GHz Kryo Gold boost (75°C throttle ceiling, zero screen dimming).
4. **PUBG & BGMI 90 FPS Unlock:** Native OnePlus 8 Pro profile injection on app launch.
5. **Home Settings App Icon Size Slider:** Dynamic 70% to 140% icon scaling.
6. **Full-Screen Sukuna Boot Animation:** Native 1080x2400 resolution.
7. **Clean Signed Release:** Built with `release-keys`.

### 📦 Quick Patch Application
To apply all Zedex OS modifications onto any standard LineageOS 17.1 tree:
```bash
git -C frameworks/base apply /path/to/frameworks_base_complete.patch
git -C packages/apps/Settings apply /path/to/packages_apps_Settings.patch
git -C packages/apps/Trebuchet apply /path/to/packages_apps_Trebuchet.patch
git -C build/make apply /path/to/build_make.patch
```
