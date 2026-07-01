import 'package:flutter/material.dart';
import '../widgets/global_header.dart';
import '../widgets/global_header.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../services/content_service.dart';
import '../widgets/glow_card.dart';

class KoiAffirmationsScreen extends StatefulWidget {
  const KoiAffirmationsScreen({super.key});

  @override
  State<KoiAffirmationsScreen> createState() => _KoiAffirmationsScreenState();
}

class _KoiAffirmationsScreenState extends State<KoiAffirmationsScreen> {
  int? _selectedKoiIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Koi Affirmations', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: ChiGlowTheme.luckyRed,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const GlobalHeader(title: 'Koi Affirmations', subtitle: 'Wisdom from the pond'),
            const SizedBox(height: 8),
                    style: GoogleFonts.quicksand(
                      fontSize: 14,
                      color: ChiGlowTheme.deepRed.withValues(alpha: 0.7),
                      height: 1.4,
                    ),
                  ),
            const SizedBox(height: 24),

            // Koi fish cards
            ...List.generate(ContentService.koiFish.length, (index) {
              final koi = ContentService.koiFish[index];
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
                        // Koi header
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
                                child: Text(koi['emoji'] as String, style: const TextStyle(fontSize: 28)),
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
                                      color: ChiGlowTheme.luckyRed,
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
                              color: ChiGlowTheme.luckyRed.withValues(alpha: 0.5),
                            ),
                          ],
                        ),

                        // Expanded affirmations
                        if (isSelected) ...[
                          const SizedBox(height: 16),
                          Divider(color: ChiGlowTheme.luckyRed.withValues(alpha: 0.1)),
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
    );
  }
}
