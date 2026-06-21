/// ChiGlow - Feng Shui Wellness App Theme
/// Bold red & gold koi pond energy — exciting, premium, attention-grabbing.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChiGlowTheme {
  // Core palette — bold red & gold koi energy
  static const Color luckyRed = Color(0xFFD32F2F);
  static const Color brightRed = Color(0xFFE53935);
  static const Color warmGold = Color(0xFFFFD700);
  static const Color darkGold = Color(0xFFD4A017);
  static const Color creamWhite = Color(0xFFFFF8E7);
  static const Color ivoryBg = Color(0xFFFDF5E6);
  static const Color deepRed = Color(0xFFB71C1C);
  static const Color softCoral = Color(0xFFFF8A80);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: ivoryBg,
      colorScheme: ColorScheme.light(
        primary: luckyRed,
        secondary: warmGold,
        tertiary: deepRed,
        surface: ivoryBg,
        onPrimary: Colors.white,
        onSecondary: deepRed,
        onSurface: const Color(0xFF3E2723),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          color: luckyRed,
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: luckyRed,
        ),
        headlineLarge: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: deepRed,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: deepRed,
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: luckyRed,
        ),
        titleMedium: GoogleFonts.quicksand(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: luckyRed,
        ),
        bodyLarge: GoogleFonts.quicksand(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF4E342E),
        ),
        bodyMedium: GoogleFonts.quicksand(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF6D4C41),
        ),
        labelLarge: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: luckyRed,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 4,
          shadowColor: luckyRed.withValues(alpha: 0.4),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: luckyRed,
          side: const BorderSide(color: luckyRed, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white.withValues(alpha: 0.95),
        elevation: 2,
        shadowColor: luckyRed.withValues(alpha: 0.15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: luckyRed,
        unselectedItemColor: Color(0xFFBDBDBD),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}

/// Glow effect decoration — now with lucky red & gold glow
BoxDecoration glowDecoration({
  Color color = ChiGlowTheme.luckyRed,
  double blurRadius = 12,
}) {
  return BoxDecoration(
    color: ChiGlowTheme.creamWhite,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: color.withValues(alpha: 0.15),
        blurRadius: blurRadius,
        spreadRadius: 1,
        offset: const Offset(0, 4),
      ),
      BoxShadow(
        color: ChiGlowTheme.warmGold.withValues(alpha: 0.08),
        blurRadius: 24,
        spreadRadius: 2,
        offset: const Offset(0, 0),
      ),
    ],
  );
}
