# 🪷 ChiGlow — Version History

> *"When did we build that?"*

---

## v5.0 Series — Foundation & Core Features

### v5.0 — Initial App Launch
- First working version of ChiGlow
- Basic home screen with zodiac greeting
- Room scan placeholder
- Core navigation

### v5.1 — Room Scanning
- Camera integration for room scanning
- Room type selection (Living Room, Bedroom, Kitchen, etc.)
- Basic room results with Feng Shui tips

### v5.2 — Zodiac Profiles
- 12 Chinese zodiac animal profiles with personality descriptions
- Zodiac selection in settings
- Lucky colors, directions, and compatibility

### v5.3 — Daily Affirmations
- 40+ daily affirmations across 7 categories
- Daily rotation based on date
- Koi-themed affirmation cards

### v5.4 — Feng Shui Compass
- Real-time compass using device sensors
- Bagua map overlay
- Direction-based Feng Shui guidance

### v5.5 — Color Coaching
- Color psychology guide by element
- Goal-based color recommendations
- Color swatch visualization

### v5.6 — Settings & Personalization
- Profile editing (name, zodiac, birth year)
- Dark mode toggle (UI placeholder)
- Daily reminders toggle
- App icon deployment

### v5.7 — Splash & Onboarding
- Animated splash screen with koi and lotus
- Smooth fade transitions between screens
- First-time user experience flow

### v5.8 — Energy Dashboard
- Love, Wealth, Health, Career energy scores
- Visual energy bars with color coding
- Dashboard layout with Bagua life areas

---

## v5.9 Series — Year Ahead & Seasonal

### v5.9 — Year Ahead Redesign
- Year Ahead Forecast screen with zodiac artwork
- Monthly overview cards (4 seasons)
- Year element balance visualization
- Lucky items section

### v5.10 — 48 Seasonal Insights
- 12 zodiac signs × 4 seasons = 48 unique seasonal forecasts
- Spring (Wood), Summer (Fire), Autumn (Metal), Winter (Water) themes
- Seasonal guidance tailored to each zodiac animal

### v5.11 — Animal Cards
- Year cover artwork for all 12 zodiac animals
- Zodiac profile screen with animal image
- Visual identity for each zodiac sign

### v5.12 — Overall Balance
- Five Element balance visualization
- Element bars (Wood, Fire, Earth, Metal, Water)
- Dynamic scoring based on zodiac + year energy

---

## v5.13 Series — Engine & Architecture

### v5.13 — Energy Engine
- Central calculation engine (`energy_engine.dart`)
- Five Element balance calculation (Sheng/Ke cycles)
- Zodiac → primary element mapping
- Year energy modulation (Heavenly Stem)

### v5.14 — Bagua Dashboard
- Bagua life area scoring system
- Love (Earth), Wealth (Wood), Health (Overall), Career (Water)
- Configurable scoring rules in `energy_config.dart`
- Room scan blend function (future-ready)

### v5.15 — Configuration + Architecture
- `EnergyConfig` separated from engine logic
- `energy_engine_architecture.md` documentation
- Element cycle relationships documented
- Bagua scoring rules made configurable
- Room scan blend parameters defined

---

## v5.50 Series — Premium & Polish

### v5.50 — Premium/Upgrade Screen
- Three-tier pricing (Monthly $9.99, Yearly $59.99, Founder's $49)
- Gold text formatting and card layout
- Closing blessing "Flow, Grow, Bloom" in Great Vibes script
- Elegant footer links

### v5.51 — Home Button Navigation
- HomeButton widget added to all 14 non-home screens
- Transparent, bold rich red "Home" text
- Consistent navigation across the app

### v5.52 — Premium Polish
- Card padding and typography refinements
- Divider spacing adjustments
- Closing blessing font and color finalization

### v5.53 — HomeButton Iteration
- HomeButton redesign attempt (button style)
- Reverted to original transparent text spec

### v5.54 — Room Results Polish
- Energy Flow description → bold gold
- Feng Shui tips → bold dark green
- "Saved to Harmony Journal" → always visible, bold green
- Button sizing and padding adjustments
- "View Harmony Journal" → 16px bold

### v5.55 — App Icon (First Artwork)
- Koi pond with lotus app icon
- Multiple size iterations for iOS/Android/Web
- Warm bronze corner fill treatment

---

## v5.56 Series — Settings Redesign

### v5.56 — Settings Year Picker
- Birth Year picker overhaul with tappable years
- Magnifier effect on year wheel
- Custom Done button (outlined, see-through)
- 420px sheet height with balanced spacing

### v5.57 — Settings Switches & Buttons
- Custom switch widget (no shadows/outlines)
  - Green = ON, Red = OFF
  - Smooth 200ms animation
- "Reset All Data" button with RichText sizing
- About section tagline alignment fix
- New app icon artwork (second version, clean corners)

### v5.57.5 — Profile Card Centered
- Profile card centered in Settings screen
- Zodiac circle enlarged 15% (100px → 115px)

### v5.57.6 — Tagline Centered
- "Feng Shui Your Life" and "Glow Starts at Home" centered
- Red "Tagline" label removed entirely
- Both lines in bold green

### v5.57.7 — Bold Tagline
- "Glow Starts at Home" made bold w700 (matching first line)

### v5.57.8 — Dialog Buttons Bigger
- Cancel/Save/Reset/Delete buttons → 16px (2pt bigger)
- "Enter your name" hint darkened to richer gold (#8C6A1C)
- Applied to all 3 dialogs (Edit Profile, Reset, Journal Delete)

---

## v5.58 Series — Zodiac Energy & Visual Polish

### v5.58.0 — Zodiac Images Square
- 12 zodiac animal images center-cropped to square (1024×1024)
- Removed excess background from portrait originals

### v5.58.0b — Animal Heads Visible
- Images recropped from top to keep heads in frame
- Heads no longer cut off in the circular profile view

### v5.58.1 — Energy Text Colors
- Today's Energy description → **gold bold**
- Color of the Day description → **green bold**
- Lucky Direction description → **green bold**
- Today's Wisdom → **gold bold**
- Animal images shifted 15% down in circle with `Alignment(0, 0.15)`

### v5.58.2 — Lucky Direction Alignment
- Lucky Direction text moved up 16px to match Color of Day level
- Bottom spacing added to match card heights

### v5.58.2b — Card Height Match
- Lucky Direction card height adjusted to match Color of Day card

### v5.58.3 — Bold Red Practice Text
- "Practice patience, kindness..." → **bold rich red**

### v5.58.4 — Season Cards Green
- Spring/Summer/Autumn/Winter forecast text → **bold green**
- Element descriptions (Wood, Fire, Metal, Water) → **bold green**
- "Color of the Day" and "Lucky Direction" subheaders → **bold red**

---

## v5.60 Series — Upcoming

### v5.60 — Splash Screen Redesign 🎨
*Planned — animated koi pond with lotus, morning sun, golden light*

### v5.61 — RevenueCat / IAP Integration
*Planned — real subscription payments*

### v5.62 — Room Scan AI Analysis
*Planned — real element detection from photos*

---

> *"Illuminate Your Chi. Glow Every Day."*