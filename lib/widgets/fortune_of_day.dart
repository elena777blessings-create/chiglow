import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/fortune_messages.dart';

/// 🥠 Fortune of the Day widget — a daily gift-like fortune cookie experience
class FortuneOfTheDay extends StatefulWidget {
  const FortuneOfTheDay({super.key});

  @override
  State<FortuneOfTheDay> createState() => _FortuneOfTheDayState();
}

class _FortuneOfTheDayState extends State<FortuneOfTheDay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _crackAnim;
  late Animation<double> _particlesAnim;
  late Animation<double> _unfoldAnim;
  late Animation<double> _messageFadeAnim;

  bool _hasBeenOpened = false;
  String _todayMessage = '';
  final List<_GoldenParticle> _particles = [];

  @override
  void initState() {
    super.initState();
    _todayMessage = FortuneMessages.messageForToday();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    );

    // Crack animation (0.0–0.25)
    _crackAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.25, curve: Curves.easeOutBack),
      ),
    );

    // Particles rise (0.15–0.55)
    _particlesAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.15, 0.55, curve: Curves.easeOut),
      ),
    );

    // Unfold paper (0.45–0.85)
    _unfoldAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.45, 0.85, curve: Curves.easeOutCubic),
      ),
    );

    // Message fade in (0.75–1.0)
    _messageFadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeIn),
      ),
    );

    // Generate particles
    for (int i = 0; i < 10; i++) {
      _particles.add(_GoldenParticle(
        index: i,
        randomX: (i * 31.7) % 1.0,
        randomDelay: (i * 0.08) % 0.4,
        randomSpeed: 0.6 + (i % 5) * 0.15,
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openFortune() {
    if (_hasBeenOpened) return;
    setState(() => _hasBeenOpened = true);
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title with flourish
            _buildTitle(),
            const SizedBox(height: 14),
            // Fortune cookie area
            _buildCookieArea(),
          ],
        );
      },
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('🥠', style: TextStyle(fontSize: 20)),
            const SizedBox(width: 8),
            Text(
              'Fortune of the Day',
              style: GoogleFonts.playfairDisplay(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: ChiGlowTheme.richRed,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        // Decorative flourish
        Row(
          children: [
            Container(
              width: 30,
              height: 1,
              color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.3),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: SizedBox(
                width: 10,
                height: 10,
                child: Icon(Icons.auto_awesome, size: 10, color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.5)),
              ),
            ),
            Container(
              width: 30,
              height: 1,
              color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.3),
            ),
            const SizedBox(width: 12),
            Text(
              FortuneMessages.todayIndex() == 0 ? 'Day 1 of 20' : 'Day ${FortuneMessages.todayIndex() + 1} of 20',
              style: GoogleFonts.quicksand(
                fontSize: 10,
                color: ChiGlowTheme.bronzeGold,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCookieArea() {
    return GestureDetector(
      onTap: _hasBeenOpened ? null : _openFortune,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(_hasBeenOpened && _messageFadeAnim.value > 0.5 ? 20 : 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ChiGlowTheme.bronzeGold.withValues(alpha: 0.08),
              ChiGlowTheme.richRed.withValues(alpha: 0.04),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: ChiGlowTheme.bronzeGold.withValues(alpha: _hasBeenOpened ? 0.3 : 0.2),
          ),
        ),
        child: Column(
          children: [
            if (!_hasBeenOpened)
              // Idle state — fortune cookie illustration
              _buildIdleCookie()
            else ...[
              // Animation states
              if (_crackAnim.value < 1.0)
                _buildCrackingCookie()
              else ...[
                // Particles + swirling chi
                if (_particlesAnim.value < 1.0)
                  _buildParticleStage()
                else
                  // Message revealed
                  _buildMessageRevealed(),
              ],
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildIdleCookie() {
    return Column(
      children: [
        // Stylized fortune cookie — widget-rendered
        SizedBox(
          width: 100,
          height: 80,
          child: CustomPaint(
            painter: _FortuneCookiePainter(),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Tap to open your fortune',
          style: GoogleFonts.quicksand(
            fontSize: 13,
            color: ChiGlowTheme.mediumGray,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget _buildCrackingCookie() {
    final crackAmount = _crackAnim.value;
    final shakeX = math.sin(crackAmount * math.pi * 8) * 3 * (1 - crackAmount);

    return Column(
      children: [
        SizedBox(
          width: 100,
          height: 80,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Left half of cracked cookie
              Transform.translate(
                offset: Offset(-8 * crackAmount + shakeX, 0),
                child: Opacity(
                  opacity: 1.0 - crackAmount * 0.5,
                  child: CustomPaint(
                    size: const Size(50, 80),
                    painter: _FortuneCookieHalfPainter(isLeft: true),
                  ),
                ),
              ),
              // Right half of cracked cookie
              Transform.translate(
                offset: Offset(8 * crackAmount + shakeX, 0),
                child: Opacity(
                  opacity: 1.0 - crackAmount * 0.5,
                  child: CustomPaint(
                    size: const Size(50, 80),
                    painter: _FortuneCookieHalfPainter(isLeft: false),
                  ),
                ),
              ),
              // Tiny golden sparkles
              if (crackAmount > 0.3)
                ...List.generate(6, (i) {
                  final sparkAngle = (i / 6) * 2 * math.pi;
                  final sparkDist = 30 + crackAmount * 20;
                  return Positioned(
                    left: 50 + math.cos(sparkAngle) * sparkDist - 2,
                    top: 40 + math.sin(sparkAngle) * sparkDist - 2,
                    child: Opacity(
                      opacity: (1.0 - crackAmount * 0.6).clamp(0.0, 1.0),
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: ChiGlowTheme.bronzeGold,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  );
                }),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Your fortune is revealing...',
          style: GoogleFonts.quicksand(
            fontSize: 13,
            color: ChiGlowTheme.bronzeGold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget _buildParticleStage() {
    return SizedBox(
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Crystal blue chi swirl ring
          CustomPaint(
            size: const Size(80, 80),
            painter: _ChiSwirlPainter(progress: _particlesAnim.value),
          ),
          // Golden particles rising
          ..._particles.map((p) => _buildGoldenParticle(p)),
          // Center glow
          Opacity(
            opacity: _particlesAnim.value * 0.4,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    ChiGlowTheme.bronzeGold.withValues(alpha: 0.3),
                    ChiGlowTheme.bronzeGold.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoldenParticle(_GoldenParticle p) {
    final particleProgress = ((_particlesAnim.value - p.randomDelay) / (1.0 - p.randomDelay)).clamp(0.0, 1.0);
    final opacity = particleProgress < 0.8
        ? particleProgress / 0.8
        : (1.0 - particleProgress) / 0.2;
    final rise = particleProgress * 80 * p.randomSpeed;
    final driftX = math.sin(particleProgress * math.pi * 2 + p.index) * 15;

    return Positioned(
      left: 40 + p.randomX * 40 + driftX - 3,
      top: 20 + 60 - rise.clamp(0, 80),
      child: Opacity(
        opacity: opacity.clamp(0.0, 0.9),
        child: Container(
          width: 3 + p.index % 3 * 1.5,
          height: 3 + p.index % 3 * 1.5,
          decoration: BoxDecoration(
            color: ChiGlowTheme.bronzeGold,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.4),
                blurRadius: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageRevealed() {
    final displayUnfold = _unfoldAnim.value;
    final messageOpacity = _messageFadeAnim.value;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Column(
          children: [
            // Unfolding paper scroll
            ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: displayUnfold < 0.1 ? 0.0 : displayUnfold,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.95),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.25),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.08),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Decorative top flourish
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 24,
                            height: 1,
                            color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.3),
                          ),
                          const SizedBox(width: 6),
                          SizedBox(
                            width: 12,
                            height: 12,
                            child: Icon(Icons.auto_awesome, size: 8, color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.5)),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            width: 24,
                            height: 1,
                            color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.3),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Opacity(
                        opacity: messageOpacity,
                        child: Text(
                          _todayMessage,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            color: ChiGlowTheme.deepRed,
                            height: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Opacity(
                        opacity: messageOpacity * 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 20,
                              height: 1,
                              color: ChiGlowTheme.richRed.withValues(alpha: 0.2),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '✦',
                              style: TextStyle(fontSize: 8, color: ChiGlowTheme.richRed.withValues(alpha: 0.3)),
                            ),
                            const SizedBox(width: 6),
                            Container(
                              width: 20,
                              height: 1,
                              color: ChiGlowTheme.richRed.withValues(alpha: 0.2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Hint that it was today's fortune
            Opacity(
              opacity: messageOpacity,
              child: Text(
                "Today's message for you",
                style: GoogleFonts.quicksand(
                  fontSize: 10,
                  color: ChiGlowTheme.bronzeGold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Forture cookie painter — cream color with gold highlights
class _FortuneCookiePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          const Color(0xFFFFF3E0), // warm cream
          const Color(0xFFFFE0B2), // cream with slight gold
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();
    // Fortune cookie crescent shape
    path.moveTo(size.width * 0.1, size.height * 0.6);
    path.quadraticBezierTo(
      size.width * 0.05, size.height * 0.3,
      size.width * 0.25, size.height * 0.15,
    );
    path.quadraticBezierTo(
      size.width * 0.5, size.height * 0.05,
      size.width * 0.75, size.height * 0.15,
    );
    path.quadraticBezierTo(
      size.width * 0.95, size.height * 0.3,
      size.width * 0.9, size.height * 0.6,
    );
    path.quadraticBezierTo(
      size.width * 0.85, size.height * 0.7,
      size.width * 0.7, size.height * 0.65,
    );
    path.quadraticBezierTo(
      size.width * 0.6, size.height * 0.75,
      size.width * 0.5, size.height * 0.7,
    );
    path.quadraticBezierTo(
      size.width * 0.4, size.height * 0.75,
      size.width * 0.3, size.height * 0.65,
    );
    path.quadraticBezierTo(
      size.width * 0.15, size.height * 0.7,
      size.width * 0.1, size.height * 0.6,
    );
    path.close();

    canvas.drawPath(path, paint);

    // Gold highlight edge
    final goldPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..shader = LinearGradient(
        colors: [
          ChiGlowTheme.bronzeGold.withValues(alpha: 0.3),
          ChiGlowTheme.bronzeGold.withValues(alpha: 0.1),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(path, goldPaint);

    // Subtle fold lines
    final foldPaint = Paint()
      ..color = ChiGlowTheme.bronzeGold.withValues(alpha: 0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    final foldPath = Path();
    foldPath.moveTo(size.width * 0.3, size.height * 0.65);
    foldPath.quadraticBezierTo(
      size.width * 0.4, size.height * 0.55,
      size.width * 0.5, size.height * 0.55,
    );
    canvas.drawPath(foldPath, foldPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Half of a cracked fortune cookie
class _FortuneCookieHalfPainter extends CustomPainter {
  final bool isLeft;

  _FortuneCookieHalfPainter({required this.isLeft});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          const Color(0xFFFFF3E0),
          const Color(0xFFFFE0B2),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.save();
    if (!isLeft) {
      canvas.translate(size.width, 0);
      canvas.scale(-1, 1);
    }

    final path = Path();
    path.moveTo(size.width * 0.8, size.height * 0.55);
    path.quadraticBezierTo(
      size.width * 0.7, size.height * 0.1,
      size.width * 0.4, size.height * 0.15,
    );
    path.quadraticBezierTo(
      size.width * 0.2, size.height * 0.2,
      size.width * 0.15, size.height * 0.4,
    );
    path.quadraticBezierTo(
      size.width * 0.1, size.height * 0.55,
      size.width * 0.2, size.height * 0.6,
    );
    path.quadraticBezierTo(
      size.width * 0.35, size.height * 0.65,
      size.width * 0.5, size.height * 0.6,
    );
    path.quadraticBezierTo(
      size.width * 0.6, size.height * 0.7,
      size.width * 0.7, size.height * 0.65,
    );
    path.quadraticBezierTo(
      size.width * 0.75, size.height * 0.6,
      size.width * 0.8, size.height * 0.55,
    );
    path.close();

    // Zigzag crack edge
    final crackPath = Path();
    crackPath.moveTo(size.width * 0.8, size.height * 0.55);
    crackPath.lineTo(size.width * 0.85, size.height * 0.5);
    crackPath.lineTo(size.width * 0.82, size.height * 0.45);
    crackPath.lineTo(size.width * 0.88, size.height * 0.4);
    crackPath.lineTo(size.width * 0.83, size.height * 0.35);
    crackPath.lineTo(size.width * 0.87, size.height * 0.3);
    crackPath.lineTo(size.width * 0.82, size.height * 0.25);
    crackPath.lineTo(size.width * 0.85, size.height * 0.2);

    final combinedPath = Path.combine(PathOperation.union, path, crackPath);

    canvas.drawPath(combinedPath, paint);

    final goldPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = ChiGlowTheme.bronzeGold.withValues(alpha: 0.2);
    canvas.drawPath(path, goldPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Crystal blue chi swirl painter
class _ChiSwirlPainter extends CustomPainter {
  final double progress;

  _ChiSwirlPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = const Color(0xFF5B9BD5).withValues(alpha: (1.0 - progress) * 0.4);

    final path = Path();
    final swirls = 3;
    final maxRadius = size.width / 2 - 5;

    for (int i = 0; i <= 40; i++) {
      final t = i / 40 * progress;
      final radius = maxRadius * (1.0 - t * 0.5);
      final angle = t * swirls * 2 * math.pi;
      final x = center.dx + math.cos(angle) * radius;
      final y = center.dy + math.sin(angle) * radius;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _ChiSwirlPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

/// Particle data for golden chi particles
class _GoldenParticle {
  final int index;
  final double randomX;
  final double randomDelay;
  final double randomSpeed;

  _GoldenParticle({
    required this.index,
    required this.randomX,
    required this.randomDelay,
    required this.randomSpeed,
  });
}