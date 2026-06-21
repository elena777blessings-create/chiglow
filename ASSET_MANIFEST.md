# ChiGlow Visual Assets & Content Library

## Project Location
All assets are in `/home/team/shared/chiglow/`

## Content Library (lib/data/)
| File | Description |
|------|-------------|
| `zodiac_profiles.json` | All 12 Chinese zodiac signs with personality, element, lucky colors, compatibility |
| `feng_shui_recommendations.json` | Room-by-room Feng Shui for 6 room types with Bagua guidance |
| `daily_affirmations.json` | 40 affirmations across 7 categories (morning/midday/evening/wealth/love/health/career) |
| `color_psychology.json` | Color meanings by 5 Feng Shui elements + 6 goal-based recommendations |
| `seasonal_adjustments.json` | All 4 seasons with energy themes, 10 tips each, Bagua focus, rituals |

## Visual Assets (assets/images/ & assets/icons/)
| Asset | File | Description |
|-------|------|-------------|
| App Icon | `icons/app_icon.png` | Bold red koi with white fins on cream, gold halo |
| Splash | `images/splash_artwork.png` | Red/gold koi pond with lotus, auspicious scene |
| BG Pattern | `images/bg_pattern_red_gold.png` | Subtle red/gold diamond lattice watermark |
| BG Pattern | `images/bg_pattern_lotus.png` | Delicate lotus repeating watermark |
| Energy | `images/energy_aura_rings.png` | Glowing red/gold/pink concentric rings |
| Energy | `images/energy_bars_dashboard.png` | 4 bars: Love red (75%), Wealth gold (60%), Health coral (85%), Career orange (45%) |
| Bagua | `images/bagua_map.png` | Octagonal Bagua map in red/gold palette |
| Compass | `images/feng_shui_compass.png` | Luo pan compass in red/gold |
| Color Swatches | `images/color_palette_swatches.png` | 12 signature ChiGlow colors |
| Decorative | `images/divider_lotus.png` | Horizontal section divider with lotus |
| Decorative | `images/deco_koi_pair.png` | Red and gold koi in yin-yang circle |
| Decorative | `images/deco_lotus_glow.png` | Glowing lotus in red/gold gradient |
| Decorative | `images/deco_water_flow.png` | Flowing waves in red/gold/cream |
| Zodiac | `images/zodiac_rat_dragon_monkey.png` | Rat, Dragon, Monkey on red/gold |
| Zodiac | `images/zodiac_ox_tiger_rabbit.png` | Ox, Tiger, Rabbit on red/gold |
| Zodiac | `images/zodiac_snake_horse_sheep.png` | Snake, Horse, Sheep on red/gold |
| Zodiac | `images/zodiac_rooster_dog_pig.png` | Rooster, Dog, Pig on red/gold |

## Color Palette (New Direction — Owner Approved)
- **Primary:** ChiGlow Red #DC143C (cheerful, lucky red)
- **Accent:** Warm Gold #FFD700 (abundance, prosperity)
- **Background:** Cream White #FFFDD0
- **Secondary:** Crimson #8B0000, Coral #FF7F50, Peach #FFDAB9, Terracotta #E2725B
- **Supporting:** Pond Blue #4A90D9, Emerald #50C878, Deep Navy #000080, Lavender #E6E6FA

## Fonts
- Playfair Display (headings, titles)
- Poppins (UI text, labels, buttons)
- Quicksand (affirmations, quotes)

## pubspec.yaml Note
The pubspec.yaml at `assets/` currently lists only `assets/images/`. Add `assets/icons/` and `lib/data/`:

```yaml
assets:
  - assets/images/
  - assets/icons/
  - lib/data/
```