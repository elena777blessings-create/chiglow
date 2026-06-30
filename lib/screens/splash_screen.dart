import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../utils/asset_images.dart';

/// Animated splash screen — simplified for web reliability
/// Uses only FadeTransition and ScaleTransition
/// Sequence: warm gradient → koi & lotus fade in → ChiGlow logo → home
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _artworkFade;
  late Animation<double> _lotusScale;
  late Animation<double> _logoFade;
  late Animation<double> _taglineFade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3200),
    );

    // Koi/artwork fades in first (0%–40%)
    _artworkFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
      ),
    );

    // Lotus scales up (20%–55%)
    _lotusScale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.55, curve: Curves.easeOutBack),
      ),
    );

    // Logo fades in (45%–80%)
    _logoFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.45, 0.8, curve: Curves.easeIn),
      ),
    );

    // Tagline + spinner (60%–100%)
    _taglineFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller.forward();
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [
              const Color(0xFF3D1C1C),
              const Color(0xFF5C2A1E),
              const Color(0xFF2A1010),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Warm light glow
            Positioned(
              top: MediaQuery.of(context).size.height * 0.12,
              left: 0,
              right: 0,
              child: IgnorePointer(
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.center,
                      radius: 0.8,
                      colors: [
                        ChiGlowTheme.bronzeGold.withValues(alpha: 0.15),
                        ChiGlowTheme.bronzeGold.withValues(alpha: 0.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Center content — koi, lotus, logo
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Koi fish + lotus area
                  FadeTransition(
                    opacity: _artworkFade,
                    child: Column(
                      children: [
                        // Koi fish image
                        SizedBox(
                          width: 100,
                          height: 60,
                          child: Image.asset(
                            AssetImages.koiImage('white'),
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Lotus blooms
                        ScaleTransition(
                          scale: _lotusScale,
                          child: SizedBox(
                            width: 48,
                            height: 48,
                            child: Image.asset(
                              AssetImages.lotusGold,
                              fit: BoxFit.contain,
                              color: ChiGlowTheme.bronzeGold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // ChiGlow logo
                  FadeTransition(
                    opacity: _logoFade,
                    child: Column(
                      children: [
                        // Decorative line above
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(width: 40, height: 1, color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.3)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                width: 6, height: 6,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.4),
                                ),
                              ),
                            ),
                            Container(width: 40, height: 1, color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.3)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'ChiGlow',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.6),
                                blurRadius: 20,
                              ),
                              Shadow(
                                color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.3),
                                blurRadius: 40,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Tagline + spinner
                  FadeTransition(
                    opacity: _taglineFade,
                    child: Column(
                      children: [
                        Text(
                          'Illuminate Your Chi. Glow Every Day.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            color: Colors.white.withValues(alpha: 0.85),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 28),
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              ChiGlowTheme.bronzeGold.withValues(alpha: 0.6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}