import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';
import '../widgets/global_header.dart';

class KoiAffirmationsScreen extends StatefulWidget {
  const KoiAffirmationsScreen({super.key});

  @override
  State<KoiAffirmationsScreen> createState() => _KoiAffirmationsScreenState();
}

class _KoiAffirmationsScreenState extends State<KoiAffirmationsScreen> {
  int? _selectedKoiIndex;

  static const List<Map<String, dynamic>> _koiFish = [
    {
      'name': 'Sakura',
      'emoji': '🌸',
      'icon': '🎴',
      'area': 'Love & Relationships',
      'color': 0xFFFF6B8A,
      'affirmations': [
        'I attract loving and harmonious relationships into my life.',
        'My heart is open to giving and receiving love.',
        'I am surrounded by warmth, kindness, and compassion.',
      ],
    },
    {
      'name': 'Kin',
      'emoji': '🐟',
      'icon': '💰',
      'area': 'Wealth & Abundance',
      'color': 0xFFD4A34A,
      'affirmations': [
        'Abundance flows freely into my life from all directions.',
        'I am a magnet for prosperity and success.',
        'Every day brings new opportunities for wealth.',
      ],
    },
    {
      'name': 'Midori',
      'emoji': '🍃',
      'icon': '🌿',
      'area': 'Health & Vitality',
      'color': 0xFF6B9B6B,
      'affirmations': [
        'My body is healthy, vibrant, and full of energy.',
        'I nurture my well-being with every choice I make.',
        'Healing energy flows through every cell of my being.',
      ],
    },
    {
      'name': 'Sora',
      'emoji': '🌊',
      'icon': '🧭',
      'area': 'Career & Life Path',
      'color': 0xFF5B9BD5,
      'affirmations': [
        'I am guided toward my true purpose every day.',
        'My career path is filled with success and fulfillment.',
        'I confidently pursue my dreams and goals.',
      ],
    },
    {
      'name': 'Hikari',
      'emoji': '✨',
      'icon': '🌟',
      'area': 'Personal Growth',
      'color': 0xFF9B7BB5,
      'affirmations': [
        'I grow stronger and wiser with every experience.',
        'My inner light shines brightly for all to see.',
        'I embrace change and transformation with grace.',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const GlobalHeader(title: 'Koi Affirmations', subtitle: 'Wisdom from the sacred koi'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            const SizedBox(height: 14),

            // Koi fish cards
            ...List.generate(_koiFish.length, (index) {
              final koi = _koiFish[index];
              final isSelected = _selectedKoiIndex == index;

              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedKoiIndex = isSelected ? null : index;
                    });
                  },
                  child: GlowCard(
                    glowColor: Color(koi['color'] as int),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Color(koi['color'] as int),
                                    Color(koi['color'] as int).withValues(alpha: 0.6),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(koi['color'] as int).withValues(alpha: 0.3),
                                    blurRadius: 12,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(koi['emoji'] as String, style: const TextStyle(fontSize: 36)),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    koi['name'] as String,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: ChiGlowTheme.richRed,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    children: [
                                      Text(
                                        koi['icon'] as String,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      const SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          koi['area'] as String,
                                          style: GoogleFonts.quicksand(
                                            fontSize: 13,
                                            color: ChiGlowTheme.deepRed.withValues(alpha: 0.6),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              isSelected ? Icons.expand_less : Icons.expand_more,
                              color: ChiGlowTheme.richRed.withValues(alpha: 0.5),
                            ),
                          ],
                        ),

                        if (isSelected) ...[
                          const SizedBox(height: 16),
                          Divider(color: ChiGlowTheme.richRed.withValues(alpha: 0.1)),
                          const SizedBox(height: 12),
                          ...List.generate(
                            (koi['affirmations'] as List<String>).length,
                            (i) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(koi['color'] as int),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      (koi['affirmations'] as List<String>)[i],
                                      style: GoogleFonts.playfairDisplay(
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic,
                                        color: ChiGlowTheme.deepRed,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            }),
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