import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

/// ChiGlow full-width hero header — edge-to-edge artwork, responsive scaling.
/// Designed for the home screen. Page title overlay is optional.
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
      children: [
        // Full-width hero artwork — no margins, no rounded corners
        SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/chi_header.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              // Optional page title overlaid on the artwork
              if (title.isNotEmpty)
                Positioned(
                  bottom: 32,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: MediaQuery.of(context).size.width < 600 ? 17 : 24,
                        fontWeight: FontWeight.w700,
                        color: ChiGlowTheme.richRed,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
              if (subtitle != null && title.isNotEmpty)
                Positioned(
                  bottom: 8,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      subtitle!,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                        fontSize: 13,
                        color: ChiGlowTheme.mediumGray,
                        height: 1.4,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
