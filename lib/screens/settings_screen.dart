import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';
import '../providers/app_state_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppStateProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: ChiGlowTheme.luckyRed,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile section
            Text(
              '👤 Profile',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.luckyRed),
            ),
            const SizedBox(height: 12),
            GlowCard(
              child: Column(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [ChiGlowTheme.luckyRed, ChiGlowTheme.warmGold],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        provider.userName.isNotEmpty ? provider.userName[0].toUpperCase() : '🜁',
                        style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    provider.userName.isNotEmpty ? provider.userName : 'Set Your Name',
                    style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.luckyRed),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Zodiac: ${provider.zodiacSign}',
                    style: GoogleFonts.quicksand(fontSize: 14, color: ChiGlowTheme.warmGold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Settings options
            Text(
              '⚙️ Preferences',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.luckyRed),
            ),
            const SizedBox(height: 12),
            _SettingTile(
              icon: '🐉',
              title: 'Zodiac Sign',
              subtitle: provider.zodiacSign,
              onTap: () => _showZodiacPicker(context, provider),
            ),
            _SettingTile(
              icon: '📅',
              title: 'Birth Year',
              subtitle: provider.birthYear.toString(),
              onTap: () => _showYearPicker(context, provider),
            ),
            _SettingTile(
              icon: '🔔',
              title: 'Daily Reminders',
              subtitle: 'Morning affirmations',
              trailing: Switch(
                value: true,
                onChanged: (v) {},
                activeColor: ChiGlowTheme.luckyRed,
              ),
            ),
            _SettingTile(
              icon: '🌙',
              title: 'Dark Mode',
              subtitle: 'Coming soon',
              trailing: Switch(
                value: false,
                onChanged: (v) {},
                activeColor: ChiGlowTheme.luckyRed,
              ),
            ),
            const SizedBox(height: 24),
            // About section
            Text(
              'ℹ️ About',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.luckyRed),
            ),
            const SizedBox(height: 12),
            GlowCard(
              child: Column(
                children: [
                  _AboutRow(label: 'Version', value: '1.0.0'),
                  const Divider(height: 24),
                  _AboutRow(label: 'App', value: 'ChiGlow'),
                  const Divider(height: 24),
                  _AboutRow(label: 'Tagline', value: 'Feng Shui your life. Glow from your space out.'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Reset
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.refresh, size: 18),
                label: Text('Reset All Data', style: GoogleFonts.poppins(fontSize: 14)),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red[400],
                  side: BorderSide(color: Colors.red[200]!),
                  padding: const EdgeInsets.symmetric(vertical: 14),
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

  void _showZodiacPicker(BuildContext context, AppStateProvider provider) {
    const signs = ['Rat', 'Ox', 'Tiger', 'Rabbit', 'Dragon', 'Snake', 'Horse', 'Goat', 'Monkey', 'Rooster', 'Dog', 'Pig'];
    showModalBottomSheet(
      context: context,
      backgroundColor: ChiGlowTheme.creamWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Choose Your Zodiac Sign', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.luckyRed)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: signs.map((sign) => GestureDetector(
                onTap: () {
                  provider.setZodiacSign(sign);
                  Navigator.pop(ctx);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: provider.zodiacSign == sign ? ChiGlowTheme.luckyRed : ChiGlowTheme.luckyRed.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(sign, style: GoogleFonts.quicksand(
                    fontSize: 14, fontWeight: FontWeight.w600,
                    color: provider.zodiacSign == sign ? Colors.white : ChiGlowTheme.luckyRed,
                  )),
                ),
              )).toList(),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showYearPicker(BuildContext context, AppStateProvider provider) {
    showModalBottomSheet(
      context: context,
      backgroundColor: ChiGlowTheme.creamWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => SizedBox(
        height: 300,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Select Birth Year', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.luckyRed)),
            ),
            Expanded(
              child: ListWheelScrollView(
                itemExtent: 40,
                diameterRatio: 1.5,
                children: List.generate(80, (i) {
                  final year = 2026 - i;
                  return Center(
                    child: Text(
                      '$year',
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: year == provider.birthYear ? ChiGlowTheme.luckyRed : ChiGlowTheme.warmGold,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Widget? trailing;

  const _SettingTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GlowCard(
        onTap: onTap,
        child: Row(
          children: [
            Text(icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: ChiGlowTheme.luckyRed)),
                  Text(subtitle, style: GoogleFonts.quicksand(fontSize: 12, color: ChiGlowTheme.warmGold)),
                ],
              ),
            ),
            trailing ?? Icon(Icons.chevron_right, color: ChiGlowTheme.luckyRed.withValues(alpha: 0.4)),
          ],
        ),
      ),
    );
  }
}

class _AboutRow extends StatelessWidget {
  final String label;
  final String value;

  const _AboutRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: GoogleFonts.quicksand(fontSize: 13, color: ChiGlowTheme.luckyRed)),
        Text(value, style: GoogleFonts.quicksand(fontSize: 13, color: const Color(0xFF546E7A))),
      ],
    );
  }
}