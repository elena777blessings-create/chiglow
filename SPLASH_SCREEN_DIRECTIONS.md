# 🪷 ChiGlow Splash Screen — Production Direction

> **Artwork:** `https://drive.google.com/file/d/1_xIZ6mWYBakBWbYR71Xw_lbl1HhW8fjf/view`
> **Google Drive ID:** `1_xIZ6mWYBakBWbYR71Xw_lbl1HhW8fjf`
> **Status:** ⏳ Shell was down — artwork not yet downloaded

---

## Core Directive

This artwork is the **final approved design** and should serve as the production reference.
**Do not redesign, simplify, substitute, reposition, crop, or reinterpret** any of the artwork.
Preserve the composition, colors, typography, spacing, lighting, atmosphere, and overall visual balance **exactly as shown**.

The goal is for the production splash screen to look **virtually identical** to the approved artwork while using production-quality assets optimized for mobile devices.

---

## Ambient Animation

### Opening Sequence
1. Pond starts **completely calm and still**
2. After ~0.5 seconds, scene gently awakens
3. A single tiny **golden Chi light** rises from the center of the lotus
4. Another appears a moment later
5. A few more slowly drift upward — like positive energy naturally flowing through the garden
6. Effect should feel **organic, peaceful, calming** — not magical or flashy

### Background Motion (while visible)
- ✨ Soft floating golden Chi lights rising slowly from the water
- 💧 Gentle shimmering reflections across the pond
- 🌟 Tiny sparkle twinkles on water surface and lily pads
- 🐟 Very slow, graceful movement of both koi (almost imperceptible — gliding beneath surface)
- 🪷 Soft warm pulse from the center of the lotus every few seconds
- 🌸 Occasional cherry blossom petals drifting gently across the screen
- 🌊 Very subtle water movement — living, tranquil quality

### Transition
- After ~2–2.5 seconds, smoothly dissolve into the Home screen
- **No** abrupt transitions, loading indicators, spinning logos, or distracting effects
- Experience should feel **effortless and serene**

---

## Emotional Goal

> This is the user's first experience inside ChiGlow.
> It should feel less like opening an app and more like **quietly stepping into a peaceful Japanese garden at sunrise.**

Users should immediately experience:
- 🧘 Calm
- 🌞 Warmth
- ⚖️ Balance
- 💎 Luxury
- 🌸 Serenity
- 🌅 Gentle optimism

Every animation should reinforce the ChiGlow philosophy:
> **Flow. Grow. Bloom.**

The splash screen should **never feel busy** or animated for its own sake. Every movement should have intention and contribute to a sense of harmony and living energy.

---

## Implementation Notes (for developer)

### Files to modify
- `lib/screens/splash_screen.dart` — main splash screen widget
- `assets/images/splash_artwork.png` — replace with downloaded artwork

### Animation approach
- Use Flutter's `AnimationController` with `TickerProviderStateMixin`
- Golden Chi lights: `AnimatedPositioned` or `Transform.translate` with random delays
- Koi movement: `AnimationController` looping with slow `Curves.easeInOut`
- Lotus pulse: scale animation on a `Container` with glow
- Cherry blossoms: `Transform.translate` + slight rotation, random positions
- Water shimmer: gradient animation or `ShaderMask`
- Transition: `FadeTransition` with 600ms+ duration

### Download artwork
```bash
wget -q -O assets/images/splash_artwork.png "https://drive.google.com/uc?export=download&id=1_xIZ6mWYBakBWbYR71Xw_lbl1HhW8fjf"
```