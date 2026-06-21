import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';
import '../services/content_service.dart';
import 'package:provider/provider.dart';
import '../providers/app_state_provider.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              // Header with koi icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good ${_timeOfDay()},',
                        style: GoogleFonts.quicksand(
                          fontSize: 14,
                          color: ChiGlowTheme.warmGold,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'ChiGlow',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          color: ChiGlowTheme.luckyRed,
                        ),
                      ),
                    ],
                  ),
                  // Koi icon — red & white
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [ChiGlowTheme.luckyRed, ChiGlowTheme.brightRed],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ChiGlowTheme.luckyRed.withValues(alpha: 0.3),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text('🐟', style: TextStyle(fontSize: 26)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Daily affirmation — gold themed
              GlowCard(
                glowColor: ChiGlowTheme.warmGold,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.auto_awesome, size: 16, color: ChiGlowTheme.warmGold),
                        const SizedBox(width: 6),
                        Text(
                          affirmationTheme,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: ChiGlowTheme.darkGold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '"$affirmation"',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: ChiGlowTheme.deepRed,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Main CTA — bold red gradient "Scan My Space"
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/room-scan'),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFD32F2F),
                        Color(0xFFE53935),
                        Color(0xFFFF5252),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: ChiGlowTheme.luckyRed.withValues(alpha: 0.4),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                      BoxShadow(
                        color: ChiGlowTheme.warmGold.withValues(alpha: 0.15),
                        blurRadius: 32,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
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
                              color: ChiGlowTheme.deepRed.withValues(alpha: 0.4),
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
                ),
              ),
              const SizedBox(height: 20),
              // Secondary buttons row
              Row(
                children: [
                  Expanded(
                    child: _SecondaryButton(
                      emoji: '🐉',
                      title: 'Zodiac Energy\nProfile',
                      onTap: () => Navigator.pushNamed(context, '/zodiac-profile'),
                      color: ChiGlowTheme.luckyRed,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _SecondaryButton(
                      emoji: '🧭',
                      title: 'Use Feng Shui\nCompass',
                      onTap: () => Navigator.pushNamed(context, '/compass'),
                      color: ChiGlowTheme.warmGold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Energy Dashboard preview
              GlowCard(
                glowColor: ChiGlowTheme.luckyRed,
                onTap: () => Navigator.pushNamed(context, '/energy-dashboard'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.energy_savings_leaf, size: 18, color: ChiGlowTheme.luckyRed),
                        const SizedBox(width: 8),
                        Text(
                          'Energy Dashboard',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ChiGlowTheme.luckyRed,
                          ),
                        ),
                        const Spacer(),
                        Icon(Icons.arrow_forward_ios, size: 14, color: ChiGlowTheme.luckyRed),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _EnergyBar(label: 'Love 💖', value: provider.loveScore, barColor: ChiGlowTheme.brightRed),
                    _EnergyBar(label: 'Wealth 💰', value: provider.wealthScore, barColor: ChiGlowTheme.warmGold),
                    _EnergyBar(label: 'Health 🌿', value: provider.healthScore, barColor: ChiGlowTheme.luckyRed),
                    _EnergyBar(label: 'Career 🧭', value: provider.careerScore, barColor: ChiGlowTheme.warmGold),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Quick actions row
              Row(
                children: [
                  _QuickAction(emoji: '🎨', label: 'Color\nCoach', onTap: () => Navigator.pushNamed(context, '/color-coaching')),
                  _QuickAction(emoji: '📅', label: 'Year\nAhead', onTap: () => Navigator.pushNamed(context, '/year-ahead')),
                  _QuickAction(emoji: '⚙️', label: 'Settings', onTap: () => Navigator.pushNamed(context, '/settings')),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  String _timeOfDay() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'morning';
    if (hour < 17) return 'afternoon';
    return 'evening';
  }
}

class _SecondaryButton extends StatelessWidget {
  final String emoji;
  final String title;
  final VoidCallback onTap;
  final Color color;

  const _SecondaryButton({
    required this.emoji,
    required this.title,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withValues(alpha: 0.08),
              color.withValues(alpha: 0.02),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withValues(alpha: 0.3), width: 1.5),
        ),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.quicksand(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: color,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
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
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.95),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: ChiGlowTheme.luckyRed.withValues(alpha: 0.12)),
            boxShadow: [
              BoxShadow(
                color: ChiGlowTheme.luckyRed.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 24)),
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