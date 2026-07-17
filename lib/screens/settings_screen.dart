import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';
import '../providers/app_state_provider.dart';
import '../widgets/global_header.dart';
import '../widgets/home_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppStateProvider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const GlobalHeader(title: 'Settings'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            // Profile section
            Text(
              '🪷 Profile',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
            ),
            const SizedBox(height: 12),
            GlowCard(
              onTap: () => _showNameDialog(context, provider),
              child: Column(
                children: [
                  // Zodiac animal artwork in circular frame
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ChiGlowTheme.bronzeGold,
                        width: 2.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.2),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Transform.scale(
                        scale: 1.1,
                        child: Image.asset(
                          'assets/images/year_cover_${provider.zodiacSign.toLowerCase()}.webp',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: ChiGlowTheme.richRed.withValues(alpha: 0.1),
                            child: Center(
                              child: Text(
                                provider.zodiacSign[0],
                                style: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w700, color: ChiGlowTheme.richRed),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    provider.userName.isNotEmpty ? provider.userName : 'Tap to add your name',
                    style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    provider.zodiacSign,
                    style: GoogleFonts.quicksand(fontSize: 17, fontWeight: FontWeight.w700, color: ChiGlowTheme.bronzeGold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Personalize section
            Text(
              '🪷 Personalize',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
            ),
            const SizedBox(height: 12),
            _SettingTile(
              icon: '✏️',
              title: 'Edit Profile',
              subtitle: 'Update your name and details',
              onTap: () => _showNameDialog(context, provider),
            ),
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
                value: provider.dailyReminders,
                onChanged: (v) => provider.setDailyReminders(v),
                activeColor: ChiGlowTheme.richRed,
              ),
            ),
            _SettingTile(
              icon: '🌙',
              title: 'Appearance',
              subtitle: provider.darkMode ? 'Dark' : 'Light',
              trailing: Switch(
                value: provider.darkMode,
                onChanged: (v) => provider.setDarkMode(v),
                activeColor: ChiGlowTheme.richRed,
              ),
            ),
            const SizedBox(height: 24),
            // Premium section
            Text(
              '💎 ChiGlow Premium',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/upgrade'),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ChiGlowTheme.richRed.withValues(alpha: 0.08),
                      ChiGlowTheme.bronzeGold.withValues(alpha: 0.08),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.3),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: ChiGlowTheme.richRed.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text('💎', style: TextStyle(fontSize: 36)),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ChiGlow Premium',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: ChiGlowTheme.richRed,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Unlimited scans, full zodiac & more',
                            style: GoogleFonts.quicksand(
                              fontSize: 14,
                              color: ChiGlowTheme.deepRed,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [ChiGlowTheme.richRed, ChiGlowTheme.softRed],
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        'LIFETIME \$49',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // About section
            Text(
              'ℹ️ About ChiGlow',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
            ),
            const SizedBox(height: 12),
            GlowCard(
              child: Column(
                children: [
                  _AboutRow(label: 'Version', value: '1.0.0'),
                  const Divider(height: 24),
                  _AboutRow(label: 'App', value: 'ChiGlow'),
                  const Divider(height: 24),
                  _AboutRow(label: 'Tagline', value: 'Feng Shui Your Life'),
                  const SizedBox(height: 4),
                  _AboutRow(label: '', value: 'Glow Starts at Home'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Reset — visually separated at bottom
            const Divider(height: 1),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => _showResetConfirmation(context, provider),
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

  void _showNameDialog(BuildContext context, AppStateProvider provider) {
    final controller = TextEditingController(text: provider.userName);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: ChiGlowTheme.creamWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('Edit Your Name', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter your name',
            hintStyle: GoogleFonts.quicksand(color: ChiGlowTheme.bronzeGold),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: ChiGlowTheme.richRed),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Cancel', style: GoogleFonts.quicksand(color: ChiGlowTheme.bronzeGold)),
          ),
          TextButton(
            onPressed: () {
              provider.setUserName(controller.text.trim());
              Navigator.pop(ctx);
            },
            child: Text('Save', style: GoogleFonts.quicksand(color: ChiGlowTheme.richRed, fontWeight: FontWeight.w600)),
          ),
        ],
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
            Text('Choose Your Zodiac Sign', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
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
                    color: provider.zodiacSign == sign ? ChiGlowTheme.richRed : ChiGlowTheme.richRed.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(sign, style: GoogleFonts.quicksand(
                    fontSize: 14, fontWeight: FontWeight.w600,
                    color: provider.zodiacSign == sign ? Colors.white : ChiGlowTheme.richRed,
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
    final currentYear = DateTime.now().year;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: ChiGlowTheme.creamWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => SizedBox(
        height: 420,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text('Select Birth Year', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
            const SizedBox(height: 12),
            Expanded(
              child: ListWheelScrollView(
                itemExtent: 44,
                diameterRatio: 1.5,
                useMagnifier: true,
                onSelectedItemChanged: (index) {
                  final year = currentYear - index;
                  provider.setZodiacSign(_getZodiacForYear(year));
                  provider.setBirthYear(year);
                },
                children: List.generate(100, (i) {
                  final year = currentYear - i;
                  final isSelected = year == provider.birthYear;
                  return GestureDetector(
                    onTap: () {
                      provider.setZodiacSign(_getZodiacForYear(year));
                      provider.setBirthYear(year);
                      Navigator.pop(ctx);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        '$year',
                        style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: isSelected ? ChiGlowTheme.richRed : ChiGlowTheme.bronzeGold,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(ctx),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ChiGlowTheme.richRed,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    elevation: 0,
                  ),
                  child: Text('Done', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void _showResetConfirmation(BuildContext context, AppStateProvider provider) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: ChiGlowTheme.creamWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('Reset All Data?', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.red)),
        content: Text('This will clear all your profile data, scanned rooms, and preferences. This action cannot be undone.',
          style: GoogleFonts.quicksand(fontSize: 13, color: ChiGlowTheme.charcoal, height: 1.5)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Cancel', style: GoogleFonts.quicksand(color: ChiGlowTheme.bronzeGold)),
          ),
          TextButton(
            onPressed: () {
              // Reset logic
              provider.setUserName('');
              Navigator.pop(ctx);
            },
            child: Text('Reset', style: GoogleFonts.quicksand(color: Colors.red, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  String _getZodiacForYear(int year) {
    const animals = ['Monkey', 'Rooster', 'Dog', 'Pig', 'Rat', 'Ox', 'Tiger', 'Rabbit', 'Dragon', 'Snake', 'Horse', 'Goat'];
    return animals[year % 12];
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
                  Text(title, style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
                  Text(subtitle, style: GoogleFonts.quicksand(fontSize: 17, fontWeight: FontWeight.w700, color: ChiGlowTheme.bronzeGold)),
                ],
              ),
            ),
            trailing ?? Icon(Icons.chevron_right, color: ChiGlowTheme.richRed.withValues(alpha: 0.4)),
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
        Text(label, style: GoogleFonts.quicksand(fontSize: 15, fontWeight: FontWeight.w700, color: ChiGlowTheme.richRed)),
        Text(value, style: GoogleFonts.quicksand(fontSize: 15, fontWeight: FontWeight.w700, color: const Color(0xFF2E7D32))),
      ],
    );
  }
}