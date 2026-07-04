import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

/// ChiGlow header with artwork, decorative flourish, tagline, and divider.
class GlobalHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const GlobalHeader({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
        // Artwork with page title overlaid
        SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/chi_header.png',
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              // Page title overlaid on the artwork
              Positioned(
                bottom: 32,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
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
                      if (subtitle != null) ...[
                        const SizedBox(height: 6),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Lotus flourish
        Image.asset(
          'assets/images/lotus_flourish.png',
          width: 80,
          height: 24,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 8),
        // Flow. Grow. Bloom.
        Text(
          'Flow. Grow. Bloom.',
          style: GoogleFonts.playfairDisplay(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: ChiGlowTheme.bronzeGold,
            letterSpacing: 2.5,
          ),
        ),
        const SizedBox(height: 4),
        // Gold divider line
        Image.asset(
          'assets/images/gold_divider.png',
          width: 120,
          height: 4,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}