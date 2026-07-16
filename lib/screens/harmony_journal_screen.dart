import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../services/journal_storage.dart';
import '../services/content_service.dart';
import '../models/energy_models.dart';
import '../widgets/glow_card.dart';
import '../widgets/global_header.dart';
import '../widgets/home_button.dart';

class HarmonyJournalScreen extends StatefulWidget {
  const HarmonyJournalScreen({super.key});

  @override
  State<HarmonyJournalScreen> createState() => _HarmonyJournalScreenState();
}

class _HarmonyJournalScreenState extends State<HarmonyJournalScreen> {
  List<JournalEntry> _entries = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final entries = await JournalStorage.loadEntries();
    if (mounted) {
      setState(() {
        _entries = entries;
        _loading = false;
      });
    }
  }

  Future<void> _deleteEntry(String id) async {
    await JournalStorage.deleteEntry(id);
    _load();
  }

  String _formatDate(DateTime dt) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChiGlowTheme.creamWhite,
      body: SafeArea(
        child: Column(
          children: [
            const GlobalHeader(title: 'Harmony Journal', subtitle: 'Your scan history & insights'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 14),
              if (_loading)
                const Center(child: CircularProgressIndicator(color: ChiGlowTheme.richRed))
              else if (_entries.isEmpty)
                _buildEmptyState()
              else
                ..._entries.map((entry) => _buildEntryCard(entry)),
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

  Widget _buildEmptyState() {
    return GlowCard(
      glowColor: ChiGlowTheme.bronzeGold,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            const Text('📖', style: TextStyle(fontSize: 52)),
            const SizedBox(height: 16),
            Text(
              'Your journal is empty',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: ChiGlowTheme.richRed,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Scan your first room to begin recording your Feng Shui journey.',
                textAlign: TextAlign.center,
                style: GoogleFonts.quicksand(
                  fontSize: 14,
                  color: ChiGlowTheme.mediumGray,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/scan-guide'),
              style: ElevatedButton.styleFrom(
                backgroundColor: ChiGlowTheme.richRed,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
              ),
              child: Text('Scan Your Space', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 8),
            const HomeButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildEntryCard(JournalEntry entry) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GlowCard(
        glowColor: ChiGlowTheme.bronzeGold,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: ChiGlowTheme.richRed.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      ContentService.tipsForRoom(entry.roomType).isNotEmpty
                          ? (ContentService.tipsForRoom(entry.roomType).first['icon'] ?? '🏠')
                          : '🏠',
                      style: const TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.roomType,
                        style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
                      ),
                      Text(
                        _formatDate(entry.scanDate),
                        style: GoogleFonts.quicksand(fontSize: 12, color: ChiGlowTheme.mediumGray),
                      ),
                    ],
                  ),
                ),
                // Energy badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: entry.energyScore.contains('Harmonious')
                        ? Colors.green.withValues(alpha: 0.1)
                        : ChiGlowTheme.bronzeGold.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    entry.energyScore,
                    style: GoogleFonts.quicksand(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: entry.energyScore.contains('Harmonious')
                          ? Colors.green
                          : ChiGlowTheme.bronzeGold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Description
            Text(
              entry.overallDescription,
              style: GoogleFonts.quicksand(fontSize: 13, color: ChiGlowTheme.mediumGray, height: 1.5),
            ),
            const SizedBox(height: 12),
            // Tips preview
            if (entry.tips.isNotEmpty) ...[
              Text(
                '✨ ${entry.tips.first['title'] ?? 'Feng Shui Tip'}',
                style: GoogleFonts.quicksand(fontSize: 13, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
              ),
              const SizedBox(height: 4),
              Text(
                entry.tips.first['description'] ?? '',
                style: GoogleFonts.quicksand(fontSize: 12, color: ChiGlowTheme.mediumGray, height: 1.4),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            const SizedBox(height: 12),
            // Expandable details
            ExpansionTile(
              tilePadding: EdgeInsets.zero,
              childrenPadding: EdgeInsets.zero,
              title: Text(
                'View full analysis',
                style: GoogleFonts.quicksand(fontSize: 12, fontWeight: FontWeight.w600, color: ChiGlowTheme.bronzeGold),
              ),
              children: [
                const SizedBox(height: 8),
                // Colors
                if (entry.suggestedColors.isNotEmpty) ...[
                  _detailRow('🎨 Colors', entry.suggestedColors.join(', ')),
                  const SizedBox(height: 4),
                ],
                // Directions
                if (entry.recommendedDirections.isNotEmpty) ...[
                  _detailRow('🧭 Directions', entry.recommendedDirections.join(', ')),
                  const SizedBox(height: 4),
                ],
                // AI Observations
                if (entry.aiObservations.isNotEmpty) ...[
                  const Text(
                    '🔍 AI Observations',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  ...entry.aiObservations.map((obs) => Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      '• $obs',
                      style: GoogleFonts.quicksand(fontSize: 12, color: ChiGlowTheme.mediumGray, height: 1.4),
                    ),
                  )),
                  const SizedBox(height: 4),
                ],
                // All tips
                for (int i = 1; i < entry.tips.length; i++) ...[
                  _detailRow(
                    entry.tips[i]['icon'] ?? '💡',
                    '${entry.tips[i]['title'] ?? ''}: ${entry.tips[i]['description'] ?? ''}',
                  ),
                  const SizedBox(height: 4),
                ],
              ],
            ),
            // Delete button
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.delete_outline, size: 18, color: ChiGlowTheme.mediumGray),
                onPressed: () => _deleteEntry(entry.id),
                tooltip: 'Delete entry',
                visualDensity: VisualDensity.compact,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label  ', style: GoogleFonts.quicksand(fontSize: 12, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
        Expanded(
          child: Text(value, style: GoogleFonts.quicksand(fontSize: 12, color: ChiGlowTheme.mediumGray, height: 1.4)),
        ),
      ],
    );
  }
}