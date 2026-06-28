/// ChiGlow - Feng Shui Wellness App Theme
/// Design & Experience Guidelines v1.0
/// Rich ChiGlow Red headings, Warm Bronze Gold labels, Charcoal body, Medium Gray supporting.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChiGlowTheme {
  // Core palette — v1.0 Design Guidelines
  static const Color richRed = Color(0xFFB33A35);      // Primary heading color
  static const Color bronzeGold = Color(0xFFA67C2E);    // Labels
  static const Color charcoal = Color(0xFF4A4A4A);      // Body text
  static const Color mediumGray = Color(0xFF707070);     // Supporting text
  static const Color accentGold = Color(0xFFFFD700);     // Icons/badges/decorative only
  static const Color creamWhite = Color(0xFFFFF8E7);    // Backgrounds
  static const Color ivoryBg = Color(0xFFFDF5E6);       // Alternate background
  static const Color deepRed = Color(0xFF8B1A1A);       // Deep variant
  static const Color softRed = Color(0xFFD35A55);       // Lighter variant

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: creamWhite,
      colorScheme: ColorScheme.light(
        primary: richRed,
        secondary: bronzeGold,
        tertiary: deepRed,
        surface: creamWhite,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: charcoal,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          color: richRed,
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: richRed,
        ),
        headlineLarge: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: richRed,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: richRed,
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: richRed,
        ),
        titleMedium: GoogleFonts.quicksand(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: bronzeGold,
        ),
        titleSmall: GoogleFonts.quicksand(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: bronzeGold,
        ),
        bodyLarge: GoogleFonts.quicksand(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: charcoal,
        ),
        bodyMedium: GoogleFonts.quicksand(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: charcoal,
        ),
        bodySmall: GoogleFonts.quicksand(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: mediumGray,
        ),
        labelLarge: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        labelMedium: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: bronzeGold,
        ),
        labelSmall: GoogleFonts.quicksand(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: mediumGray,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: richRed,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 2,
          shadowColor: richRed.withValues(alpha: 0.3),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: richRed,
          side: const BorderSide(color: richRed, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white.withValues(alpha: 0.95),
        elevation: 1,
        shadowColor: richRed.withValues(alpha: 0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: richRed,
        unselectedItemColor: Color(0xFFBDBDBD),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}

/// Glow effect decoration — subtle red glow with bronze tint
BoxDecoration glowDecoration({
  Color color = ChiGlowTheme.richRed,
  double blurRadius = 10,
}) {
  return BoxDecoration(
    color: ChiGlowTheme.creamWhite,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: color.withValues(alpha: 0.1),
        blurRadius: blurRadius,
        spreadRadius: 0,
        offset: const Offset(0, 4),
      ),
      BoxShadow(
        color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.06),
        blurRadius: 20,
        spreadRadius: 1,
        offset: const Offset(0, 0),
      ),
    ],
  );
}