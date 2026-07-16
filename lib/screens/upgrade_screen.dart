import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';
import '../widgets/chi_particles.dart';
import '../utils/asset_images.dart';
import '../widgets/global_header.dart';

class UpgradeScreen extends StatefulWidget {
  const UpgradeScreen({super.key});

  @override
  State<UpgradeScreen> createState() => _UpgradeScreenState();
}

class _UpgradeScreenState extends State<UpgradeScreen> {
  int _selectedTier = 0; // 0 = Yearly (default), 1 = Monthly, 2 = Founder's

  static const _tiers = <_PricingTier>[
    _PricingTier(
      name: '🌸 Yearly Membership',
      price: '\$59.99/yr',
      supportText: 'Only \$5.00 per month',
      badge: 'MEMBER FAVORITE',
      description:
          'Save compared to paying monthly.\nUnlimited access to the complete ChiGlow experience. Cancel anytime.',
      features: [
        'Unlimited room scans',
        'Full zodiac profiles',
        'Year-ahead forecasts',
        'Feng Shui compass',
        'Color coaching',
        'Priority support',
        '🌸 Harmony Journal',
      ],
      mainAxisAlignment: MainAxisAlignment.start,
    ),
    _PricingTier(
      name: '🌿 Monthly Membership',
      price: '\$9.99/mo',
      supportText: null,
      badge: null,
      description: 'Enjoy the complete ChiGlow experience. Cancel anytime.',
      features: [
        'Unlimited room scans',
        'Full zodiac profiles',
        'Year-ahead forecasts',
        'Feng Shui compass',
        'Color coaching',
        '🌸 Harmony Journal',
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    ),
    _PricingTier(
      name: '✨ Founder\'s Edition',
      price: '\$49 one-time',
      supportText: null,
      badge: 'FOUNDER',
      description:
          'Become one of ChiGlow\'s earliest supporters. Pay once.\n'
          'Enjoy lifetime access to the current premium experience.\n'
          'Future premium enhancements released during the Founder\'s Edition program are included.\n'
          'Thank you for believing in our vision from the very beginning.',
      features: [
        'Everything forever',
        'No recurring payments',
        'All future premium features',
        'Founder recognition',
        'Lifetime updates',
        '🌸 Harmony Journal',
      ],
      mainAxisAlignment: MainAxisAlignment.start,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final selected = _tiers[_selectedTier];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const GlobalHeader(title: 'Choose Your Journey'),
            Expanded(
              child: ChiParticles(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    elevation: 3,
                    shadowColor: ChiGlowTheme.richRed.withValues(alpha: 0.3),
                  ),
                  child: Text(
                    '🌸 Begin My Harmony Journey',
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                selected.supportText != null
                    ? '🌸 ${selected.supportText!}'
                    : '🌸 Choose your path to begin',
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
        content: Text('🌸 $tierName — coming soon!',
            style: GoogleFonts.quicksand(fontSize: 14)),
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
                ? ChiGlowTheme.bronzeGold.withValues(alpha: 0.7)
                : ChiGlowTheme.bronzeGold.withValues(alpha: 0.12),
            width: isSelected ? 2.5 : 1,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.15),
                blurRadius: 20,
                spreadRadius: 1,
                offset: const Offset(0, 4),
              )
            else
              BoxShadow(
                color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Column(
          mainAxisAlignment: tier.mainAxisAlignment,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            Text(
              tier.name,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: ChiGlowTheme.richRed,
              ),
            ),
            const SizedBox(height: 10),

            // Price
            Text(
              tier.price,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: ChiGlowTheme.bronzeGold,
              ),
            ),
            const SizedBox(height: 6),

            // Supporting info
            if (tier.supportText != null) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  tier.supportText!,
                  style: GoogleFonts.quicksand(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: ChiGlowTheme.bronzeGold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],

            // Description
            Text(
              tier.description,
              textAlign: TextAlign.center,
              style: GoogleFonts.quicksand(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF2E7D32),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 14),

            // Divider
            Container(height: 1, color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.12)),
            const SizedBox(height: 12),

            // Features
            ...tier.features.map((f) => Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle, size: 15, color: ChiGlowTheme.bronzeGold),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          f,
                          style: GoogleFonts.quicksand(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF2E7D32),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
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
  final String price;
  final String? supportText;
  final String? badge;
  final String description;
  final List<String> features;
  final MainAxisAlignment mainAxisAlignment;

  const _PricingTier({
    required this.name,
    required this.price,
    this.supportText,
    this.badge,
    required this.description,
    required this.features,
    required this.mainAxisAlignment,
  });
}