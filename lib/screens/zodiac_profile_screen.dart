import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';
import '../providers/app_state_provider.dart';

class ZodiacProfileScreen extends StatelessWidget {
  const ZodiacProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppStateProvider>();
    final zodiac = provider.zodiacSign;
    final data = AppStateProvider.zodiacData[zodiac]!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Zodiac Energy', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: ChiGlowTheme.luckyRed,
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
            // Zodiac header
            Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [ChiGlowTheme.luckyRed, ChiGlowTheme.warmGold],
                      ),
                      boxShadow: [
                        BoxShadow(color: ChiGlowTheme.luckyRed.withValues(alpha: 0.3), blurRadius: 20),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        _zodiacEmoji(zodiac),
                        style: const TextStyle(fontSize: 48),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Year of the $zodiac',
                    style: GoogleFonts.playfairDisplay(fontSize: 28, fontWeight: FontWeight.w700, color: ChiGlowTheme.luckyRed),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Element: ${data['element']}',
                    style: GoogleFonts.quicksand(fontSize: 14, color: ChiGlowTheme.warmGold, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Description
            GlowCard(
              child: Text(
                data['description'] as String,
                style: GoogleFonts.quicksand(fontSize: 14, color: const Color(0xFF37474F), height: 1.6),
              ),
            ),
            const SizedBox(height: 20),
            // Lucky attributes
            Row(
              children: [
                Expanded(child: _InfoChip(label: 'Lucky Color', value: data['luckyColor'] as String, emoji: '🎨')),
                const SizedBox(width: 12),
                Expanded(child: _InfoChip(label: 'Direction', value: data['luckyDirection'] as String, emoji: '🧭')),
              ],
            ),
            const SizedBox(height: 20),
            // Compatible signs
            Text(
              '🤝 Compatible Signs',
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.luckyRed),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: (data['compatible'] as List<String>).map((sign) => _SignChip(sign: sign, compatible: true)).toList(),
            ),
            const SizedBox(height: 20),
            // Incompatible signs
            Text(
              '⚠️ Challenging Signs',
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.luckyRed),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: (data['incompatible'] as List<String>).map((sign) => _SignChip(sign: sign, compatible: false)).toList(),
            ),
            const SizedBox(height: 24),
            // Daily guidance
            GlowCard(
              glowColor: ChiGlowTheme.warmGold,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.auto_awesome, size: 16, color: ChiGlowTheme.warmGold),
                      const SizedBox(width: 6),
                      Text(
                        "Today's Guidance",
                        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: ChiGlowTheme.warmGold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'The energy of the $zodiac guides you to embrace your natural confidence today. Trust your instincts — they are aligned with the universe.',
                    style: GoogleFonts.quicksand(fontSize: 13, color: const Color(0xFF37474F), height: 1.6),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
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
            const SizedBox(height: 24),
          ],
        ),
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

class _InfoChip extends StatelessWidget {
  final String label;
  final String value;
  final String emoji;

  const _InfoChip({required this.label, required this.value, required this.emoji});

  @override
  Widget build(BuildContext context) {
    return GlowCard(
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 4),
          Text(value, style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: ChiGlowTheme.luckyRed)),
          const SizedBox(height: 2),
          Text(label, style: GoogleFonts.quicksand(fontSize: 11, color: ChiGlowTheme.warmGold)),
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
            ? ChiGlowTheme.luckyRed.withValues(alpha: 0.15)
            : Colors.orange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: compatible ? ChiGlowTheme.luckyRed : Colors.orange,
          width: 1,
        ),
      ),
      child: Text(
        sign,
        style: GoogleFonts.quicksand(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: compatible ? ChiGlowTheme.luckyRed : Colors.orange[800],
        ),
      ),
    );
  }
}