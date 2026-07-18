import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _lotusPulseController;
  late AnimationController _koi1Controller;
  late AnimationController _koi2Controller;
  late AnimationController _shimmerController;
  late Animation<double> _artworkFade;
  late Animation<double> _textFade;

  final List<_ChiLight> _chiLights = [];
  final List<_CherryBlossom> _blossoms = [];
  final Random _random = Random();
  bool _navigated = false;

  @override
  void initState() {
    super.initState();

    // Generate Chi lights
    for (int i = 0; i < 8; i++) {
      _chiLights.add(_ChiLight(
        startX: 0.3 + _random.nextDouble() * 0.4,
        startY: 0.55 + _random.nextDouble() * 0.15,
        delay: 0.3 + _random.nextDouble() * 1.2,
        speed: 0.4 + _random.nextDouble() * 0.6,
        size: 2.0 + _random.nextDouble() * 3.0,
      ));
    }

    // Generate cherry blossoms
    for (int i = 0; i < 6; i++) {
      _blossoms.add(_CherryBlossom(
        startX: _random.nextDouble(),
        startY: -0.1 - _random.nextDouble() * 0.3,
        delay: 0.5 + _random.nextDouble() * 1.5,
        speed: 3.0 + _random.nextDouble() * 2.0,
        drift: -0.15 + _random.nextDouble() * 0.3,
        size: 6.0 + _random.nextDouble() * 4.0,
      ));
    }

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _lotusPulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat(reverse: true);

    _koi1Controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);

    _koi2Controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);

    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..repeat(reverse: true);

    _artworkFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _textFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.7, curve: Curves.easeIn),
      ),
    );

    _controller.forward();
    Future.delayed(const Duration(milliseconds: 2400), _navigateToHome);
  }

  void _navigateToHome() {
    if (!mounted || _navigated) return;
    _navigated = true;
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void dispose() {
    _controller.dispose();
    _lotusPulseController.dispose();
    _koi1Controller.dispose();
    _koi2Controller.dispose();
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF1A0A0A),
        child: Stack(
          children: [
            // Splash artwork
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _artworkFade.value,
                  child: child,
                );
              },
              child: Image.asset(
                'assets/images/splash_artwork.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // Water shimmer overlay
            AnimatedBuilder(
              animation: _shimmerController,
              builder: (context, _) {
                return Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: size.height * 0.35,
                  child: IgnorePointer(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.white.withValues(alpha: 0.02 + _shimmerController.value * 0.04),
                            Colors.white.withValues(alpha: 0.03 + _shimmerController.value * 0.03),
                            Colors.transparent,
                          ],
                          stops: const [0.0, 0.3, 0.7, 1.0],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            // Lotus pulse glow
            AnimatedBuilder(
              animation: _lotusPulseController,
              builder: (context, _) {
                final pulse = 0.92 + _lotusPulseController.value * 0.16;
                return Positioned(
                  left: 0,
                  right: 0,
                  top: size.height * 0.32,
                  child: IgnorePointer(
                    child: Center(
                      child: Transform.scale(
                        scale: pulse,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.08 + _lotusPulseController.value * 0.12),
                                blurRadius: 40 + _lotusPulseController.value * 40,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            // Koi 1 — slow gliding left to right
            AnimatedBuilder(
              animation: _koi1Controller,
              builder: (context, _) {
                final x = size.width * 0.15 + _koi1Controller.value * size.width * 0.7;
                final y = size.height * 0.58 + sin(_koi1Controller.value * pi * 2) * 6;
                return Positioned(
                  left: x,
                  top: y,
                  child: IgnorePointer(
                    child: Transform.flip(
                      flipX: _koi1Controller.value > 0.5,
                      child: Opacity(
                        opacity: 0.25,
                        child: Text('🐟', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ),
                );
              },
            ),

            // Koi 2 — slow gliding right to left
            AnimatedBuilder(
              animation: _koi2Controller,
              builder: (context, _) {
                final x = size.width * 0.75 - _koi2Controller.value * size.width * 0.6;
                final y = size.height * 0.62 + sin(_koi2Controller.value * pi * 2 + 1) * 5;
                return Positioned(
                  left: x,
                  top: y,
                  child: IgnorePointer(
                    child: Transform.flip(
                      flipX: _koi2Controller.value < 0.5,
                      child: Opacity(
                        opacity: 0.2,
                        child: Text('🐟', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ),
                );
              },
            ),

            // Golden Chi lights rising from lotus
            ..._chiLights.map((light) => _ChiLightWidget(
                  light: light,
                  controller: _controller,
                  size: size,
                )),

            // Cherry blossoms drifting
            ..._blossoms.map((blossom) => _CherryBlossomWidget(
                  blossom: blossom,
                  controller: _controller,
                  size: size,
                )),

            // Dark gradient overlay at bottom
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 280,
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        const Color(0xFF1A0A0A).withValues(alpha: 0.6),
                        const Color(0xFF1A0A0A),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Title & tagline
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _textFade.value,
                  child: child,
                );
              },
              child: Positioned(
                left: 0,
                right: 0,
                bottom: 100,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'ChiGlow',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.7),
                            blurRadius: 30,
                          ),
                          Shadow(
                            color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.3),
                            blurRadius: 60,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Feng Shui your life.\nGlow from your space out.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        color: Colors.white.withValues(alpha: 0.9),
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Chi Light particle ──
class _ChiLight {
  final double startX;
  final double startY;
  final double delay;
  final double speed;
  final double size;
  const _ChiLight({
    required this.startX,
    required this.startY,
    required this.delay,
    required this.speed,
    required this.size,
  });
}

class _ChiLightWidget extends StatelessWidget {
  final _ChiLight light;
  final AnimationController controller;
  final Size size;

  const _ChiLightWidget({
    required this.light,
    required this.controller,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final elapsed = controller.value * 2500 / 1000;
        final localTime = (elapsed - light.delay).clamp(0.0, light.speed);
        final progress = localTime / light.speed;
        if (progress <= 0 || progress >= 1) return const SizedBox.shrink();
        final opacity = sin(progress * pi);
        final x = size.width * light.startX + sin(progress * pi * 2) * 6;
        final y = size.height * light.startY - progress * size.height * 0.45;
        return Positioned(
          left: x,
          top: y,
          child: IgnorePointer(
            child: Opacity(
              opacity: opacity * 0.6,
              child: Container(
                width: light.size,
                height: light.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ChiGlowTheme.bronzeGold,
                  boxShadow: [
                    BoxShadow(
                      color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.6),
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// ── Cherry blossom petal ──
class _CherryBlossom {
  final double startX;
  final double startY;
  final double delay;
  final double speed;
  final double drift;
  final double size;
  const _CherryBlossom({
    required this.startX,
    required this.startY,
    required this.delay,
    required this.speed,
    required this.drift,
    required this.size,
  });
}

class _CherryBlossomWidget extends StatelessWidget {
  final _CherryBlossom blossom;
  final AnimationController controller;
  final Size size;

  const _CherryBlossomWidget({
    required this.blossom,
    required this.controller,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final elapsed = controller.value * 2500 / 1000;
        final localTime = (elapsed - blossom.delay).clamp(0.0, blossom.speed);
        final progress = localTime / blossom.speed;
        if (progress <= 0 || progress >= 1) return const SizedBox.shrink();
        final opacity = sin(progress * pi);
        final x = size.width * (blossom.startX + blossom.drift * progress);
        final y = blossom.startY * size.height + progress * size.height * 1.3;
        final rotation = progress * pi * 2;
        return Positioned(
          left: x,
          top: y,
          child: IgnorePointer(
            child: Opacity(
              opacity: opacity * 0.5,
              child: Transform.rotate(
                angle: rotation,
                child: Text(
                  '🌸',
                  style: TextStyle(fontSize: blossom.size),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}