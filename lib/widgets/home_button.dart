import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

/// A transparent "Home" return button that navigates to the home screen.
/// Placed at the bottom of every page except the home page itself.
class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 24),
      child: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
          child: Text(
            'Home',
            style: GoogleFonts.quicksand(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: ChiGlowTheme.richRed,
            ),
          ),
        ),
      ),
    );
  }
}