import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../utils/asset_images.dart';

/// Global Page Header v4.1 — Official Design System
///
/// Layer order (back to front):
///   1. Soft cream background
///   2. Gentle center glow (RadialGradient)
///   3. Golden sparkle particles (6-8 tiny floating dots)
///   4. Lotus artwork (left, large, floating)
///   5. Koi artwork (right, large, floating)
///   6. "CHIGLOW APP" brand
///   7. Page Title
///   8. Lotus Flourish
///   9. "Flow. Grow. Bloom." tagline
///   10. Optional Subtitle
class GlobalHeader extends StatefulWidget {
  final String title;
  final String? subtitle;
  final bool showTagline;
  final bool showDecorations;

  const GlobalHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.showTagline = true,
    this.showDecorations = true,
  });

  @override
  State<GlobalHeader> createState() => _GlobalHeaderState();
}

class _GlobalHeaderState extends State<GlobalHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _particleController;
  final List<_Sparkle> _sparkles = [];
  final math.Random _rng = math.Random(42);

  @override
  void initState() {
    super.initState();
    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    // Create 6-8 golden sparkle particles with random positions
    for (int i = 0; i < 7; i++) {
      _sparkles.add(_Sparkle(
        x: _rng.nextDouble(),
        y: _rng.nextDouble(),
        size: 1.5 + _rng.nextDouble() * 2.5,
        phaseX: _rng.nextDouble() * math.pi * 2,
        phaseY: _rng.nextDouble() * math.pi * 2,
        speed: 0.3 + _rng.nextDouble() * 0.5,
        opacity: 0.15 + _rng.nextDouble() * 0.25,
      ));
    }
  }

  @override
  void dispose() {
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 0.8,
          colors: [
            ChiGlowTheme.bronzeGold.withValues(alpha: 0.06),
            Colors.transparent,
          ],
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Layer 3: Golden sparkle particles
          AnimatedBuilder(
            animation: _particleController,
            builder: (context, child) {
              final t = _particleController.value;
              return ClipRect(
                child: SizedBox(
                  width: double.infinity,
                  height: 220,
                  child: Stack(
                    children: _sparkles.map((sparkle) {
                      // Sine-wave drift
                      final dx = math.sin(t * math.pi * 2 * sparkle.speed + sparkle.phaseX) * 15;
                      final dy = math.cos(t * math.pi * 2 * sparkle.speed * 0.7 + sparkle.phaseY) * 10;
                      return Positioned(
                        left: sparkle.x * 80 + 10 + dx,
                        top: sparkle.y * 180 + 10 + dy,
                        child: Container(
                          width: sparkle.size,
                          height: sparkle.size,
                          decoration: BoxDecoration(
                            color: ChiGlowTheme.bronzeGold.withValues(alpha: sparkle.opacity),
                            shape: BoxShape.circle,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),

          // Layer 4: Large floating lotus — left side
          if (widget.showDecorations)
            Positioned(
              left: -40,
              top: -20,
              child: Opacity(
                opacity: 0.6,
                child: Image.asset(
                  AssetImages.headerLotus,
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
            ),

          // Layer 5: Large floating koi — right side
          if (widget.showDecorations)
            Positioned(
              right: -40,
              top: -10,
              child: Opacity(
                opacity: 0.55,
                child: Image.asset(
                  AssetImages.headerKoi,
                  width: 180,
                  height: 180,
                  fit: BoxFit.contain,
                ),
              ),
            ),

          // Layers 6-10: Center content column
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12),
                  // Layer 6: Brand name — "CHIGLOW APP"
                  Text(
                    'CHIGLOW APP',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF6B6B6B),
                      letterSpacing: 3.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Layer 7: Page Title
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ChiGlowTheme.richRed,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 14),
                  // Layer 8: Lotus flourish divider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 1,
                        color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.25),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: SizedBox(
                          width: 14,
                          height: 14,
                          child: Image.asset(
                            AssetImages.lotusGold,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 1,
                        color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.25),
                      ),
                    ],
                  ),
                  // Layer 9: Tagline
                  if (widget.showTagline) ...[
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 1,
                          color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.2),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Flow. Grow. Bloom.',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 13,
                            fontStyle: FontStyle.italic,
                            color: ChiGlowTheme.bronzeGold,
                            letterSpacing: 2.0,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 30,
                          height: 1,
                          color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.2),
                        ),
                      ],
                    ),
                  ],
                  // Layer 10: Subtitle
                  if (widget.subtitle != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      widget.subtitle!,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                        fontSize: 13,
                        color: ChiGlowTheme.mediumGray,
                        height: 1.4,
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A single golden sparkle particle with drift parameters
class _Sparkle {
  final double x;
  final double y;
  final double size;
  final double phaseX;
  final double phaseY;
  final double speed;
  final double opacity;

  const _Sparkle({
    required this.x,
    required this.y,
    required this.size,
    required this.phaseX,
    required this.phaseY,
    required this.speed,
    required this.opacity,
  });
}