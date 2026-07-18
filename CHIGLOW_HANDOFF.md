# 🪷 ChiGlow — Complete Handoff Package

> **Project:** ChiGlow — Feng Shui Wellness App  
> **Repository:** `github.com/elena777blessings-create/chiglow`  
> **Framework:** Flutter (cross-platform: iOS + Android + Web)  
> **Language:** Dart 3.x  
> **Version:** 1.0.0+1  
> **Last Updated:** 2026-07-17  

---

## 📋 Table of Contents

1. [Project Overview](#1-project-overview)
2. [Repository Structure](#2-repository-structure)
3. [Architecture](#3-architecture)
4. [Setup Instructions](#4-setup-instructions)
5. [Build Instructions](#5-build-instructions)
6. [Dependencies](#6-dependencies)
7. [Configuration Files](#7-configuration-files)
8. [Environment & CI/CD](#8-environment--cicd)
9. [App Screens & Routing](#9-app-screens--routing)
10. [Energy Engine](#10-energy-engine)
11. [Content Library](#11-content-library)
12. [Design System](#12-design-system)
13. [Monetization](#13-monetization)
14. [Deployment](#14-deployment)
15. [Pending Changes](#15-pending-changes)
16. [Roadmap & Known Issues](#16-roadmap--known-issues)

---

## 1. Project Overview

ChiGlow is a modern wellness app that combines ancient Feng Shui wisdom with AI-powered room analysis, Chinese zodiac insights, color psychology, and energy guidance.

**Tagline:** *"Illuminate Your Chi. Glow Every Day."*  
**Sub-tagline:** *"Flow. Grow. Bloom."*

### Brand Philosophy
| Symbol | Meaning |
|--------|---------|
| 🐟 White Koi | Flow |
| 🪷 Gold Lotus | Harmony |
| 💎 Crystal Blue Water | Positive Energy |
| ✨ Golden Light | Abundance |
| 🌅 Morning Sun | New Beginnings |
| 🌳 Nature | Healing |

### Target Audience
Urban millennials and Gen Z (25–45) interested in Feng Shui, wellness, spirituality, home decor, astrology, and personal development.

---

## 2. Repository Structure

```
chiglow/
├── .github/workflows/deploy.yml   # GitHub Actions CI/CD (Web → GitHub Pages)
├── android/                        # Android platform configuration
├── ios/                            # iOS platform configuration
├── assets/
│   ├── images/                     # All visual assets (room images, koi, zodiac, etc.)
│   └── icons/                      # App icon (app_icon.png)
├── lib/
│   ├── config/
│   │   └── energy_config.dart      # Business rules for energy calculations
│   ├── data/
│   │   ├── zodiac_profiles.json           # 12 Chinese zodiac profiles
│   │   ├── feng_shui_recommendations.json # Room-by-room Feng Shui (11 rooms)
│   │   ├── daily_affirmations.json        # 40+ affirmations
│   │   ├── color_psychology.json          # Color-element-goal guidance
│   │   └── seasonal_adjustments.json      # 4 seasons × 10 tips
│   ├── docs/
│   │   └── energy_engine_architecture.md  # Detailed engine docs
│   ├── models/
│   │   └── energy_models.dart      # Data models (EnergyArea, RoomModel, etc.)
│   ├── providers/
│   │   └── app_state_provider.dart # Central state management (ChangeNotifier)
│   ├── screens/                    # 15 screen files (see Section 9)
│   ├── services/
│   │   ├── energy_engine.dart      # Core calculation engine (pure functions)
│   │   ├── content_service.dart    # Offline Feng Shui content library
│   │   ├── kua_calculator.dart     # Kua number calculator
│   │   └── journal_storage.dart    # Journal persistence via SharedPreferences
│   ├── theme/
│   │   └── app_theme.dart          # ChiGlow design system (colors, fonts, themes)
│   ├── utils/
│   │   └── asset_images.dart       # Centralized asset path mappings
│   ├── widgets/                    # Reusable widgets (GlowCard, GlobalHeader, etc.)
│   └── main.dart                   # App entry point + route definitions
├── test/                           # Unit tests
├── web/                            # Web platform configuration
├── pubspec.yaml                    # Dart/Flutter dependencies
├── pubspec.lock                    # Locked dependency versions
├── analysis_options.yaml           # Linting rules
├── ASSET_MANIFEST.md               # Complete asset inventory
├── RELEASE_WORKFLOW_v1.md          # Release process documentation
└── README.md                       # Basic readme
```

---

## 3. Architecture

### State Management
- **Provider** (ChangeNotifier pattern) — `AppStateProvider` is the single source of truth
- Screens use `context.watch<AppStateProvider>()` for reactive updates
- No BLoC, Riverpod, or Redux

### Data Flow
```
User Input → AppStateProvider → EnergyEngine → Element Scores → Bagua Scores → UI
```

### Routing
- Custom `onGenerateRoute` in `MaterialApp` (no named routes library)
- 13 routes defined (see Section 9)
- Fade transitions (600ms) between screens

### Offline-First
- All content is bundled as JSON files in `lib/data/`
- No network calls required for core features
- Journal entries persist via `SharedPreferences`

---

## 4. Setup Instructions

### Prerequisites
| Tool | Version | Notes |
|------|---------|-------|
| Flutter SDK | 3.27.x (stable) | Install via `flutter upgrade` or `fvm` |
| Dart SDK | >=3.2.0 <4.0.0 | Bundled with Flutter |
| Xcode | Latest | Required for iOS (macOS only) |
| Android Studio | Latest | Required for Android |
| Git | Any | For version control |

### Clone & Install
```bash
git clone https://github.com/elena777blessings-create/chiglow.git
cd chiglow
flutter pub get
```

### Run Development
```bash
# Run on connected device / emulator
flutter run

# Run on specific platform
flutter run -d chrome        # Web
flutter run -d ios            # iOS (macOS only)
flutter run -d android        # Android
```

### Verify Setup
```bash
flutter doctor   # Check all dependencies are satisfied
flutter test     # Run tests
```

---

## 5. Build Instructions

### Android
```bash
# APK (for testing)
flutter build apk --release

# App Bundle (for Play Store)
flutter build appbundle --release

# Output location: build/app/outputs/
```

### iOS
```bash
# Requires macOS with Xcode
flutter build ios --release

# Open in Xcode for archive & submission
open ios/Runner.xcworkspace
```

### Web
```bash
# Standard build
flutter build web --release

# With custom base-href (for GitHub Pages subpath)
flutter build web --release --base-href=/chiglow/
```

### Build Artifacts
| Platform | Output Path | Format |
|----------|-------------|--------|
| Android APK | `build/app/outputs/flutter-apk/app-release.apk` | .apk |
| Android AAB | `build/app/outputs/bundle/release/app-release.aab` | .aab |
| iOS | `build/ios/iphoneos/Runner.app` | .app |
| Web | `build/web/` | Static HTML/JS/CSS |

---

## 6. Dependencies

### Production Dependencies (pubspec.yaml)
| Package | Version | Purpose |
|---------|---------|---------|
| `flutter` | SDK | Core framework |
| `cupertino_icons` | ^1.0.6 | iOS-style icons |
| `google_fonts` | ^6.1.0 | Playfair Display, Poppins, Quicksand fonts |
| `provider` | ^6.1.1 | State management |
| `sensors_plus` | ^4.0.2 | Device sensors (compass) |
| `image_picker` | ^1.0.7 | Camera/gallery for room scans |
| `shared_preferences` | ^2.2.2 | Local persistence (journal, settings) |
| `flutter_compass` | ^0.7.0 | Compass heading for Feng Shui compass |
| `vector_math` | ^2.1.4 | Vector math for compass calculations |

### Dev Dependencies
| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_test` | SDK | Unit/widget testing |
| `flutter_lints` | ^3.0.1 | Linting rules |
| `flutter_launcher_icons` | ^0.13.1 | App icon generation |

---

## 7. Configuration Files

### `pubspec.yaml` — Key Sections
```yaml
name: chiglow
version: 1.0.0+1
environment:
  sdk: '>=3.2.0 <4.0.0'

flutter:
  uses-material-design: true
  assets:
    - assets/images/
    - assets/icons/

flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/icons/app_icon.png"
```

### `analysis_options.yaml`
```yaml
include: package:flutter_lints/flutter.yaml
linter:
  rules:
    prefer_const_constructors: true
    prefer_const_declarations: true
    avoid_print: true
    prefer_single_quotes: true
```

### `assets/icons/app_icon.png`
- **Source:** Google Drive — `1ULPlsZpYK6IWzgJA6ZwBesPhYph5upWC`
- **Current state:** Needs replacement — the icon on disk was zoomed/cropped and lost the full koi composition
- **Fix:** Download the original artwork and replace the file without any processing

---

## 8. Environment & CI/CD

### GitHub Actions (`.github/workflows/deploy.yml`)
```yaml
Trigger: Push to main branch
Jobs:
  1. build:
     - Checkout code
     - Setup Flutter 3.27.x
     - flutter clean && flutter pub get
     - flutter build web --release --base-href=/chiglow/
     - Upload build/web as Pages artifact
  2. deploy:
     - Deploy to GitHub Pages
```

### Environment Variables
None currently required. The app is entirely offline-first with no backend.

### Future Requirements
| Service | Purpose | When Needed |
|---------|---------|-------------|
| Apple Developer Program ($99/yr) | App Store submission | For iOS release |
| Google Play Console ($25 one-time) | Play Store submission | For Android release |
| RevenueCat or IAP | Subscription payments | For monetization launch |

---

## 9. App Screens & Routing

| Route | Screen | File | Purpose |
|-------|--------|------|---------|
| `/splash` | `SplashScreen` | `screens/splash_screen.dart` | Animated splash with koi/lotus |
| `/home` | `HomeScreen` | `screens/home_screen.dart` | Main dashboard |
| `/room-scan` | `RoomScanScreen` | `screens/room_scan_screen.dart` | AI room scan camera |
| `/scan-guide` | `ScanGuideScreen` | `screens/scan_guide_screen.dart` | Scanning instructions |
| `/room-results` | `RoomResultsScreen` | `screens/room_results_screen.dart` | Scan analysis results |
| `/zodiac-profile` | `ZodiacProfileScreen` | `screens/zodiac_profile_screen.dart` | Daily zodiac energy |
| `/year-ahead` | `YearAheadScreen` | `screens/year_ahead_screen.dart` | Yearly forecast |
| `/compass` | `CompassScreen` | `screens/compass_screen.dart` | Feng Shui compass |
| `/color-coaching` | `ColorCoachingScreen` | `screens/color_coaching_screen.dart` | Color psychology guide |
| `/energy-dashboard` | `EnergyDashboardScreen` | `screens/energy_dashboard_screen.dart` | Love/Wealth/Health/Career |
| `/settings` | `SettingsScreen` | `screens/settings_screen.dart` | Profile, zodiac, preferences |
| `/upgrade` | `UpgradeScreen` | `screens/upgrade_screen.dart` | Pricing & subscriptions |
| `/harmony-journal` | `HarmonyJournalScreen` | `screens/harmony_journal_screen.dart` | Saved scan history |
| `/journal-detail` | `JournalDetailScreen` | `screens/journal_detail_screen.dart` | Single scan report |

---

## 10. Energy Engine

The Energy Engine is the core calculation system. Full architecture docs are in `lib/docs/energy_engine_architecture.md`.

### Key Principles
1. **Config holds rules, engine holds logic** — `EnergyConfig` has weights, `EnergyEngine` has pure functions
2. **Pure functions** — no side effects, no state in the engine
3. **Provider is the bridge** — screens read from provider, never call engine directly
4. **All outputs clamped 10–95**

### Bagua Life Area Formulas
| Area | Formula | Primary |
|------|---------|---------|
| ❤️ Love | Earth×50% + Fire×25% + Metal×25% | Earth |
| 💰 Wealth | Wood×50% + Water×25% + Fire×25% | Wood |
| 💚 Health | Earth×40% + OverallAvg×60% | Earth |
| 💼 Career | Water×50% + Metal×25% + Wood×25% | Water |

### Adding a New Life Area
1. Add rule to `EnergyConfig.baguaRules`
2. No engine changes needed — `calculateBaguaScores()` is dynamic
3. Add getter in `AppStateProvider`
4. Create UI screen

---

## 11. Content Library

All content is bundled in `lib/data/` as JSON files:

| File | Content | Size |
|------|---------|------|
| `zodiac_profiles.json` | 12 zodiac signs (personality, element, lucky colors, compatibility) | ~15KB |
| `feng_shui_recommendations.json` | Room tips for 11 room types | ~25KB |
| `daily_affirmations.json` | 40+ affirmations across 7 categories | ~8KB |
| `color_psychology.json` | Color meanings by element + goals | ~5KB |
| `seasonal_adjustments.json` | 4 seasons with energy themes and tips | ~10KB |

### Offline Content Service (`lib/services/content_service.dart`)
- `affirmationForToday()` — Returns daily affirmation by date
- `tipsForRoom(roomType)` — Returns Feng Shui tips for a room
- 90+ unique Feng Shui tips, 10 affirmations (extendable), 9 color guidance entries

### Zodiac Data
12 profiles stored in `AppStateProvider.zodiacData` (lines 138-247 of `app_state_provider.dart`):
- Element mapping, lucky colors, lucky directions, compatibility

---

## 12. Design System

### Color Palette
| Role | Color | Hex |
|------|-------|------|
| Primary | Rich ChiGlow Red | `#B33A35` |
| Labels | Warm Bronze Gold | `#A67C2E` |
| Body Text | Charcoal | `#4A4A4A` |
| Supporting | Medium Gray | `#707070` |
| Background | Cream White | `#FFF8E7` |
| Accent | Gold | `#FFD700` |

### Typography
| Usage | Font | Weight |
|-------|------|--------|
| Headings | Playfair Display | 600–700 |
| UI Text | Poppins | 500–600 |
| Body/Affirmations | Quicksand | 400–700 |

### Components (in `lib/widgets/`)
| Widget | File | Purpose |
|--------|------|---------|
| `GlowCard` | `widgets/glow_card.dart` | Rounded card with subtle glow shadow |
| `GlobalHeader` | `widgets/global_header.dart` | Page header with artwork & tagline |
| `PageHeader` | `widgets/page_header.dart` | Simpler header variant |
| `HomeButton` | `widgets/home_button.dart` | "Home" navigation button |
| `ChiParticles` | `widgets/chi_particles.dart` | Floating particle animation |

---

## 13. Monetization

### Pricing Tiers (defined in `screens/upgrade_screen.dart`)
| Tier | Price | Features |
|------|-------|----------|
| Free | $0 | Basic room scan + limited daily ritual |
| Monthly | $9.99/mo | Complete ChiGlow experience |
| Yearly | $59.99/yr | Member Favorite — unlimited access |
| Founder's Edition | $49 one-time | Lifetime access |

### Payment Status
- **⚠️ Payment processing is not yet integrated**
- Requires RevenueCat or native IAP (StoreKit/Google Play Billing)
- Pricing screen is designed and ready — backend needs to be wired

---

## 14. Deployment

### Current Deployment
| Platform | Method | URL |
|----------|--------|-----|
| Web | GitHub Actions → GitHub Pages | Auto-deploys on push to `main` |

### App Store Submission (Future)
1. **iOS:** Build with `flutter build ios` → Archive in Xcode → Upload to App Store Connect → TestFlight → Review → Release
2. **Android:** Build with `flutter build appbundle` → Upload to Google Play Console → Internal Testing → Review → Release

### Required Accounts
- 🍎 Apple Developer Program: $99/year
- 🤖 Google Play Console: $25 one-time

---

## 15. Pending Changes

These code changes are saved on disk but **not yet pushed to GitHub** due to the sandbox being unresponsive:

### 1. 🐉 Animal Alignment Fix (`lib/screens/settings_screen.dart`)
```dart
// Line 63 — Added alignment to shift animals 15% down in circle
alignment: Alignment(0, 0.15),
```
**Files:** `settings_screen.dart`, `year_ahead_screen.dart`

### 2. 🌿 Season Cards Green Text (`lib/screens/year_ahead_screen.dart`)
```dart
// Lines 234, 236 — Element and forecast text changed to bold green
color: Color(0xFF2E7D32),
fontWeight: FontWeight.w700,
```

### 3. 📱 App Icon Update
- **Source:** `https://drive.google.com/file/d/1ULPlsZpYK6IWzgJA6ZwBesPhYph5upWC`
- **Action:** Replace `assets/icons/app_icon.png` with original artwork (no zoom/crop)
- **Then run:** `flutter pub run flutter_launcher_icons` to regenerate all platform sizes

---

## 16. Roadmap & Known Issues

### Known Issues
1. **Sandbox shell is unresponsive** — the development sandbox's command line has been frozen since 2026-07-16. All changes must be pushed manually or via a different environment
2. **App icon zoomed** — the deployed icon cuts off parts of the original koi composition
3. **Payment not integrated** — no real payment processing; upgrade screen is UI only

### Upcoming Work
- 🔜 **Splash Screen redesign** — animated koi pond with lotus, golden light, morning sun
- 🔜 **RevenueCat/IAP integration** — for subscription payments
- 🔜 **Room scan AI analysis** — real element detection from photos (currently uses mock data)
- 🔜 **Notifications** — daily affirmations push notifications
- 🔜 **Dark mode** — partially defined in provider but not fully themed

### Quick Start for New Developer
```bash
# 1. Clone
git clone https://github.com/elena777blessings-create/chiglow.git
cd chiglow

# 2. Install deps
flutter pub get

# 3. Fix app icon
# Download from Google Drive and replace assets/icons/app_icon.png
# Then run: flutter pub run flutter_launcher_icons

# 4. Push pending changes
# Edit settings_screen.dart and year_ahead_screen.dart (see Section 15)
git add .
git commit -m "v5.58.1: Animal alignment + season cards green"
git push origin main

# 5. Run
flutter run -d chrome

# 6. Build & deploy
flutter build web --release --base-href=/chiglow/
```