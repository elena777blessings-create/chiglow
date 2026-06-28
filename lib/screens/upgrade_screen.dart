import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';
import '../utils/asset_images.dart';

class UpgradeScreen extends StatefulWidget {
  const UpgradeScreen({super.key});

  @override
  State<UpgradeScreen> createState() => _UpgradeScreenState();
}

class _UpgradeScreenState extends State<UpgradeScreen> {
  int _selectedTier = 0; // 0 = Yearly (default), 1 = Monthly, 2 = Founder's

  static const _tiers = <_PricingTier>[
    _PricingTier(
      name: 'Yearly',
      emoji: '🌸',
      price: '\$59.99',
      period: '/year (\$5/mo)',
      color: ChiGlowTheme.bronzeGold,
      highlightColor: ChiGlowTheme.bronzeGold,
      badge: 'MEMBER FAVORITE',
      description: 'Unlimited access to the complete ChiGlow experience. Cancel anytime.',
      saveText: 'Save compared to paying monthly',
      features: ['Unlimited room scans', 'Full zodiac profiles', 'Year-ahead forecasts', 'Feng Shui compass', 'Color coaching', 'Priority support'],
      isExclusive: false,
    ),
    _PricingTier(
      name: 'Monthly',
      emoji: '🌿',
      price: '\$9.99',
      period: '/month',
      color: ChiGlowTheme.richRed,
      highlightColor: ChiGlowTheme.richRed,
      badge: null,
      description: 'Enjoy the complete ChiGlow experience. Cancel anytime.',
      saveText: null,
      features: ['Unlimited room scans', 'Full zodiac profiles', 'Year-ahead forecasts', 'Feng Shui compass', 'Color coaching'],
      isExclusive: false,
    ),
    _PricingTier(
      name: "Founder's Edition",
      emoji: '✨',
      price: '\$49',
      period: 'one-time',
      color: ChiGlowTheme.bronzeGold,
      highlightColor: ChiGlowTheme.bronzeGold,
      badge: 'FOUNDER',
      description: 'Become one of ChiGlow\'s earliest supporters. Enjoy lifetime access and all future premium enhancements during the Founder\'s program.',
      saveText: null,
      features: ['Everything forever', 'No recurring payments', 'All future premium features', 'Founder recognition', 'Lifetime updates'],
      isExclusive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final selected = _tiers[_selectedTier];

    return Scaffold(
      appBar: AppBar(
        title: Text('Membership', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: ChiGlowTheme.richRed,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  // Gold lotus
                  SizedBox(
                    width: 56,
                    height: 56,
                    child: Image.asset(AssetImages.lotusGold, fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Choose Your Journey',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: ChiGlowTheme.richRed,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Every membership helps us bring harmony to more homes.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      fontSize: 14,
                      color: ChiGlowTheme.mediumGray,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Pricing tiers
            ...List.generate(_tiers.length, (i) {
              final tier = _tiers[i];
              final isSelected = _selectedTier == i;
              final isLast = i == _tiers.length - 1;
              return Column(
                children: [
                  _TierCard(
                    tier: tier,
                    isSelected: isSelected,
                    onTap: () => setState(() => _selectedTier = i),
                  ),
                  if (!isLast) const SizedBox(height: 12),
                ],
              );
            }),

            const SizedBox(height: 24),

            // Primary CTA button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => _showComingSoon(context, selected.name),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ChiGlowTheme.richRed,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 3,
                  shadowColor: ChiGlowTheme.richRed.withValues(alpha: 0.3),
                ),
                child: Text(
                  '🌸 Begin My Harmony Journey',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              selected.saveText != null
                  ? '${selected.emoji} ${selected.saveText!}'
                  : '${selected.emoji} Choose ${selected.name} to begin',
              textAlign: TextAlign.center,
              style: GoogleFonts.quicksand(
                fontSize: 12,
                color: ChiGlowTheme.bronzeGold,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 24),

            // Gratitude Message
            GlowCard(
              glowColor: ChiGlowTheme.bronzeGold,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 18,
                        height: 18,
                        child: Image.asset(AssetImages.lotusGold, fit: BoxFit.contain),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Thank You',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: ChiGlowTheme.richRed,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Your membership supports our mission to make Feng Shui wisdom accessible to everyone. Every scan, every insight, every moment of harmony you create ripples outward — touching not just your space, but the world around you.',
                    style: GoogleFonts.quicksand(
                      fontSize: 13,
                      color: ChiGlowTheme.charcoal,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'With gratitude,',
                    style: GoogleFonts.quicksand(
                      fontSize: 12,
                      color: ChiGlowTheme.mediumGray,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    '— The ChiGlow Team',
                    style: GoogleFonts.quicksand(
                      fontSize: 12,
                      color: ChiGlowTheme.bronzeGold,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Closing Blessing
            Center(
              child: Text(
                '🌸 May your home always be filled\nwith peace, harmony, and light.',
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: ChiGlowTheme.bronzeGold,
                  height: 1.6,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Footer links
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 4,
                runSpacing: 8,
                children: [
                  _FooterLink(text: 'Restore Purchases', onTap: () {}),
                  Text(' | ', style: TextStyle(color: ChiGlowTheme.mediumGray, fontSize: 12)),
                  _FooterLink(text: 'Privacy Policy', onTap: () {}),
                  Text(' | ', style: TextStyle(color: ChiGlowTheme.mediumGray, fontSize: 12)),
                  _FooterLink(text: 'Terms of Service', onTap: () {}),
                  Text(' | ', style: TextStyle(color: ChiGlowTheme.mediumGray, fontSize: 12)),
                  _FooterLink(text: 'Manage Subscription', onTap: () {}),
                ],
              ),
            ),

            const SizedBox(height: 8),
            Text(
              'Payment processing coming soon.',
              textAlign: TextAlign.center,
              style: GoogleFonts.quicksand(
                fontSize: 10,
                color: ChiGlowTheme.mediumGray.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showComingSoon(BuildContext context, String tierName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '🌸 ${tierName} membership — coming soon!',
          style: GoogleFonts.quicksand(fontSize: 14),
        ),
        backgroundColor: ChiGlowTheme.richRed,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class _TierCard extends StatelessWidget {
  final _PricingTier tier;
  final bool isSelected;
  final VoidCallback onTap;

  const _TierCard({
    required this.tier,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.95),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? tier.highlightColor.withValues(alpha: 0.7)
                : tier.highlightColor.withValues(alpha: 0.12),
            width: isSelected ? 2.5 : 1,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: tier.highlightColor.withValues(alpha: 0.15),
                blurRadius: 20,
                spreadRadius: 1,
                offset: const Offset(0, 4),
              )
            else
              BoxShadow(
                color: tier.highlightColor.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Emoji
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: tier.isExclusive
                            ? ChiGlowTheme.bronzeGold.withValues(alpha: 0.12)
                            : tier.highlightColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: tier.isExclusive
                            ? SizedBox(
                                width: 22,
                                height: 22,
                                child: Image.asset(AssetImages.lotusGold, fit: BoxFit.contain),
                              )
                            : Text(tier.emoji, style: TextStyle(fontSize: 22)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                tier.name,
                                style: GoogleFonts.poppins(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: ChiGlowTheme.richRed,
                                ),
                              ),
                              if (tier.isExclusive) ...[
                                const SizedBox(width: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    'Exclusive',
                                    style: GoogleFonts.quicksand(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w600,
                                      color: ChiGlowTheme.bronzeGold,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                          if (tier.saveText != null) ...[
                            const SizedBox(height: 2),
                            Text(
                              tier.saveText!,
                              style: GoogleFonts.quicksand(
                                fontSize: 11,
                                color: ChiGlowTheme.bronzeGold,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                          const SizedBox(height: 4),
                          Text(
                            tier.description,
                            style: GoogleFonts.quicksand(
                              fontSize: 12,
                              color: ChiGlowTheme.mediumGray,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          tier.price,
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: tier.highlightColor,
                          ),
                        ),
                        Text(
                          tier.period,
                          style: GoogleFonts.quicksand(
                            fontSize: 10,
                            color: ChiGlowTheme.mediumGray,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Divider
                Container(height: 1, color: tier.highlightColor.withValues(alpha: 0.1)),
                const SizedBox(height: 12),
                // Features
                ...tier.features.map((f) => Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle, size: 15, color: tier.highlightColor),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          f,
                          style: GoogleFonts.quicksand(
                            fontSize: 12,
                            color: ChiGlowTheme.charcoal,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
            // Badge
            if (tier.badge != null)
              Positioned(
                top: -8,
                right: -8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [ChiGlowTheme.richRed, ChiGlowTheme.bronzeGold],
                    ),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: ChiGlowTheme.richRed.withValues(alpha: 0.3),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Text(
                    tier.badge!,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _FooterLink({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: GoogleFonts.quicksand(
          fontSize: 12,
          color: ChiGlowTheme.mediumGray,
          decoration: TextDecoration.underline,
          decorationColor: ChiGlowTheme.mediumGray.withValues(alpha: 0.3),
        ),
      ),
    );
  }
}

class _PricingTier {
  final String name;
  final String emoji;
  final String price;
  final String period;
  final Color color;
  final Color highlightColor;
  final String? badge;
  final String description;
  final String? saveText;
  final List<String> features;
  final bool isExclusive;

  const _PricingTier({
    required this.name,
    required this.emoji,
    required this.price,
    required this.period,
    required this.color,
    required this.highlightColor,
    this.badge,
    required this.description,
    this.saveText,
    required this.features,
    required this.isExclusive,
  });
}