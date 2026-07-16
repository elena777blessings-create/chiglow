import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';
import '../widgets/global_header.dart';
import '../providers/app_state_provider.dart';

class EnergyDashboardScreen extends StatelessWidget {
  const EnergyDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppStateProvider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const GlobalHeader(title: 'Energy Dashboard', subtitle: 'Your Chi balance at a glance'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            // Overall energy
            Center(
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const SweepGradient(
                    colors: [
                      ChiGlowTheme.richRed,
                      ChiGlowTheme.bronzeGold,
                      ChiGlowTheme.softRed,
                      ChiGlowTheme.bronzeGold,
                      ChiGlowTheme.richRed,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(color: ChiGlowTheme.richRed.withValues(alpha: 0.3), blurRadius: 30, spreadRadius: 5),
                  ],
                ),
                child: Center(
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFF8E7),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${_overallScore(provider)}%',
                          style: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.w700, color: ChiGlowTheme.richRed),
                        ),
                        Text(
                          'Harmony',
                          style: GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.w700, color: ChiGlowTheme.bronzeGold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Energy areas
            Text(
              '🪷 Energy Areas',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
            ),
            const SizedBox(height: 4),
            Text(
              'Derived from your Five Element balance',
              style: GoogleFonts.quicksand(fontSize: 15, color: ChiGlowTheme.bronzeGold, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            _EnergyAreaCard(
              emoji: '💖',
              name: 'Love',
              value: provider.loveScore,
              description: 'Relationships, partnership, self-love',
              color: Colors.pink,
              tips: ['Add pink or red in the southwest', 'Place pairs of objects together', 'Keep bedroom clutter-free'],
            ),
            const SizedBox(height: 12),
            _EnergyAreaCard(
              emoji: '💰',
              name: 'Wealth',
              value: provider.wealthScore,
              description: 'Abundance, prosperity, career growth',
              color: ChiGlowTheme.bronzeGold,
              tips: ['Activate southeast corner', 'Add purple or green accents', 'Keep your kitchen clean'],
            ),
            const SizedBox(height: 12),
            _EnergyAreaCard(
              emoji: '🌿',
              name: 'Health',
              value: provider.healthScore,
              description: 'Wellness, vitality, family harmony',
              color: ChiGlowTheme.richRed,
              tips: ['Keep center of home open', 'Add plants in east area', 'Use natural materials'],
            ),
            const SizedBox(height: 12),
            _EnergyAreaCard(
              emoji: '🧭',
              name: 'Career',
              value: provider.careerScore,
              description: 'Life path, purpose, professional growth',
              color: ChiGlowTheme.bronzeGold,
              tips: ['Enhance north area with water', 'Display career inspirations', 'Keep entryway welcoming'],
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

  int _overallScore(AppStateProvider provider) {
    return provider.overallHarmony;
  }
}

class _EnergyAreaCard extends StatelessWidget {
  final String emoji;
  final String name;
  final int value;
  final String description;
  final Color color;
  final List<String> tips;

  const _EnergyAreaCard({
    required this.emoji,
    required this.name,
    required this.value,
    required this.description,
    required this.color,
    required this.tips,
  });

  @override
  Widget build(BuildContext context) {
    return GlowCard(
      glowColor: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 36)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
                    Text(description, style: GoogleFonts.quicksand(fontSize: 14, color: ChiGlowTheme.bronzeGold, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              Text(
                '$value%',
                style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: color),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: value / 100,
              minHeight: 8,
              backgroundColor: color.withValues(alpha: 0.1),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Tips to improve:',
            style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
          ),
          const SizedBox(height: 4),
          ...tips.map((tip) => Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('• ', style: GoogleFonts.quicksand(fontSize: 14, fontWeight: FontWeight.w700, color: const Color(0xFF2E7D32))),
                Expanded(
                  child: Text(tip, style: GoogleFonts.quicksand(fontSize: 14, fontWeight: FontWeight.w700, color: const Color(0xFF2E7D32))),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}