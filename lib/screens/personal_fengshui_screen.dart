import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../providers/app_state_provider.dart';
import '../widgets/glow_card.dart';

class PersonalFengShuiScreen extends StatelessWidget {
  const PersonalFengShuiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppStateProvider>();
    final reading = provider.kuaReading;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Personal Feng Shui', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: ChiGlowTheme.luckyRed,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kua Header
            Center(
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [ChiGlowTheme.luckyRed, ChiGlowTheme.warmGold],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ChiGlowTheme.luckyRed.withValues(alpha: 0.3),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '${reading['kua']}',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Kua ${reading['kua']} · ${reading['element']} · ${reading['group']}',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ChiGlowTheme.luckyRed,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your personal Feng Shui directions calculated from your birth year and gender.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      fontSize: 13,
                      color: ChiGlowTheme.deepRed.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Lucky Directions
            Text(
              '🟢 Your Lucky Directions',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.luckyRed),
            ),
            const SizedBox(height: 12),
            ...List.generate((reading['lucky'] as List).length, (i) {
              final dir = (reading['lucky'] as List)[i];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: GlowCard(
                  glowColor: ChiGlowTheme.warmGold,
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ChiGlowTheme.warmGold.withValues(alpha: 0.15),
                        ),
                        child: Center(child: Text(dir['emoji'], style: const TextStyle(fontSize: 22))),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(dir['name'], style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: ChiGlowTheme.luckyRed)),
                            const SizedBox(height: 2),
                            Text('Face ${dir['direction']} for best results', style: GoogleFonts.quicksand(fontSize: 12, color: ChiGlowTheme.warmGold)),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: ChiGlowTheme.warmGold.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(dir['direction'], style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: ChiGlowTheme.deepRed)),
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 24),

            // Unlucky Directions
            Text(
              '🔴 Directions to Avoid',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.luckyRed),
            ),
            const SizedBox(height: 12),
            ...List.generate((reading['unlucky'] as List).length, (i) {
              final dir = (reading['unlucky'] as List)[i];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: GlowCard(
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red.withValues(alpha: 0.1),
                        ),
                        child: Center(child: Text(dir['emoji'], style: const TextStyle(fontSize: 22))),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(dir['name'], style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: ChiGlowTheme.deepRed)),
                            const SizedBox(height: 2),
                            Text('Avoid facing ${dir['direction']}', style: GoogleFonts.quicksand(fontSize: 12, color: ChiGlowTheme.deepRed.withValues(alpha: 0.6))),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.red.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(dir['direction'], style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: ChiGlowTheme.deepRed)),
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 24),

            // Tips
            GlowCard(
              glowColor: ChiGlowTheme.warmGold,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lightbulb_outline, size: 18, color: ChiGlowTheme.warmGold),
                      const SizedBox(width: 8),
                      Text('How to Use This', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.luckyRed)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _TipText('Position your bed, desk, and stove facing one of your LUCKY directions for positive energy.'),
                  _TipText('Try to avoid facing your UNLUCKY directions when sleeping, working, or cooking.'),
                  _TipText('Use the Feng Shui Compass screen to find these directions in your home.'),
                  _TipText('Your Kua number stays the same for life — set it once and use it daily.'),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _TipText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ChiGlowTheme.warmGold,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: GoogleFonts.quicksand(fontSize: 13, color: ChiGlowTheme.deepRed.withValues(alpha: 0.8), height: 1.4)),
          ),
        ],
      ),
    );
  }
}