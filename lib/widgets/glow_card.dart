import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// GlowCard with v1.0 design:
/// - Soft fade-up motion on appear (10-15px, 250ms)
/// - Subtle red glow with cream background
class GlowCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final Color? glowColor;
  final VoidCallback? onTap;

  const GlowCard({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius = 20,
    this.glowColor,
    this.onTap,
  });

  @override
  State<GlowCard> createState() => _GlowCardState();
}

class _GlowCardState extends State<GlowCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slide;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.04),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _fade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: GestureDetector(
          onTap: () {
            // Button press animation: 98% → 100%, 150ms
            if (widget.onTap != null) {
              _buttonPress();
            }
          },
          child: Container(
            padding: widget.padding ?? const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFFEFCF6), // warm off-white
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(
                color: (widget.glowColor ?? ChiGlowTheme.bronzeGold).withValues(alpha: 0.12),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.05),
                  blurRadius: 6,
                  spreadRadius: 0,
                  offset: const Offset(0, 3),
                ),
                BoxShadow(
                  color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.03),
                  blurRadius: 14,
                  spreadRadius: 1,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }

  void _buttonPress() {
    // 98% → 100%, 150ms soft easing
    final scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    final scaleAnim = Tween<double>(begin: 0.98, end: 1.0).animate(
      CurvedAnimation(parent: scaleController, curve: Curves.easeOut),
    );

    scaleController.addListener(() {
      setState(() {}); // Triggers rebuild for scale
    });
    scaleController.forward().then((_) {
      scaleController.dispose();
      widget.onTap?.call();
    });

    // Apply scale transform
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {}); // Force rebuild to show scale
    });
  }
}

// Helper for card fade-up animation - wrap a list of widgets
class AnimatedCardList extends StatefulWidget {
  final List<Widget> children;
  final int staggerDelay;

  const AnimatedCardList({
    super.key,
    required this.children,
    this.staggerDelay = 50,
  });

  @override
  State<AnimatedCardList> createState() => _AnimatedCardListState();
}

class _AnimatedCardListState extends State<AnimatedCardList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.children.length, (i) {
        return _StaggeredCard(
          index: i,
          delay: widget.staggerDelay,
          child: widget.children[i],
        );
      }),
    );
  }
}

class _StaggeredCard extends StatefulWidget {
  final int index;
  final int delay;
  final Widget child;

  const _StaggeredCard({
    required this.index,
    required this.delay,
    required this.child,
  });

  @override
  State<_StaggeredCard> createState() => _StaggeredCardState();
}

class _StaggeredCardState extends State<_StaggeredCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slide;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.04),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _fade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    Future.delayed(Duration(milliseconds: widget.index * widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: widget.child,
      ),
    );
  }
}