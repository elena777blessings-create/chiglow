# ChiGlow Energy Engine — Architecture Guide

## Overview

The Energy Engine is the single source of truth for all Feng Shui calculations in ChiGlow. It unifies Chinese Zodiac, Five Elements, Bagua, and current year energy into one connected system.

## Architecture Diagram

```
┌─────────────────────────────────────────────────────────┐
│                     INPUTS                              │
│                                                         │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │ Chinese      │  │ Current Year │  │ Room Scan    │  │
│  │ Zodiac       │  │ Energy       │  │ Data (future)│  │
│  │ (birth year) │  │ (Heavenly    │  │              │  │
│  │              │  │  Stem)       │  │              │  │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘  │
│         │                 │                 │          │
└─────────┼─────────────────┼─────────────────┼──────────┘
          │                 │                 │
          ▼                 ▼                 ▼
┌─────────────────────────────────────────────────────────┐
│                   CORE ENGINE                           │
│                                                         │
│  ┌─────────────────────────────────────────────────┐    │
│  │           EnergyEngine                          │    │
│  │  (lib/services/energy_engine.dart)              │    │
│  │                                                 │    │
│  │  • calculateElementBalance()                    │    │
│  │  • calculateBaguaScores()                       │    │
│  │  • calculateFullProfile()                       │    │
│  │  • blendRoomScan()                              │    │
│  └──────────────────────┬──────────────────────────┘    │
│                         │                                │
│  ┌──────────────────────▼──────────────────────────┐    │
│  │           EnergyConfig                          │    │
│  │  (lib/config/energy_config.dart)                │    │
│  │                                                 │    │
│  │  • Element definitions                          │    │
│  │  • Bagua scoring rules                          │    │
│  │  • Element cycle relationships                  │    │
│  │  • Zodiac → element mapping                     │    │
│  │  • Year energy mapping                          │    │
│  │  • Room scan blend parameters                   │    │
│  └─────────────────────────────────────────────────┘    │
│                                                         │
└─────────────────────────────────────────────────────────┘
          │                 │                 │
          ▼                 ▼                 ▼
┌─────────────────────────────────────────────────────────┐
│                     OUTPUTS                             │
│                                                         │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │ Your Overall │  │ Energy       │  │ Future:      │  │
│  │ Balance      │  │ Dashboard    │  │ Lucky Dir.   │  │
│  │ (5 Elements) │  │ (Love,       │  │ Recommends.  │  │
│  │              │  │  Wealth,     │  │ History      │  │
│  │              │  │  Health,     │  │ Comparisons  │  │
│  │              │  │  Career)     │  │              │  │
│  └──────────────┘  └──────────────┘  └──────────────┘  │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

## File Structure

```
lib/
├── config/
│   └── energy_config.dart        ← Business rules (edit these to change weights)
│
├── services/
│   └── energy_engine.dart        ← Calculation logic (don't edit for rule changes)
│
├── providers/
│   └── app_state_provider.dart   ← State management, calls engine on init & zodiac change
│
└── screens/
    ├── home_screen.dart           ← Reads livedata from provider
    ├── energy_dashboard_screen.dart ← Reads scores from provider
    └── year_ahead_screen.dart    ← Reads element scores from provider
```

## Data Flow

### Initialization
```
AppStateProvider()
  └─ _recalculateAll()
       └─ EnergyEngine.calculateFullProfile(zodiacSign, birthYear)
            ├─ calculateElementBalance() → {Wood, Fire, Earth, Metal, Water}
            └─ calculateBaguaScores()    → {Love, Wealth, Health, Career}
```

### User Changes Zodiac
```
Settings → provider.setZodiacSign("Tiger")
  └─ _recalculateAll()
       └─ (same as initialization)
```

### Future: Room Scan
```
Room Scan Complete
  └─ Analyze room's element composition → {Wood: 0.8, Fire: 0.3, ...}
  └─ EnergyEngine.blendRoomScan(currentElements, scanData, scanCount)
       └─ Updated element scores
       └─ EnergyEngine.calculateBaguaScores(updatedElements)
            └─ Updated dashboard scores
```

## How Bagua Scores Are Calculated

Each life area score is a weighted blend of elements:

| Area | Formula | File to Edit |
|------|---------|-------------|
| ❤️ Love | Earth × 50% + Fire × 25% + Metal × 25% | `energy_config.dart` → `baguaRules['Love']` |
| 💰 Wealth | Wood × 50% + Water × 25% + Fire × 25% | `energy_config.dart` → `baguaRules['Wealth']` |
| 💚 Health | Earth × 40% + OverallAvg × 60% | `energy_config.dart` → `baguaRules['Health']` |
| 💼 Career | Water × 50% + Metal × 25% + Wood × 25% | `energy_config.dart` → `baguaRules['Career']` |

To adjust weights, modify `EnergyConfig.baguaRules` — the engine reads it automatically.

## How Element Balance Is Calculated

Each element starts at 50 and is adjusted based on:

1. **Zodiac relationship** (is this the primary element? parent? child? controller? controlled?)
2. **Year energy** (does the year's element match, nurture, or feed this element?)

Adjust the scoring values in `EnergyConfig.elementBalanceScoring` and `EnergyConfig.yearEnergyScoring`.

## Adding a New Life Area

1. Add a new rule to `EnergyConfig.baguaRules`
2. The engine's `calculateBaguaScores()` processes all rules dynamically — no engine changes needed
3. Add a getter in `AppStateProvider` if needed
4. Create the UI screen that reads from the provider

## Adding Room Scan Analysis

The `blendRoomScan()` function is ready to use. When room scan analysis is implemented:

1. Analyze the room's photo to detect elemental composition (colors, materials, etc.)
2. Call `EnergyEngine.blendRoomScan(currentElements, scanData, scanCount)`
3. Call `EnergyEngine.calculateBaguaScores(updatedElements)` to refresh the dashboard
4. Update the provider with the new scores

## Guiding Principles

1. **Config holds rules, engine holds logic** — changing a weight never requires changing the engine
2. **Pure functions** — no side effects, no state in the engine
3. **Provider is the bridge** — screens read from provider, never call the engine directly
4. **Room scans are additive** — they blend into existing scores, never replace them
5. **All outputs are clamped 10–95** — no 0% or 100% extremes