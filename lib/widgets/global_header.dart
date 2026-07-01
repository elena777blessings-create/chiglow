import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../utils/asset_images.dart';

/// Global Page Header v4.0 — every major page uses this template
///
/// Layout:
///   CHIGLOW APP  (elegant serif, uppercase, wide spacing, warm dark gray)
///   Large lotus artwork (left, floating)  +  [TITLE]  +  Large koi artwork (right, floating)
///           ❀ flourish ❀             (centered lotus flourish)
///       Flow. Grow. Bloom.            (tagline with gold dividers)
///
/// Uses a Stack to float the artwork naturally behind the center content.
/// Lotus and koi display at 160-200px with soft opacity for a premium, artistic feel.
class GlobalHeader extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Large floating lotus — left side
          if (showDecorations)
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

          // Large floating koi — right side
          if (showDecorations)
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

          // Center content column
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12),
                  // Brand name — "CHIGLOW APP"
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
                  // Title
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ChiGlowTheme.richRed,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 14),
                  // Lotus flourish divider
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
                  // Tagline
                  if (showTagline) ...[
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
                  // Subtitle
                  if (subtitle != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      subtitle!,
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