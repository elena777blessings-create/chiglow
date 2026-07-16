import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';
import '../widgets/global_header.dart';

class YearAheadScreen extends StatelessWidget {
  const YearAheadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;
    final zodiacYear = _getZodiacForYear(year);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const GlobalHeader(title: 'Year Ahead Forecast', subtitle: 'Your cosmic roadmap'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            // Year Ahead Cover Artwork
            Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/year_cover_${zodiacYear.toLowerCase()}.webp',
                      width: MediaQuery.of(context).size.width * 0.80,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        height: MediaQuery.of(context).size.width * 0.80 * 1.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.1),
                        ),
                        child: Center(
                          child: Text(_zodiacEmoji(zodiacYear), style: const TextStyle(fontSize: 64)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Year of the $zodiacYear',
                    style: GoogleFonts.playfairDisplay(fontSize: 26, fontWeight: FontWeight.w700, color: ChiGlowTheme.richRed),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$year',
                    style: GoogleFonts.quicksand(fontSize: 14, color: ChiGlowTheme.bronzeGold, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'A Year of ${_yearTheme(zodiacYear)}',
                    style: GoogleFonts.quicksand(fontSize: 14, color: ChiGlowTheme.bronzeGold, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Monthly overview
            Text(
              '📅 Monthly Highlights',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
            ),
            const SizedBox(height: 12),
            ...List.generate(4, (i) => _MonthCard(
              month: _monthNames[i],
              forecast: _forecasts[zodiacYear]?[i] ?? 'A balanced month for reflection and growth.',
              element: _elements[i],
            )),
            const SizedBox(height: 20),
            // Year elements
            Text(
              '🌿 Element Balance',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
            ),
            const SizedBox(height: 12),
            GlowCard(
              child: Column(
                children: [
                  _ElementBar(element: 'Wood 🔥', value: 75),
                  _ElementBar(element: 'Fire 🔥', value: 60),
                  _ElementBar(element: 'Earth 🌍', value: 85),
                  _ElementBar(element: 'Metal ⚔️', value: 45),
                  _ElementBar(element: 'Water 💧', value: 55),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Lucky items
            GlowCard(
              glowColor: ChiGlowTheme.bronzeGold,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '🍀 Your Lucky Items for $year',
                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: ChiGlowTheme.bronzeGold),
                  ),
                  const SizedBox(height: 12),
                  _LuckyItem(emoji: '💎', item: 'Clear Quartz Crystal', desc: 'Amplifies positive energy'),
                  _LuckyItem(emoji: '🎋', item: 'Bamboo Plant', desc: 'Brings growth and resilience'),
                  _LuckyItem(emoji: '🪷', item: 'Lotus Symbol', desc: 'Represents purity and rebirth'),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ], // close inner Column children
        ), // close inner Column
      ), // close SingleChildScrollView
    ), // close Expanded
    ], // close outer Column children
  ), // close outer Column
), // close SafeArea
); // close Scaffold + return
  }

  String _zodiacEmoji(String sign) {
    const emojis = {
      'Rat': '🐀', 'Ox': '🐂', 'Tiger': '🐅', 'Rabbit': '🐇',
      'Dragon': '🐉', 'Snake': '🐍', 'Horse': '🐎', 'Goat': '🐐',
      'Monkey': '🐒', 'Rooster': '🐓', 'Dog': '🐕', 'Pig': '🐖',
    };
    return emojis[sign] ?? '🐉';
  }

  String _yearTheme(String sign) {
    const themes = {
      'Rat': 'New Beginnings', 'Ox': 'Steady Progress', 'Tiger': 'Bold Action', 'Rabbit': 'Peaceful Growth',
      'Dragon': 'Grand Transformation', 'Snake': 'Deep Wisdom', 'Horse': 'Free Adventure', 'Goat': 'Artistic Creation',
      'Monkey': 'Playful Innovation', 'Rooster': 'Precise Achievement', 'Dog': 'Loyal Service', 'Pig': 'Generous Abundance',
    };
    return themes[sign] ?? 'Harmony';
  }

  static const _monthNames = ['Spring (Mar-May)', 'Summer (Jun-Aug)', 'Autumn (Sep-Nov)', 'Winter (Dec-Feb)'];
  static const _elements = ['🌿 Wood • Growth & New Beginnings', '🔥 Fire • Passion & Energy', '⚔️ Metal • Clarity & Focus', '💧 Water • Wisdom & Reflection'];

  static const _forecasts = <String, List<String>>{
    'Dragon': [
      'A powerful spring for launching new ventures. Your confidence is magnetic — use it wisely.',
      'Summer brings recognition. Step into the spotlight and share your vision with the world.',
      'Focus on relationships in autumn. Collaborate rather than lead for the best results.',
      'Winter is for reflection. Plan your next grand move while the world rests.',
    ],
    'Rabbit': [
      'Spring brings gentle new energy. Nurture your creative projects and watch them bloom.',
      'A peaceful summer for deepening relationships. Your kindness opens doors.',
      'Autumn asks you to set boundaries. Protect your peace while staying compassionate.',
      'Winter offers quiet growth. Rest and recharge for the opportunities ahead.',
    ],
  };
}

class _MonthCard extends StatelessWidget {
  final String month;
  final String forecast;
  final String element;

  const _MonthCard({required this.month, required this.forecast, required this.element});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GlowCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(month, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
            const SizedBox(height: 4),
            Text(element, style: GoogleFonts.quicksand(fontSize: 13, color: const Color(0xFF8B6914), fontWeight: FontWeight.w600, height: 1.3)),
            const SizedBox(height: 8),
            Text(forecast, style: GoogleFonts.quicksand(fontSize: 15, color: const Color(0xFF1A1A1A), height: 1.6)),
          ],
        ),
      ),
    );
  }
}

class _ElementBar extends StatelessWidget {
  final String element;
  final int value;

  const _ElementBar({required this.element, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(width: 100, child: Text(element, style: GoogleFonts.quicksand(fontSize: 12, color: ChiGlowTheme.richRed))),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: value / 100,
                minHeight: 6,
                backgroundColor: ChiGlowTheme.richRed.withValues(alpha: 0.1),
                valueColor: AlwaysStoppedAnimation<Color>(
                  value > 70 ? ChiGlowTheme.richRed : value > 40 ? ChiGlowTheme.bronzeGold : Colors.orange,
                ),
              ),
            ),
          ),
          SizedBox(width: 30, child: Text('$value%', textAlign: TextAlign.right,
            style: GoogleFonts.quicksand(fontSize: 11, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed))),
        ],
      ),
    );
  }
}

class _LuckyItem extends StatelessWidget {
  final String emoji;
  final String item;
  final String desc;

  const _LuckyItem({required this.emoji, required this.item, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item, style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
              Text(desc, style: GoogleFonts.quicksand(fontSize: 12, color: ChiGlowTheme.bronzeGold)),
            ],
          ),
        ],
      ),
    );
  }
}

String _getZodiacForYear(int year) {
  const animals = ['Monkey', 'Rooster', 'Dog', 'Pig', 'Rat', 'Ox', 'Tiger', 'Rabbit', 'Dragon', 'Snake', 'Horse', 'Goat'];
  return animals[year % 12];
}