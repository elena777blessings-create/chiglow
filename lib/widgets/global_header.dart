import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../utils/asset_images.dart';

/// Global Page Header v2.0 — every major page uses this template
///
/// Layout:
///   CHIGLOW APP  (elegant serif, uppercase, wide spacing, warm dark gray)
///   🪷         [TITLE]         🐟    (lotus left, koi right)
///           ❀ flourish ❀             (centered lotus flourish)
///       Flow. Grow. Bloom.            (tagline with gold dividers)
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
        const SizedBox(height: 20),
        // Decorative row: Lotus + Title + Koi
        if (showDecorations)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Lotus image left
                SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset(
                    AssetImages.headerLotus,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 12),
                // Title
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ChiGlowTheme.richRed,
                      height: 1.2,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Koi image right
                SizedBox(
                  width: 32,
                  height: 24,
                  child: Image.asset(
                    AssetImages.headerKoi,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          )
        else
          // Title alone if no decorations
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: ChiGlowTheme.richRed,
                height: 1.2,
              ),
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
                child: Image.asset(AssetImages.lotusGold, fit: BoxFit.contain),
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
    );
  }
}