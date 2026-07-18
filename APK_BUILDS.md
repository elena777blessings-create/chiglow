# 🪷 ChiGlow — Automatic APK Builds

## How It Works

Every time code is pushed to `main`, GitHub Actions automatically:
1. ✅ Checks out the latest code
2. ✅ Reads the version from `pubspec.yaml`
3. ✅ Builds the Android APK in release mode
4. ✅ **Renames the APK with the version number** (e.g., `ChiGlow-1.0.0+1-ARM64.apk`)
5. ✅ Uploads it as a downloadable artifact

## Versioned APK Filenames

Instead of generic filenames, you'll see:

```
ChiGlow-1.0.0+1-ARM64.apk    ← version visible in the filename!
ChiGlow-1.0.0+1-ARM32.apk
ChiGlow-1.0.0+1-x86_64.apk
```

So you always know exactly which version you're testing.

## How to Download the Latest APK

### Option 1: From Actions (every push)
1. Go to **GitHub → ChiGlow repo → Actions tab**
2. Click the latest successful "Build Android APK" run
3. Scroll down to **Artifacts**
4. Download the one for your phone:
   - **`ChiGlow-*-ARM64`** — for most modern Android phones ✅
   - `ChiGlow-*-ARM32` — for older phones
   - `ChiGlow-*-x86_64` — for emulators

### Option 2: From Releases (version tags)
1. When a version tag is pushed (e.g., `v5.59.0`), a **GitHub Release** is automatically created
2. The release page shows:
   - ✅ **What's new** — all commit messages since the last release
   - ✅ **Download links** — APK files with version in the name
3. Go to **GitHub → ChiGlow repo → Releases tab**
4. Read the release notes, then download the APK

## Example Release Page

> ## 🪷 ChiGlow v5.59.0
>
> ### What's New ✨
> - Added zodiac profile images
> - Updated Settings page
> - Improved Membership card spacing
> - New app icon
>
> ### 📱 Download
> | Device | File |
> |--------|------|
> | Most modern phones | `ChiGlow-v5.59.0-ARM64.apk` |
> | Older phones | `ChiGlow-v5.59.0-ARM32.apk` |
> | Emulators | `ChiGlow-v5.59.0-x86_64.apk` |

## Installing on Your Phone

1. Download the **ARM64 APK** to your phone
2. Open the file — Android will ask permission to install from unknown sources
3. Allow it and install
4. Open ChiGlow and enjoy! 🎉

## Workflow File

Located at: `.github/workflows/build-apk.yml`

This runs alongside the existing web deploy workflow — they don't interfere.

---

*Note: This file needs to be committed and pushed to main to activate it.*