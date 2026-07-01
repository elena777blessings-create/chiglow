import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// GlowCard v2.0 — Global Design Standard:
/// - Cream background, very light gold border, warm glow, soft shadows
/// - Soft fade-up motion on appear
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
          onTap: widget.onTap,
          child: Container(
            padding: widget.padding ?? const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ChiGlowTheme.creamWhite.withValues(alpha: 0.92),
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(
                color: (widget.glowColor ?? ChiGlowTheme.bronzeGold).withValues(alpha: 0.15),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: (widget.glowColor ?? ChiGlowTheme.richRed).withValues(alpha: 0.06),
                  blurRadius: 16,
                  spreadRadius: 0,
                  offset: const Offset(0, 4),
                ),
                BoxShadow(
                  color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.04),
                  blurRadius: 24,
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