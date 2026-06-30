import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../utils/asset_images.dart';

/// Animated splash screen for web — renders entirely within Flutter
/// Sequence: warm light → gold particles → koi swims → chi flows → lotus blooms → ChiGlow logo → home
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _warmLightAnim;
  late Animation<double> _particlesAnim;
  late Animation<double> _koiAnim;
  late Animation<double> _chiSwirlAnim;
  late Animation<double> _lotusAnim;
  late Animation<double> _logoAnim;

  // Koi swim position
  final List<_GoldParticle> _particles = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    );

    // Phase 1: Warm light (0.0–0.25)
    _warmLightAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.25, curve: Curves.easeIn),
      ),
    );

    // Phase 2: Gold particles (0.15–0.45)
    _particlesAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.15, 0.45, curve: Curves.easeOut),
      ),
    );

    // Phase 3: Koi swims (0.3–0.6)
    _koiAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.6, curve: Curves.easeInOut),
      ),
    );

    // Phase 4: Chi swirl (0.45–0.7)
    _chiSwirlAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.45, 0.7, curve: Curves.easeOutSine),
      ),
    );

    // Phase 5: Lotus blooms (0.55–0.75)
    _lotusAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.55, 0.75, curve: Curves.easeOutBack),
      ),
    );

    // Phase 6: Logo appears (0.65–0.95)
    _logoAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.65, 0.95, curve: Curves.easeIn),
      ),
    );

    // Generate gold particles
    for (int i = 0; i < 20; i++) {
      _particles.add(_GoldParticle(
        index: i,
        x: (i * 37.3 + 12.7) % 100,
        delay: (i * 0.05) % 0.3,
        speed: 0.4 + (i % 6) * 0.12,
        size: 1.5 + (i % 4) * 0.8,
      ));
    }

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
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.2,
                colors: [
                  Color.lerp(
                    const Color(0xFF1A0A0A),
                    const Color(0xFF3D1C1C),
                    _warmLightAnim.value,
                  )!,
                  Color.lerp(
                    const Color(0xFF1A0A0A),
                    const Color(0xFF5C2A1E),
                    _warmLightAnim.value * 0.7,
                  )!,
                  Color.lerp(
                    const Color(0xFF1A0A0A),
                    const Color(0xFF2A1010),
                    _warmLightAnim.value * 0.5,
                  )!,
                ],
              ),
            ),
            child: Stack(
              children: [
                // Warm light glow
                if (_warmLightAnim.value > 0.1)
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.15,
                    left: 0,
                    right: 0,
                    child: Opacity(
                      opacity: (_warmLightAnim.value * 0.4).clamp(0.0, 0.4),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            center: Alignment.center,
                            radius: 0.8,
                            colors: [
                              ChiGlowTheme.bronzeGold.withValues(alpha: 0.3),
                              ChiGlowTheme.bronzeGold.withValues(alpha: 0.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                // Gold particles rising
                ..._particles.map((p) => _buildParticle(p)),

                // Chi swirl ring
                if (_chiSwirlAnim.value > 0.05)
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.2,
                    left: 0,
                    right: 0,
                    child: CustomPaint(
                      size: Size(MediaQuery.of(context).size.width, 200),
                      painter: _ChiSwirlWebPainter(
                        progress: _chiSwirlAnim.value.clamp(0.0, 1.0),
                        color: const Color(0xFF5B9BD5).withValues(alpha: 0.3),
                      ),
                    ),
                  ),

                // Lotus bloom
                if (_lotusAnim.value > 0.05)
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.28,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Transform.scale(
                        scale: _lotusAnim.value.clamp(0.0, 1.0),
                        child: Opacity(
                          opacity: _lotusAnim.value.clamp(0.0, 1.0),
                          child: SizedBox(
                            width: 40 + _lotusAnim.value * 20,
                            height: 40 + _lotusAnim.value * 20,
                            child: Image.asset(
                              AssetImages.lotusGold,
                              fit: BoxFit.contain,
                              color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                // Koi fish swimming across
                if (_koiAnim.value > 0.01)
                  Positioned(
                    left: (-60 + _koiAnim.value * (MediaQuery.of(context).size.width + 120)) - 60,
                    top: MediaQuery.of(context).size.height * 0.18,
                    child: Transform.scale(
                      scale: 0.8,
                      child: Opacity(
                        opacity: _koiAnim.value < 0.1 ? _koiAnim.value * 10 : 
                                 _koiAnim.value > 0.9 ? (1.0 - _koiAnim.value) * 10 : 1.0,
                        child: SizedBox(
                          width: 60,
                          height: 40,
                          child: Image.asset(
                            AssetImages.koiImage('white'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),

                // ChiGlow logo and tagline
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 120,
                  child: Opacity(
                    opacity: _logoAnim.value.clamp(0.0, 1.0),
                    child: Transform.translate(
                      offset: Offset(0, (1.0 - _logoAnim.value) * 30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Decorative lotus line above logo
                          if (_logoAnim.value > 0.3)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(width: 40, height: 1, color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.3)),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Container(
                                      width: 8, height: 8,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.4),
                                      ),
                                    ),
                                  ),
                                  Container(width: 40, height: 1, color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.3)),
                                ],
                              ),
                            ),

                          // ChiGlow wordmark
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

                          const SizedBox(height: 12),

                          // Tagline
                          Opacity(
                            opacity: ((_logoAnim.value - 0.3) / 0.7).clamp(0.0, 1.0),
                            child: Text(
                              'Illuminate Your Chi. Glow Every Day.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                fontSize: 15,
                                color: Colors.white.withValues(alpha: 0.85),
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),

                          const SizedBox(height: 32),

                          // Loading indicator
                          Opacity(
                            opacity: ((_logoAnim.value - 0.5) / 0.5).clamp(0.0, 1.0),
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  ChiGlowTheme.bronzeGold.withValues(alpha: 0.6),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildParticle(_GoldParticle p) {
    final particleProgress = ((_particlesAnim.value - p.delay) / (1.0 - p.delay)).clamp(0.0, 1.0);
    if (particleProgress <= 0) return const SizedBox.shrink();

    final opacity = particleProgress < 0.85
        ? particleProgress / 0.85
        : (1.0 - particleProgress) / 0.15;
    final rise = particleProgress * 250 * p.speed;
    final driftX = math.sin(particleProgress * math.pi * 2.5 + p.index) * 20;

    return Positioned(
      left: MediaQuery.of(context).size.width * (p.x / 100) + driftX,
      top: MediaQuery.of(context).size.height * 0.85 - rise.clamp(0, 250),
      child: Opacity(
        opacity: opacity.clamp(0.0, 0.7),
        child: Container(
          width: p.size,
          height: p.size,
          decoration: BoxDecoration(
            color: ChiGlowTheme.bronzeGold,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.3),
                blurRadius: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Chi swirl painter for web splash
class _ChiSwirlWebPainter extends CustomPainter {
  final double progress;
  final Color color;

  _ChiSwirlWebPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = color;

    final path = Path();
    final swirls = 2.5;
    final maxRadius = 80.0;

    for (int i = 0; i <= 60; i++) {
      final t = i / 60 * progress;
      final radius = maxRadius * (0.3 + t * 0.7);
      final angle = t * swirls * 2 * math.pi;
      final x = center.dx + math.cos(angle) * radius;
      final y = center.dy + math.sin(angle) * radius * 0.4;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paint);

    // Second swirl in opposite direction
    final paint2 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = ChiGlowTheme.bronzeGold.withValues(alpha: 0.2);

    final path2 = Path();
    for (int i = 0; i <= 40; i++) {
      final t = i / 40 * progress;
      final radius = maxRadius * 0.4 * (0.5 + t * 0.5);
      final angle = -t * 2 * 2 * math.pi;
      final x = center.dx + math.cos(angle) * radius;
      final y = center.dy + math.sin(angle) * radius * 0.3;
      if (i == 0) {
        path2.moveTo(x, y);
      } else {
        path2.lineTo(x, y);
      }
    }
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant _ChiSwirlWebPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

class _GoldParticle {
  final int index;
  final double x;
  final double delay;
  final double speed;
  final double size;

  _GoldParticle({
    required this.index,
    required this.x,
    required this.delay,
    required this.speed,
    required this.size,
  });
}