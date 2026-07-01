import 'package:flutter/material.dart';
import '../widgets/global_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';
import '../providers/app_state_provider.dart';

class ZodiacProfileScreen extends StatefulWidget {
  const ZodiacProfileScreen({super.key});

  @override
  State<ZodiacProfileScreen> createState() => _ZodiacProfileScreenState();
}

class _ZodiacProfileScreenState extends State<ZodiacProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
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
    final provider = context.watch<AppStateProvider>();
    final zodiac = provider.zodiacSign;
    final data = AppStateProvider.zodiacData[zodiac]!;
    final luckyColor = (data['luckyColor'] as String?) ?? 'Gold';
    final luckyDirection = (data['luckyDirection'] as String?) ?? 'South';

    return Scaffold(
      appBar: AppBar(
        title: Text('Zodiac Energy', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: ChiGlowTheme.richRed,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today, size: 20),
            onPressed: () => Navigator.pushNamed(context, '/year-ahead'),
            tooltip: 'Year Ahead Forecast',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalHeader(title: 'Zodiac Energy', subtitle: 'Year of the $zodiac · ${data['element']}'),
            const SizedBox(height: 8),
            _buildFadeUp(1,
              // Description
              GlowCard(
                child: Text(
                  data['description'] as String,
                  style: GoogleFonts.quicksand(fontSize: 14, color: ChiGlowTheme.charcoal, height: 1.6),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Color of the Day + Direction of the Day
            _buildFadeUp(2,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _ColorOfDayCard(colorName: luckyColor, zodiac: zodiac),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _DirectionOfDayCard(direction: luckyDirection),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildFadeUp(3,
              // Compatible signs
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '🪷 Compatible Signs',
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: (data['compatible'] as List<String>).map((sign) => _SignChip(sign: sign, compatible: true)).toList(),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Your compatible signs support and uplift your energy. Focus on these connections today.',
                    style: GoogleFonts.quicksand(fontSize: 13, color: ChiGlowTheme.mediumGray, height: 1.5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildFadeUp(4,
              // Practice Today
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '🪷 Practice Today',
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Practice patience, kindness, and open communication today.',
                    style: GoogleFonts.quicksand(fontSize: 13, color: ChiGlowTheme.mediumGray, height: 1.5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildFadeUp(5,
              // ChiGlow Guidance
              GlowCard(
                glowColor: ChiGlowTheme.bronzeGold,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('🌸', style: const TextStyle(fontSize: 16)),
                        const SizedBox(width: 6),
                        Text(
                          'ChiGlow Guidance',
                          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: ChiGlowTheme.bronzeGold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Today is a wonderful day to trust your confidence. Small, thoughtful actions will create meaningful progress. Let the energy of the $zodiac guide you toward what matters most.',
                      style: GoogleFonts.quicksand(fontSize: 13, color: ChiGlowTheme.charcoal, height: 1.6),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildFadeUp(6,
              // View full forecast button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/year-ahead'),
                  icon: const Icon(Icons.auto_awesome, size: 18),
                  label: Text('View Year Ahead Forecast', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildFadeUp(int index, Widget child) {
    final delay = index * 80;
    final anim = CurvedAnimation(
      parent: _controller,
      curve: Interval(
        delay / 1000.0,
        (delay + 400) / 1000.0,
        curve: Curves.easeOut,
      ),
    );
    return FadeTransition(
      opacity: anim,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.04),
          end: Offset.zero,
        ).animate(anim),
        child: child,
      ),
    );
  }

  String _zodiacEmoji(String sign) {
    const emojis = {
      'Rat': '🐀', 'Ox': '🐂', 'Tiger': '🐅', 'Rabbit': '🐇',
      'Dragon': '🐉', 'Snake': '🐍', 'Horse': '🐎', 'Goat': '🐐',
      'Monkey': '🐒', 'Rooster': '🐓', 'Dog': '🐕', 'Pig': '🐖',
    };
    return emojis[sign] ?? '🐉';
  }
}

class _ColorOfDayCard extends StatelessWidget {
  final String colorName;
  final String zodiac;

  const _ColorOfDayCard({required this.colorName, required this.zodiac});

  @override
  Widget build(BuildContext context) {
    return GlowCard(
      glowColor: ChiGlowTheme.bronzeGold,
      child: Column(
        children: [
          const Text('🌸', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          // Color swatch
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: _colorFromName(colorName),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: _colorFromName(colorName).withValues(alpha: 0.4),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            colorName,
            style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
          ),
          const SizedBox(height: 2),
          Text(
            'Color of the Day',
            style: GoogleFonts.quicksand(fontSize: 10, color: ChiGlowTheme.mediumGray),
          ),
          const SizedBox(height: 6),
          Text(
            'Wear, decorate with, or add small accents of this color today to invite confidence, optimism, and joyful energy into your space.',
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(fontSize: 10, color: ChiGlowTheme.mediumGray, height: 1.4),
          ),
        ],
      ),
    );
  }

  Color _colorFromName(String name) {
    switch (name.toLowerCase()) {
      case 'blue': return const Color(0xFF5B9BD5);
      case 'gold': return const Color(0xFFFFD700);
      case 'green': return const Color(0xFF4CAF50);
      case 'red': return const Color(0xFFE53935);
      case 'purple': return const Color(0xFF9C27B0);
      case 'white': return const Color(0xFFF5F5F5);
      case 'yellow': return const Color(0xFFFFEB3B);
      case 'brown': return const Color(0xFF795548);
      case 'orange': return const Color(0xFFFF9800);
      default: return const Color(0xFFFFD700);
    }
  }
}

class _DirectionOfDayCard extends StatelessWidget {
  final String direction;

  const _DirectionOfDayCard({required this.direction});

  @override
  Widget build(BuildContext context) {
    return GlowCard(
      child: Column(
        children: [
          const Text('🧭', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          Text(
            direction,
            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700, color: ChiGlowTheme.richRed),
          ),
          const SizedBox(height: 2),
          Text(
            'Direction of the Day',
            style: GoogleFonts.quicksand(fontSize: 10, color: ChiGlowTheme.mediumGray),
          ),
          const SizedBox(height: 6),
          Text(
            'Face this direction while working, meditating, journaling, or planning important goals today.',
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(fontSize: 10, color: ChiGlowTheme.mediumGray, height: 1.4),
          ),
        ],
      ),
    );
  }
}

class _SignChip extends StatelessWidget {
  final String sign;
  final bool compatible;

  const _SignChip({required this.sign, required this.compatible});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: compatible
            ? ChiGlowTheme.richRed.withValues(alpha: 0.1)
            : ChiGlowTheme.bronzeGold.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: compatible ? ChiGlowTheme.richRed : ChiGlowTheme.bronzeGold,
          width: 1,
        ),
      ),
      child: Text(
        sign,
        style: GoogleFonts.quicksand(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: compatible ? ChiGlowTheme.richRed : ChiGlowTheme.bronzeGold,
        ),
      ),
    );
  }
}