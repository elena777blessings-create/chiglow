import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';
import '../services/content_service.dart';
import 'package:provider/provider.dart';
import '../providers/app_state_provider.dart';
import '../utils/asset_images.dart';
import '../widgets/chi_particles.dart';
import '../widgets/global_header.dart';
import '../widgets/page_header.dart'; // SecondaryButton

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppStateProvider>();
    final affirmation = ContentService.affirmationForToday();
    final affirmationTheme = ContentService.affirmationThemeForToday();

    return Scaffold(
      body: ChiParticles(
        child: SafeArea(
          child: Column(
            children: [
              // Full-width header — edge-to-edge, outside scroll padding
              const GlobalHeader(title: ''),
              // Scrollable content with side padding
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 2, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              // Greeting with user name
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  provider.userName.isNotEmpty
                      ? 'Good ${_timeOfDay()}, ${provider.userName}.'
                      : 'Good ${_timeOfDay()},',
                  style: GoogleFonts.quicksand(
                    fontSize: 21,
                    color: ChiGlowTheme.bronzeGold,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Daily affirmation — bronze gold themed
              GlowCard(
                glowColor: ChiGlowTheme.bronzeGold,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 26,
                          height: 26,
                          child: Image.asset(AssetImages.lotusGold, fit: BoxFit.contain),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          affirmationTheme,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ChiGlowTheme.bronzeGold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '"$affirmation"',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: ChiGlowTheme.deepRed,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Main CTA — Approved ChiGlow artwork
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/scan-guide'),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/scan_room_card.png',
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Harmony Journal card
              GlowCard(
                glowColor: ChiGlowTheme.bronzeGold,
                onTap: () => Navigator.pushNamed(context, '/harmony-journal'),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: ChiGlowTheme.richRed.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(child: Text('📓', style: TextStyle(fontSize: 36))),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Harmony Journal',
                            style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
                          ),
                          Text(
                            'View your scan history',
                            style: GoogleFonts.quicksand(fontSize: 15, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 14, color: ChiGlowTheme.richRed),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Secondary buttons row — cream + gold border
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      emoji: '🐉',
                      title: 'Zodiac Energy\nProfile',
                      onTap: () => Navigator.pushNamed(context, '/zodiac-profile'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SecondaryButton(
                      emoji: '🧭',
                      title: 'Use Feng Shui\nCompass',
                      onTap: () => Navigator.pushNamed(context, '/compass'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Energy Dashboard preview
              GlowCard(
                glowColor: ChiGlowTheme.richRed,
                onTap: () => Navigator.pushNamed(context, '/energy-dashboard'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.energy_savings_leaf, size: 18, color: ChiGlowTheme.richRed),
                        const SizedBox(width: 8),
                        Text(
                          '🪷 Energy Dashboard',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ChiGlowTheme.richRed,
                          ),
                        ),
                        const Spacer(),
                        Icon(Icons.arrow_forward_ios, size: 14, color: ChiGlowTheme.richRed),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _EnergyBar(label: 'Love 💖', value: provider.loveScore, barColor: ChiGlowTheme.softRed),
                    _EnergyBar(label: 'Wealth 💰', value: provider.wealthScore, barColor: ChiGlowTheme.bronzeGold),
                    _EnergyBar(label: 'Health 🌿', value: provider.healthScore, barColor: ChiGlowTheme.richRed),
                    _EnergyBar(label: 'Career 🧭', value: provider.careerScore, barColor: ChiGlowTheme.bronzeGold),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _QuickAction(emoji: '🎨', label: 'Color\nCoach', onTap: () => Navigator.pushNamed(context, '/color-coaching')),
                    _QuickAction(emoji: '📅', label: 'Year\nAhead', onTap: () => Navigator.pushNamed(context, '/year-ahead')),
                    _QuickAction(emoji: '⚙️', label: 'Settings', onTap: () => Navigator.pushNamed(context, '/settings')),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Upgrade CTA card
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/upgrade'),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ChiGlowTheme.bronzeGold.withValues(alpha: 0.12),
                        ChiGlowTheme.richRed.withValues(alpha: 0.06),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.25),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: ChiGlowTheme.richRed.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text('👑', style: TextStyle(fontSize: 36)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Unlock Premium ✨',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: ChiGlowTheme.richRed,
                              ),
                            ),
                            Text(
                              'Unlimited scans, full zodiac & more',
                              style: GoogleFonts.quicksand(
                                fontSize: 11,
                                color: ChiGlowTheme.bronzeGold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [ChiGlowTheme.richRed, ChiGlowTheme.softRed],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'LIFETIME \$49',
                          style: GoogleFonts.poppins(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
                    ], // close inner Column children
                  ), // close inner Column widget
                ), // close SingleChildScrollView
              ), // close Expanded
            ], // close outer Column children
          ), // close outer Column widget
        ), // close SafeArea
      ), // close ChiParticles
    ); // close Scaffold + return
  }

  String _timeOfDay() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'morning';
    if (hour < 17) return 'afternoon';
    return 'evening';
  }
}

/// Sunrise Coral CTA button with tap animation
class _SunriseCtaButton extends StatefulWidget {
  final VoidCallback onTap;

  const _SunriseCtaButton({required this.onTap});

  @override
  State<_SunriseCtaButton> createState() => _SunriseCtaButtonState();
}

class _SunriseCtaButtonState extends State<_SunriseCtaButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;
  late Animation<double> _glowAnim;
  bool _isPressed = false;

  // Particle simulation
  final List<_Particle> _particles = List.generate(12, (i) => _Particle(i));

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _glowAnim = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
    setState(() => _isPressed = false);
    widget.onTap();
  }

  void _onTapCancel() {
    _controller.reverse();
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnim.value,
            child: child,
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFFFAB91), // Soft coral top
                Color(0xFFFFCC80), // Warm peach coral bottom
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFFAB91).withValues(alpha: 0.35),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.1),
                blurRadius: 32,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  const Text('🔍', style: TextStyle(fontSize: 44)),
                  const SizedBox(height: 12),
                  Text(
                    'Scan My Space\nfor Chi Flow',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.3,
                      shadows: [
                        Shadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Discover the energy of your room',
                    style: GoogleFonts.quicksand(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.85),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              // Rising particles
              if (_isPressed)
                ..._particles.map((p) => Positioned(
                  left: 20 + (p.offset * 12) % 200,
                  bottom: 10,
                  child: _ParticleWidget(particle: p),
                )),
            ],
          ),
        ),
      ),
    );
  }
}

class _Particle {
  final double offset;
  final double speed;
  final double size;

  _Particle(int i)
      : offset = (i * 17.0) % 100,
        speed = 0.3 + (i % 5) * 0.1,
        size = 2.0 + (i % 3) * 1.0;
}

class _ParticleWidget extends StatefulWidget {
  final _Particle particle;

  const _ParticleWidget({required this.particle});

  @override
  State<_ParticleWidget> createState() => _ParticleWidgetState();
}

class _ParticleWidgetState extends State<_ParticleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (600 + widget.particle.speed * 400).toInt()),
    );
    _anim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward().then((_) => _controller.dispose());
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
      builder: (context, child) {
        return Opacity(
          opacity: 1.0 - _anim.value,
          child: Transform.translate(
            offset: Offset(0, -_anim.value * 40),
            child: Container(
              width: widget.particle.size,
              height: widget.particle.size,
              decoration: BoxDecoration(
                color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.6),
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _EnergyBar extends StatelessWidget {
  final String label;
  final int value;
  final Color barColor;

  const _EnergyBar({required this.label, required this.value, required this.barColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: GoogleFonts.quicksand(fontSize: 12, color: ChiGlowTheme.deepRed, fontWeight: FontWeight.w500)),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: value / 100,
                minHeight: 6,
                backgroundColor: barColor.withValues(alpha: 0.12),
                valueColor: AlwaysStoppedAnimation<Color>(barColor),
              ),
            ),
          ),
          SizedBox(
            width: 30,
            child: Text(
              '$value%',
              textAlign: TextAlign.right,
              style: GoogleFonts.quicksand(fontSize: 11, fontWeight: FontWeight.w600, color: ChiGlowTheme.deepRed),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final String emoji;
  final String label;
  final VoidCallback onTap;

  const _QuickAction({required this.emoji, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 16),
          constraints: const BoxConstraints(minHeight: 90),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.95),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: ChiGlowTheme.richRed.withValues(alpha: 0.12)),
            boxShadow: [
              BoxShadow(
                color: ChiGlowTheme.richRed.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 36)),
              const SizedBox(height: 4),
              Text(
                label,
                textAlign: TextAlign.center,
                style: GoogleFonts.quicksand(fontSize: 11, fontWeight: FontWeight.w600, color: ChiGlowTheme.deepRed),
              ),
            ],
          ),
        ),
      ),
    );
  }
}