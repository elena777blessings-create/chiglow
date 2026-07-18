import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/global_header.dart';
import '../widgets/home_button.dart';
import '../data/fortune_data.dart';

/// Fortune of the Day — a beautiful fortune cookie that opens to reveal
/// a daily wisdom message. Tap the cookie to crack it open.
class FortuneScreen extends StatefulWidget {
  const FortuneScreen({super.key});

  @override
  State<FortuneScreen> createState() => _FortuneScreenState();
}

class _FortuneScreenState extends State<FortuneScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shakeAnimation;
  late Animation<double> _crackAnimation;
  late Animation<double> _fortuneFadeAnimation;
  late Animation<double> _glowAnimation;

  bool _isOpened = false;
  bool _isClosing = false;
  late FortuneEntry _fortune;
  final _random = Random();

  @override
  void initState() {
    super.initState();
    _fortune = _dailyFortune();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _shakeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: 3), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 3, end: -3), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -3, end: 2), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 2, end: -2), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -2, end: 0), weight: 1),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.25, curve: Curves.easeOut),
    ));

    _crackAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.05), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.05, end: 0.8), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.8, end: 0.9), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.9, end: 0.0), weight: 2),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.25, 0.65, curve: Curves.easeIn),
    ));

    _fortuneFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.55, 1.0, curve: Curves.easeIn),
    ));

    _glowAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 0.5, curve: Curves.easeOut),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  FortuneEntry _dailyFortune() {
    final dayOfYear = DateTime.now().difference(
      DateTime(DateTime.now().year, 1, 1),
    ).inDays;
    return FortuneLibrary.getFortuneForDay(dayOfYear + 1);
  }

  String _fortuneCategory() {
    switch (_fortune.category) {
      case 'abundance': return '🍀';
      case 'love': return '💖';
      case 'golden': return '🌟';
      case 'lotus': return '🌸';
      case 'dragon': return '🐉';
      case 'rainbow': return '🌈';
      case 'seasonal': return '🌙';
      default: return '🌸';
    }
  }

  Color _categoryGlowColor() {
    switch (_fortune.category) {
      case 'golden': return const Color(0xFFFFD700);
      case 'lotus': return const Color(0xFFFFB6C1);
      case 'dragon': return const Color(0xFFB33A35);
      case 'rainbow':
        return Colors.primaries[_random.nextInt(Colors.primaries.length)];
      case 'abundance': return const Color(0xFF4CAF50);
      case 'love': return const Color(0xFFFF8A65);
      default: return ChiGlowTheme.bronzeGold;
    }
  }

  void _openCookie() {
    if (_isClosing) return;
    if (_isOpened) return;
    _controller.forward();
    setState(() => _isOpened = true);
  }

  void _closeCookie() {
    setState(() => _isClosing = true);
    _controller.reverse().then((_) {
      setState(() => _isClosing = false);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const GlobalHeader(title: 'Fortune of the Day'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    // Subtitle
                    Text(
                      _isOpened ? 'Your fortune for today' : '🥟 Tap the cookie to reveal your fortune',
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        color: ChiGlowTheme.bronzeGold,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 28),

                    // Fortune Cookie with glow
                    GestureDetector(
                      onTap: _openCookie,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Glow effect
                          AnimatedBuilder(
                            animation: _glowAnimation,
                            builder: (context, child) {
                              return Container(
                                width: 220 + (_glowAnimation.value * 40),
                                height: 220 + (_glowAnimation.value * 40),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: _categoryGlowColor()
                                          .withValues(alpha: 0.3 * _glowAnimation.value),
                                      blurRadius: 40 + (_glowAnimation.value * 30),
                                      spreadRadius: 5 + (_glowAnimation.value * 10),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          // Cookie
                          AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: _shakeAnimation.value * 0.04,
                                child: Transform.scale(
                                  scale: _isOpened
                                      ? (1.0 - (_crackAnimation.value * 0.4))
                                      : 1.0,
                                  child: child,
                                ),
                              );
                            },
                            child: Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: const RadialGradient(
                                  colors: [
                                    Color(0xFFD4A373),
                                    Color(0xFFBC8F4F),
                                    Color(0xFFA67C2E),
                                  ],
                                  stops: [0.3, 0.7, 1.0],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.3),
                                    blurRadius: 20,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: _isOpened
                                    ? Icon(Icons.auto_awesome, size: 60, color: Colors.white.withValues(alpha: 0.8))
                                    : Icon(Icons.card_giftcard, size: 70, color: Colors.white.withValues(alpha: 0.9)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Fortune message card
                    AnimatedBuilder(
                      animation: _fortuneFadeAnimation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: _fortuneFadeAnimation.value,
                          child: child,
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          color: ChiGlowTheme.creamWhite,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: _isOpened ? _categoryGlowColor().withValues(alpha: 0.4) : ChiGlowTheme.bronzeGold.withValues(alpha: 0.3),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: _isOpened ? _categoryGlowColor().withValues(alpha: 0.12) : ChiGlowTheme.bronzeGold.withValues(alpha: 0.1),
                              blurRadius: 20,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // Category icon
                            if (_isOpened) ...[
                              Text(_fortuneCategory(), style: const TextStyle(fontSize: 28)),
                              const SizedBox(height: 8),
                            ],

                            // Title
                            if (_fortune.title != null && _isOpened) ...[
                              Text(
                                _fortune.title!,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: _categoryGlowColor(),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                height: 1,
                                width: 60,
                                color: _categoryGlowColor().withValues(alpha: 0.3),
                              ),
                              const SizedBox(height: 12),
                            ],

                            // Quote icon
                            if (!_isOpened) ...[
                              Icon(
                                Icons.format_quote,
                                size: 32,
                                color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.4),
                              ),
                              const SizedBox(height: 12),
                            ],

                            // Fortune message
                            Text(
                              _isOpened ? _fortune.message : '✨ Tap the cookie above ✨',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: _isOpened ? ChiGlowTheme.richRed : ChiGlowTheme.mediumGray,
                                height: 1.6,
                                fontStyle: _isOpened ? FontStyle.normal : FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            // Lucky Numbers
                            if (_isOpened && _fortune.luckyNumbers != null) ...[
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: _categoryGlowColor().withValues(alpha: 0.08),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('🍀 ', style: TextStyle(fontSize: 16)),
                                    Text(
                                      _fortune.luckyNumbers!.map((n) => n.toString()).join(' · '),
                                      style: GoogleFonts.quicksand(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: ChiGlowTheme.bronzeGold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],

                            // Lucky Color
                            if (_isOpened && _fortune.luckyColor != null) ...[
                              const SizedBox(height: 8),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('🎨 ', style: TextStyle(fontSize: 16)),
                                  Text(
                                    'Lucky Color: ${_fortune.luckyColor}',
                                    style: GoogleFonts.quicksand(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: ChiGlowTheme.deepRed,
                                    ),
                                  ),
                                ],
                              ),
                            ],

                            const SizedBox(height: 16),
                            Text(
                              _isOpened ? '— Fortune of the Day —' : '',
                              style: GoogleFonts.quicksand(
                                fontSize: 12,
                                color: ChiGlowTheme.bronzeGold,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    if (_isOpened) ...[
                      const SizedBox(height: 24),
                      // Until Tomorrow button
                      GestureDetector(
                        onTap: _closeCookie,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: LinearGradient(
                              colors: [
                                ChiGlowTheme.richRed,
                                ChiGlowTheme.softRed,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: ChiGlowTheme.richRed.withValues(alpha: 0.3),
                                blurRadius: 12,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Text(
                            '🌸 Until Tomorrow',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(height: 32),
                    const HomeButton(),
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