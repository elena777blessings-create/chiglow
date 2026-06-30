import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';
import '../widgets/page_header.dart';
import '../services/content_service.dart';

class ColorCoachingScreen extends StatelessWidget {
  const ColorCoachingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(title: 'Color Coaching', subtitle: 'Discover colors that support your goals', titleSize: 26),
            // Intro
            GlowCard(
              glowColor: ChiGlowTheme.bronzeGold,
              child: Row(
                children: [
                  const Text('🎨', style: TextStyle(fontSize: 36)),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Color is Energy',
                          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Each color carries a unique vibration that can transform the energy of your space.',
                          style: GoogleFonts.quicksand(fontSize: 13, color: ChiGlowTheme.bronzeGold, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Colors by Intention',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
            ),
            const SizedBox(height: 12),
            ...ContentService.colorGuidance.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _ColorCard(
                goal: item['goal']!,
                color: item['color']!,
                hex: item['hex']!,
                element: item['element']!,
                tip: item['tip']!,
              ),
            )),
            const SizedBox(height: 24),
            // Color wheel guidance
            Text(
              '🎯 Quick Reference',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
            ),
            const SizedBox(height: 12),
            GlowCard(
              child: Column(
                children: [
                  _QuickRef(color: '🟢', name: 'Green', use: 'Health, Family, Growth', hex: '#4CAF50'),
                  _QuickRef(color: '🔵', name: 'Blue', use: 'Career, Calm, Wisdom', hex: '#5B9BD5'),
                  _QuickRef(color: '🟡', name: 'Yellow/Gold', use: 'Center, Grounding, Joy', hex: '#FFD700'),
                  _QuickRef(color: '🔴', name: 'Red', use: 'Fame, Passion, Energy', hex: '#F44336'),
                  _QuickRef(color: '🟣', name: 'Purple', use: 'Wealth, Spirituality', hex: '#9C27B0'),
                  _QuickRef(color: '⚪', name: 'White', use: 'Purity, New Beginnings', hex: '#FFFFFF'),
                  _QuickRef(color: '🟤', name: 'Brown/Earth', use: 'Stability, Nourishment', hex: '#795548'),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _ColorCard extends StatelessWidget {
  final String goal;
  final String color;
  final String hex;
  final String element;
  final String tip;

  const _ColorCard({
    required this.goal,
    required this.color,
    required this.hex,
    required this.element,
    required this.tip,
  });

  @override
  Widget build(BuildContext context) {
    final colorValue = Color(int.parse(hex.replaceFirst('#', '0xFF')));

    return GlowCard(
      glowColor: colorValue,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: colorValue,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: colorValue.withValues(alpha: 0.4), blurRadius: 8),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(goal, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
                const SizedBox(height: 2),
                Text('$color · Element: $element', style: GoogleFonts.quicksand(fontSize: 12, color: ChiGlowTheme.bronzeGold)),
                const SizedBox(height: 4),
                Text(tip, style: GoogleFonts.quicksand(fontSize: 12, color: const Color(0xFF546E7A), height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickRef extends StatelessWidget {
  final String color;
  final String name;
  final String use;
  final String hex;

  const _QuickRef({required this.color, required this.name, required this.use, required this.hex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(color, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 8),
          SizedBox(
            width: 60,
            child: Text(name, style: GoogleFonts.quicksand(fontSize: 12, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
          ),
          SizedBox(
            width: 140,
            child: Text(use, style: GoogleFonts.quicksand(fontSize: 11, color: ChiGlowTheme.bronzeGold)),
          ),
        ],
      ),
    );
  }
}