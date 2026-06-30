# ChiGlow Release Workflow v1

**Owner-approved: 2026-06-28**

## Philosophy
Focus on quality, polish, and a smooth first launch. Automation comes later.

## Workflow
GitHub → Test Build → Founder Testing → Final Adjustments → Manual App Store Submission

## Steps

### 1. Development & GitHub
- All code lives at `github.com/elena777blessings-create/chiglow`
- Team commits and pushes changes
- Freelancer pulls latest code for testing

### 2. Test Build
- Freelancer or team builds the app locally
- Android: `flutter build apk` or `flutter build appbundle`
- iOS: `flutter build ios` (requires Mac + Xcode)

### 3. Founder Testing
- Owner (Founder) installs and tests the build
- Feedback collected for final adjustments

### 4. Final Adjustments
- Bug fixes and polish based on founder feedback
- Commit and push to GitHub

### 5. Manual App Store Submission
- **Apple App Store:** Upload `.ipa` via Xcode → App Store Connect → TestFlight → Review → Release
- **Google Play:** Upload `.aab` via Google Play Console → Internal Testing → Review → Release

## Requirements
- 🍎 Apple Developer Program: $99/year
- 🤖 Google Play Console: $25 one-time

## Future
Once ChiGlow is established and releasing regular updates, we will explore automating with GitHub Actions.