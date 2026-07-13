import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';
import '../widgets/global_header.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            const GlobalHeader(title: 'Your Zodiac Energy', subtitle: 'Discover your cosmic energy profile'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            // --- Zodiac Card Section ---
            _buildFadeUp(0, 
              Center(
                child: Column(
                  children: [
                    Text(
                      'Your Chinese Zodiac Animal',
                      style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w500, color: ChiGlowTheme.bronzeGold, letterSpacing: 0.5),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Year of the $zodiac',
                      style: GoogleFonts.playfairDisplay(fontSize: 28, fontWeight: FontWeight.w700, color: ChiGlowTheme.richRed),
                    ),
                    const SizedBox(height: 8),
                    Builder(
                      builder: (context) {
                        final screenWidth = MediaQuery.of(context).size.width;
                        final cardWidth = screenWidth - 28;
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            _zodiacImagePath(zodiac),
                            width: cardWidth,
                            fit: BoxFit.fitWidth,
                            errorBuilder: (context, error, stackTrace) => Container(
                              width: cardWidth,
                              height: cardWidth * 1.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                  colors: [ChiGlowTheme.richRed, ChiGlowTheme.bronzeGold],
                                ),
                              ),
                              child: Center(
                                child: Text(_zodiacEmoji(zodiac), style: const TextStyle(fontSize: 64)),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 🌿 Today's [Zodiac] Energy section heading
            _buildFadeUp(1,
              _SectionHeading(emoji: '🌿', text: "Today's $zodiac Energy"),
            ),
            const SizedBox(height: 16),

            // Description card
            _buildFadeUp(2,
              GlowCard(
                child: Text(
                  data['description'] as String,
                  style: GoogleFonts.quicksand(fontSize: 15, color: const Color(0xFF222222), height: 1.6),
                ),
              ),
            ),
            const SizedBox(height: 28),

            // ☀️ Daily Balance section heading
            _buildFadeUp(3,
              _SectionHeading(emoji: '☀️', text: 'Daily Balance'),
            ),
            const SizedBox(height: 16),

            // Color of the Day + Direction of the Day (grouped)
            _buildFadeUp(4,
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
            const SizedBox(height: 28),

            // 🤝 Relationships section heading
            _buildFadeUp(5,
              _SectionHeading(emoji: '🤝', text: 'Relationships'),
            ),
            const SizedBox(height: 16),

            // Compatible Signs + Practice Today (grouped)
            _buildFadeUp(6,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Compatible signs
                  Row(
                    children: [
                      Icon(Icons.favorite_border, size: 20, color: ChiGlowTheme.bronzeGold),
                      const SizedBox(width: 6),
                      Text(
                        'Compatible Signs',
                        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: (data['compatible'] as List<String>).map((sign) => _SignChip(sign: sign, compatible: true)).toList(),
                  ),
                  const SizedBox(height: 32),
                  // Practice Today
                  Row(
                    children: [
                      Icon(Icons.auto_awesome, size: 20, color: ChiGlowTheme.bronzeGold),
                      const SizedBox(width: 6),
                      Text(
                        'Practice Today',
                        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: (data['incompatible'] as List<String>).map((sign) => _SignChip(sign: sign, compatible: false)).toList(),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Practice patience, kindness, and open communication today.',
                    style: GoogleFonts.quicksand(fontSize: 13, color: ChiGlowTheme.mediumGray, height: 1.5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // 🪷 ChiGlow Guidance — enhanced section
            _buildFadeUp(7,
              GlowCard(
                glowColor: ChiGlowTheme.bronzeGold,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.spa, size: 22, color: ChiGlowTheme.bronzeGold),
                        const SizedBox(width: 8),
                        Text(
                          "Today's Wisdom",
                          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Gold divider line
                    Container(
                      height: 1,
                      color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.3),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Today is a wonderful day to trust your confidence. Small, thoughtful actions will create meaningful progress. Let the energy of the $zodiac guide you toward what matters most.',
                      style: GoogleFonts.quicksand(fontSize: 13, color: ChiGlowTheme.charcoal, height: 1.6),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // ✨ Year Ahead section heading
            _buildFadeUp(9,
              _SectionHeading(emoji: '✨', text: 'Year Ahead'),
            ),
            const SizedBox(height: 16),

            // View full forecast button
            _buildFadeUp(10,
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
            ),
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

  String _zodiacImagePath(String sign) {
    return 'assets/images/zodiac_${sign.toLowerCase()}.png';
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
          const Icon(Icons.palette, size: 24, color: ChiGlowTheme.bronzeGold),
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
            'Color of the Day',
            style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
          ),
          const SizedBox(height: 6),
          Text(
            'Wear, decorate with, or add small accents of this color today to invite confidence, optimism, and joyful energy into your space.',
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(fontSize: 13, color: ChiGlowTheme.charcoal, height: 1.4),
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
          const Icon(Icons.explore, size: 24, color: ChiGlowTheme.bronzeGold),
          const SizedBox(height: 8),
          Text(
            direction,
            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
          ),
          const SizedBox(height: 2),
          Text(
            'Direction of the Day',
            style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w500, color: ChiGlowTheme.mediumGray),
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

/// Reusable section heading used throughout the Zodiac Profile screen.
/// Displays an emoji followed by a Poppins heading in ChiGlowTheme.richRed.
class _SectionHeading extends StatelessWidget {
  final String emoji;
  final String text;

  const _SectionHeading({required this.emoji, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 20)),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ChiGlowTheme.richRed,
          ),
        ),
      ],
    );
  }
}