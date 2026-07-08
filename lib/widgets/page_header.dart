import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../utils/asset_images.dart';

/// Elegant page header with Playfair Display title and optional decorative flourish
class PageHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showFlourish;
  final double titleSize;
  final double spacing;

  const PageHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.showFlourish = true,
    this.titleSize = 26,
    this.spacing = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
        // Lotus flourish above title
        if (showFlourish)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: SizedBox(
              width: 28,
              height: 28,
              child: Image.asset(AssetImages.lotusGold, fit: BoxFit.contain),
            ),
          ),
        // Title
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.playfairDisplay(
            fontSize: titleSize,
            fontWeight: FontWeight.w700,
            color: ChiGlowTheme.richRed,
            height: 1.2,
          ),
        ),
        // Subtitle
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
              fontSize: 14,
              color: ChiGlowTheme.mediumGray,
              height: 1.4,
            ),
          ),
        ],
        const SizedBox(height: 24),
      ],
    );
  }
}

/// Cream + Gold Border secondary button, no harsh outlines
class SecondaryButton extends StatelessWidget {
  final String emoji;
  final String title;
  final VoidCallback onTap;

  const SecondaryButton({
    super.key,
    required this.emoji,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.95),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.3),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 36)),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: ChiGlowTheme.deepRed,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Soft Gold Glow + thin Gold Border selected state (for toggle/selected buttons)
class GoldSelectedButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const GoldSelectedButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? ChiGlowTheme.bronzeGold.withValues(alpha: 0.08)
              : Colors.white.withValues(alpha: 0.95),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected
                ? ChiGlowTheme.bronzeGold.withValues(alpha: 0.6)
                : ChiGlowTheme.bronzeGold.withValues(alpha: 0.2),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.15),
                    blurRadius: 12,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),
        child: Text(
          label,
          style: GoogleFonts.quicksand(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isSelected ? ChiGlowTheme.bronzeGold : ChiGlowTheme.mediumGray,
          ),
        ),
      ),
    );
  }
}