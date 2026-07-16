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
              forecast: _zodiacSeasonalInsights[zodiacYear]?[i] ?? _seasonFallback[i],
              element: _elements[i],
            )),
            const SizedBox(height: 20),
            // Year elements
            Text(
              '🌿 Your Overall Balance',
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
  static const _zodiacSeasonalInsights = <String, List<String>>{
    'Rat': [
      'A wonderful season to explore fresh ideas and embrace new opportunities. Your curiosity and quick thinking will help meaningful plans take root and flourish.',
      'Your confidence grows through connection this season. Share your ideas, strengthen relationships, and let your enthusiasm open new doors.',
      'A rewarding time to organize your goals and focus on what matters most. Careful planning now will create steady progress in the months ahead.',
      'Slow down and trust your intuition. Quiet reflection will reveal valuable insights and prepare you for exciting opportunities in the year ahead.',
    ],
    'Ox': [
      'A beautiful season to plant lasting foundations. Your patience and determination will help new goals grow steadily into meaningful achievements.',
      'Step confidently into new opportunities while staying true to your values. Your quiet strength will inspire trust and strengthen important relationships.',
      'A rewarding season to simplify your priorities and build on steady progress. Careful decisions now will create lasting success in the months ahead.',
      'Take time to rest and appreciate how far you\'ve come. Reflection will renew your strength and prepare you for the opportunities ahead.',
    ],
    'Tiger': [
      'Spring invites you to embrace fresh opportunities with confidence. Your courage and determination will help bold ideas grow into exciting new possibilities.',
      'Your natural enthusiasm shines brightly this season. Lead with kindness, inspire those around you, and enjoy the momentum your positive energy creates.',
      'A season to channel your strength with purpose. Thoughtful decisions and clear priorities will help you achieve meaningful and lasting success.',
      'Take time to pause and recharge your spirit. Quiet reflection will sharpen your instincts and prepare you for the exciting adventures ahead.',
    ],
    'Rabbit': [
      'A gentle season to welcome new beginnings and nurture meaningful relationships. Your kindness will help beautiful opportunities blossom naturally.',
      'Share your warmth with those around you. Joyful connections and thoughtful conversations will bring happiness and strengthen lasting friendships.',
      'A peaceful season to simplify your life and appreciate what truly matters. Small, thoughtful steps will create lasting balance and fulfillment.',
      'Embrace quiet moments to recharge your spirit. Your intuition will gently guide you toward clarity, peace, and renewed confidence.',
    ],
    'Dragon': [
      'A powerful season to pursue bold dreams and welcome new opportunities. Your vision and confidence will help meaningful ideas take flight.',
      'Your natural charisma shines brightly this season. Inspire others with your enthusiasm, embrace collaboration, and let your creativity flourish.',
      'A rewarding season to refine your goals and focus your energy wisely. Clear intentions today will create lasting success tomorrow.',
      'Pause to reflect on your journey and celebrate your growth. Quiet moments now will strengthen your wisdom and prepare you for exciting opportunities ahead.',
    ],
    'Snake': [
      'Welcome new beginnings with patience and quiet confidence. Your thoughtful nature will help promising opportunities grow at the perfect pace.',
      'Trust your instincts and let your inner light shine. Meaningful conversations and thoughtful choices will strengthen important relationships.',
      'A wonderful season to simplify your path and focus on what truly matters. Clear intentions will help transform your goals into lasting success.',
      'Embrace moments of stillness and trust your intuition. Quiet reflection will bring fresh perspective and prepare you for a fulfilling new chapter.',
    ],
    'Horse': [
      'Spring brings exciting opportunities to explore new paths. Trust your adventurous spirit and let your optimism guide meaningful new beginnings.',
      'Your vibrant energy shines this season. Embrace joyful experiences, strengthen meaningful connections, and let your enthusiasm inspire those around you.',
      'A wonderful season to focus your energy on what matters most. Steady progress and thoughtful choices will bring lasting rewards.',
      'Take time to slow your pace and appreciate your journey. Quiet reflection will restore your energy and prepare you for exciting adventures ahead.',
    ],
    'Goat': [
      'Spring encourages you to nurture your dreams with patience and creativity. Small, thoughtful steps will blossom into meaningful achievements.',
      'Share your kindness and creative spirit freely this season. Warm connections and joyful experiences will brighten both your life and those around you.',
      'Take time to simplify your priorities and trust your heart. A calm, balanced approach will help your goals flourish with confidence.',
      'Create space for quiet reflection and gentle renewal. Your inner wisdom will guide you toward peace, inspiration, and fresh possibilities.',
    ],
    'Monkey': [
      'Spring inspires fresh ideas and exciting discoveries. Your curiosity and creativity will open doors to meaningful opportunities and personal growth.',
      'Your enthusiasm is contagious this season. Share your talents, enjoy new experiences, and let your playful spirit strengthen meaningful connections.',
      'Focus your energy on the ideas that matter most. Thoughtful planning and steady effort will turn bright possibilities into lasting achievements.',
      'Take time to slow down and appreciate everything you\'ve learned. Reflection will spark fresh inspiration and prepare you for exciting adventures ahead.',
    ],
    'Rooster': [
      'Spring invites you to build new goals with confidence and care. Your thoughtful planning will help fresh opportunities grow into lasting accomplishments.',
      'Your positive energy inspires those around you. Celebrate your achievements, strengthen meaningful relationships, and let your confidence shine with kindness.',
      'This season rewards careful planning and steady progress. Focus on what truly matters, and your dedication will lead to meaningful results.',
      'Take time to appreciate everything you\'ve accomplished. Quiet reflection will renew your perspective and prepare you for an inspiring new season.',
    ],
    'Dog': [
      'Spring brings fresh opportunities to strengthen meaningful relationships and pursue heartfelt goals. Your loyalty and kindness will help wonderful new beginnings flourish.',
      'Share your warmth and encouragement freely this season. Genuine connections and acts of kindness will bring lasting joy to you and those around you.',
      'Focus on the people and priorities that matter most. Your steady support and thoughtful decisions will create harmony and lasting rewards.',
      'Take time to appreciate life\'s simple blessings and trust your inner wisdom. Quiet reflection will renew your spirit and strengthen your path forward.',
    ],
    'Pig': [
      'Spring encourages you to welcome new opportunities with an open heart. Your generosity and optimism will help beautiful beginnings flourish naturally.',
      'Celebrate life\'s joyful moments and share your warmth with others. Meaningful connections and simple pleasures will brighten your season.',
      'Take time to appreciate your accomplishments and focus on what truly brings you happiness. Gratitude will guide your next meaningful steps.',
      'Slow down, recharge, and embrace life\'s quiet moments. Reflection and gratitude will fill your heart with renewed hope for the year ahead.',
    ],
  };

  static const _seasonFallback = [
    'A wonderful season to explore fresh ideas and embrace new opportunities.',
    'A vibrant season to express yourself, strengthen relationships, and pursue what inspires you.',
    'A meaningful season to simplify, stay organized, and focus on what truly matters.',
    'A peaceful season for rest, reflection, and preparing for the opportunities ahead.',
  ];
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
            Text(month, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
            const SizedBox(height: 4),
            Text(element, style: GoogleFonts.quicksand(fontSize: 14, color: const Color(0xFF8B6914), fontWeight: FontWeight.w700, height: 1.3)),
            const SizedBox(height: 8),
            Text(forecast, style: GoogleFonts.quicksand(fontSize: 17, color: const Color(0xFF1A1A1A), height: 1.65)),
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
          SizedBox(width: 120, child: Text(element, style: GoogleFonts.quicksand(fontSize: 17, color: ChiGlowTheme.deepRed, fontWeight: FontWeight.w600))),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: value / 100,
                minHeight: 10,
                backgroundColor: ChiGlowTheme.richRed.withValues(alpha: 0.12),
                valueColor: AlwaysStoppedAnimation<Color>(
                  value > 70 ? ChiGlowTheme.richRed : value > 40 ? ChiGlowTheme.bronzeGold : Colors.orange,
                ),
              ),
            ),
          ),
          SizedBox(width: 44, child: Text('$value%', textAlign: TextAlign.right,
            style: GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.w700, color: ChiGlowTheme.deepRed))),
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