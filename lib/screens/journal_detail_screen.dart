import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../models/energy_models.dart';
import '../widgets/glow_card.dart';
import '../widgets/global_header.dart';
import '../widgets/home_button.dart';

class JournalDetailScreen extends StatelessWidget {
  final JournalEntry entry;

  const JournalDetailScreen({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChiGlowTheme.creamWhite,
      body: SafeArea(
        child: Column(
          children: [
            const GlobalHeader(title: 'Scan Report', subtitle: 'Full Feng Shui analysis'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 14),
              // Date & time
              GlowCard(
                child: Row(
                  children: [
                    const Text('📅', style: TextStyle(fontSize: 24)),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Scanned on ${_formatDate(entry.scanDate)}',
                          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
                        ),
                        Text(
                          '${entry.scanDate.hour}:${entry.scanDate.minute.toString().padLeft(2, '0')}',
                          style: GoogleFonts.quicksand(fontSize: 12, color: ChiGlowTheme.mediumGray),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: entry.energyScore.contains('Harmonious') ? Colors.green.withValues(alpha: 0.1) : ChiGlowTheme.bronzeGold.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        entry.energyScore,
                        style: GoogleFonts.quicksand(fontSize: 12, fontWeight: FontWeight.w600, color: entry.energyScore.contains('Harmonious') ? Colors.green : ChiGlowTheme.bronzeGold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Overall analysis
              Text('🪷 Overall Analysis', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
              const SizedBox(height: 8),
              GlowCard(
                child: Text(
                  entry.overallDescription,
                  style: GoogleFonts.quicksand(fontSize: 14, color: ChiGlowTheme.mediumGray, height: 1.6),
                ),
              ),
              const SizedBox(height: 24),
              // Feng Shui Recommendations
              Text('✨ Feng Shui Recommendations', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
              const SizedBox(height: 12),
              ...entry.tips.map((tip) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GlowCard(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tip['icon'] ?? '💡', style: const TextStyle(fontSize: 36)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(tip['title'] ?? '', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
                            const SizedBox(height: 4),
                            Text(tip['description'] ?? '', style: GoogleFonts.quicksand(fontSize: 13, color: ChiGlowTheme.mediumGray, height: 1.5)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              // Suggested Colors
              if (entry.suggestedColors.isNotEmpty) ...[
                const SizedBox(height: 20),
                Text('🎨 Suggested Colors', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
                const SizedBox(height: 8),
                GlowCard(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: entry.suggestedColors.map((c) => Chip(
                      label: Text(c, style: GoogleFonts.quicksand(fontSize: 12)),
                      backgroundColor: ChiGlowTheme.richRed.withValues(alpha: 0.06),
                      side: BorderSide.none,
                    )).toList(),
                  ),
                ),
              ],
              // Recommended Directions
              if (entry.recommendedDirections.isNotEmpty) ...[
                const SizedBox(height: 20),
                Text('🧭 Recommended Directions', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
                const SizedBox(height: 8),
                GlowCard(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: entry.recommendedDirections.map((d) => Chip(
                      label: Text(d, style: GoogleFonts.quicksand(fontSize: 12)),
                      backgroundColor: ChiGlowTheme.bronzeGold.withValues(alpha: 0.1),
                      side: BorderSide.none,
                    )).toList(),
                  ),
                ),
              ],
              // AI Observations
              if (entry.aiObservations.isNotEmpty) ...[
                const SizedBox(height: 20),
                Text('🔍 AI Observations', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
                const SizedBox(height: 8),
                GlowCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: entry.aiObservations.map((obs) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• ', style: TextStyle(fontSize: 13)),
                          Expanded(child: Text(obs, style: GoogleFonts.quicksand(fontSize: 13, color: ChiGlowTheme.mediumGray, height: 1.5))),
                        ],
                      ),
                    )).toList(),
                  ),
                ),
              ],
              const SizedBox(height: 32),
              // Delete button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => _confirmDelete(context),
                  icon: const Icon(Icons.delete_outline, size: 18),
                  label: Text('Delete Entry', style: GoogleFonts.poppins(fontSize: 14)),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: ChiGlowTheme.mediumGray,
                    side: BorderSide(color: ChiGlowTheme.mediumGray.withValues(alpha: 0.3)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 8),
              const HomeButton(),
            ],
          ),
        ),
          ),
        ],
      ),
    ),
    );
  }

  String _formatDate(DateTime dt) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Delete Entry', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
        content: Text('Remove this scan from your journal?', style: GoogleFonts.quicksand(fontSize: 14, color: ChiGlowTheme.mediumGray)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Cancel', style: GoogleFonts.quicksand(fontSize: 16, color: ChiGlowTheme.bronzeGold))),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: Text('Delete', style: GoogleFonts.quicksand(fontSize: 16, color: ChiGlowTheme.richRed)),
          ),
        ],
      ),
    );
  }
}