import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Ambient Golden Chi Particles – floating, organic, peaceful
/// Two layers: foreground (brighter, larger, faster) and background (smaller, dimmer, slower)
class ChiParticles extends StatefulWidget {
  final Widget child;
  final int foregroundCount;
  final int backgroundCount;

  const ChiParticles({
    super.key,
    required this.child,
    this.foregroundCount = 8,
    this.backgroundCount = 10,
  });

  @override
  State<ChiParticles> createState() => _ChiParticlesState();
}

class _ChiParticlesState extends State<ChiParticles>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_ChiParticle> _particles = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();

    final rng = math.Random(42);
    // Background particles – smaller, dimmer, slower
    for (int i = 0; i < widget.backgroundCount; i++) {
      _particles.add(_ChiParticle(
        x: rng.nextDouble(),
        y: rng.nextDouble(),
        size: 1.5 + rng.nextDouble() * 1.5,
        opacity: 0.08 + rng.nextDouble() * 0.12,
        speedX: (-0.2 + rng.nextDouble() * 0.4) * 0.3,
        speedY: (-0.15 + rng.nextDouble() * 0.3) * 0.3,
        phase: rng.nextDouble() * 2 * math.pi,
        fadeSpeed: 0.3 + rng.nextDouble() * 0.5,
      ));
    }
    // Foreground particles – brighter, larger, more movement
    for (int i = 0; i < widget.foregroundCount; i++) {
      _particles.add(_ChiParticle(
        x: rng.nextDouble(),
        y: rng.nextDouble(),
        size: 2.5 + rng.nextDouble() * 2.5,
        opacity: 0.12 + rng.nextDouble() * 0.18,
        speedX: -0.3 + rng.nextDouble() * 0.6,
        speedY: -0.25 + rng.nextDouble() * 0.5,
        phase: rng.nextDouble() * 2 * math.pi,
        fadeSpeed: 0.4 + rng.nextDouble() * 0.6,
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Stack(
          children: [
            widget.child,
            ..._particles.map((p) => _buildParticle(p)),
          ],
        );
      },
    );
  }

  Widget _buildParticle(_ChiParticle p) {
    final t = _controller.value;
    // Natural organic movement using sine waves
    final dx = math.sin(t * p.speedX * 2 + p.phase) * 30;
    final dy = math.sin(t * p.speedY * 1.5 + p.phase * 1.3) * 20 - t * 8;
    // Fade in/out gently
    final fadeAlpha = (1 + math.sin(t * p.fadeSpeed * 2 + p.phase)) * 0.5;
    final opacity = p.opacity * fadeAlpha;

    return Positioned(
      left: p.x * 100 - p.size / 2,
      top: ((p.y * 100 + dy) % 100) - p.size / 2,
      child: Transform.translate(
        offset: Offset(dx, 0),
        child: Container(
          width: p.size,
          height: p.size,
          decoration: BoxDecoration(
            color: ChiGlowTheme.bronzeGold.withValues(alpha: opacity),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: ChiGlowTheme.bronzeGold.withValues(alpha: opacity * 0.5),
                blurRadius: p.size,
                spreadRadius: 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChiParticle {
  final double x;
  final double y;
  final double size;
  final double opacity;
  final double speedX;
  final double speedY;
  final double phase;
  final double fadeSpeed;

  const _ChiParticle({
    required this.x,
    required this.y,
    required this.size,
    required this.opacity,
    required this.speedX,
    required this.speedY,
    required this.phase,
    required this.fadeSpeed,
  });
}