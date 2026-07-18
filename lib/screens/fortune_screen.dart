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

  bool _isOpened = false;
  String _fortune = '';

  @override
  void initState() {
    super.initState();
    _fortune = _dailyFortune();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _shakeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: 3), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 3, end: -3), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -3, end: 2), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 2, end: -2), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -2, end: 0), weight: 1),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
    ));

    _crackAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.05), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.05, end: 0.8), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.8, end: 0.9), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.9, end: 0.7), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.7, end: 0.0), weight: 2),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 0.7, curve: Curves.easeIn),
    ));

    _fortuneFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.6, 1.0, curve: Curves.easeIn),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _dailyFortune() {
    final dayOfYear = DateTime.now().difference(
      DateTime(DateTime.now().year, 1, 1),
    ).inDays;
    final index = dayOfYear.clamp(0, FortuneData.fortunes.length - 1);
    return FortuneData.fortunes[index];
  }

  void _openCookie() {
    if (_isOpened) {
      // Reset and get a new fortune for next time
      setState(() {
        _isOpened = false;
        _fortune = _dailyFortune();
      });
      _controller.reset();
      return;
    }
    _controller.forward();
    setState(() => _isOpened = true);
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
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    // Subtitle
                    Text(
                      '🥟 Tap the cookie to reveal your fortune',
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        color: ChiGlowTheme.bronzeGold,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),

                    // Fortune Cookie
                    GestureDetector(
                      onTap: _openCookie,
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _shakeAnimation.value * 0.05,
                            child: Transform.scale(
                              scale: 1.0 - (_crackAnimation.value * 0.5),
                              child: child,
                            ),
                          );
                        },
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const RadialGradient(
                              colors: [
                                Color(0xFFD4A373), // golden brown
                                Color(0xFFBC8F4F), // darker gold
                                Color(0xFFA67C2E), // bronze gold
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
                            child: Icon(
                              _isOpened
                                  ? Icons.auto_awesome
                                  : Icons.card_giftcard,
                              size: 80,
                              color: Colors.white.withValues(alpha: 0.9),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Fortune message
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
                            color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.3),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.1),
                              blurRadius: 16,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.format_quote,
                              size: 32,
                              color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.4),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              _fortune,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: ChiGlowTheme.richRed,
                                height: 1.6,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              '— Fortune of the Day —',
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
                      GestureDetector(
                        onTap: _openCookie,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.4),
                            ),
                          ),
                          child: Text(
                            '✨ Open Another',
                            style: GoogleFonts.quicksand(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: ChiGlowTheme.bronzeGold,
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