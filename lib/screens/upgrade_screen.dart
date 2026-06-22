import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';

class UpgradeScreen extends StatelessWidget {
  const UpgradeScreen({super.key});

  static const _tiers = [
    _PricingTier(
      name: 'Free',
      emoji: '🆓',
      price: '\$0',
      period: 'forever',
      color: Color(0xFF9E9E9E),
      features: ['1 basic room scan', 'Limited daily ritual'],
      highlighted: false,
    ),
    _PricingTier(
      name: 'Monthly',
      emoji: '💎',
      price: '\$9.99',
      period: '/month',
      color: ChiGlowTheme.luckyRed,
      features: ['Unlimited room scans', 'Full zodiac profiles', 'Year-ahead forecasts', 'Feng Shui compass', 'Color coaching', 'Cancel anytime'],
      highlighted: false,
    ),
    _PricingTier(
      name: 'Yearly',
      emoji: '🌟',
      price: '\$79',
      period: '/year',
      color: ChiGlowTheme.warmGold,
      features: ['Everything in Monthly', 'Best value — save \$40', 'Seasonal adjustments', 'Priority support'],
      highlighted: true,
      badge: 'BEST VALUE',
    ),
    _PricingTier(
      name: 'Lifetime',
      emoji: '🔥',
      price: '\$49.99',
      period: 'one-time',
      color: ChiGlowTheme.brightRed,
      features: ['Everything forever', 'No recurring payments', 'All future features', 'Lifetime updates'],
      highlighted: true,
      badge: 'POPULAR',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upgrade to Premium', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
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
                    child: const Center(child: Text('🐟', style: TextStyle(fontSize: 36))),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Unlock Your Full Potential',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ChiGlowTheme.luckyRed,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Choose the plan that resonates with your journey',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      fontSize: 14,
                      color: ChiGlowTheme.warmGold,
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
              final isLast = i == _tiers.length - 1;
              return Column(
                children: [
                  _TierCard(tier: tier),
                  if (!isLast) const SizedBox(height: 12),
                ],
              );
            }),
            const SizedBox(height: 24),
            // Footer note
            GlowCard(
              glowColor: ChiGlowTheme.warmGold,
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.auto_awesome, size: 16, color: ChiGlowTheme.warmGold),
                      const SizedBox(width: 8),
                      Text(
                        'Why upgrade?',
                        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: ChiGlowTheme.luckyRed),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Premium features help you transform your space and life with personalized Feng Shui guidance, unlimited scans, and deeper insights into your energy.',
                    style: GoogleFonts.quicksand(fontSize: 13, color: const Color(0xFF6D4C41), height: 1.6),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Payment processing coming soon. Your data stays private.',
              textAlign: TextAlign.center,
              style: GoogleFonts.quicksand(
                fontSize: 11,
                color: ChiGlowTheme.warmGold.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _TierCard extends StatelessWidget {
  final _PricingTier tier;

  const _TierCard({required this.tier});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tier.price != '\$0' ? () => _showComingSoon(context) : null,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.95),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: tier.highlighted
                ? tier.color.withValues(alpha: 0.5)
                : tier.color.withValues(alpha: 0.15),
            width: tier.highlighted ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: tier.color.withValues(alpha: tier.highlighted ? 0.15 : 0.06),
              blurRadius: tier.highlighted ? 20 : 8,
              offset: const Offset(0, 4),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(tier.emoji, style: const TextStyle(fontSize: 24)),
                        const SizedBox(width: 8),
                        Text(
                          tier.name,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: ChiGlowTheme.luckyRed,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          tier.price,
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: tier.color,
                          ),
                        ),
                        Text(
                          tier.period,
                          style: GoogleFonts.quicksand(
                            fontSize: 11,
                            color: ChiGlowTheme.warmGold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Divider
                Container(height: 1, color: tier.color.withValues(alpha: 0.15)),
                const SizedBox(height: 12),
                // Features
                ...tier.features.map((f) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle, size: 16, color: tier.color),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          f,
                          style: GoogleFonts.quicksand(
                            fontSize: 13,
                            color: const Color(0xFF4E342E),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
                if (tier.price != '\$0') ...[
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _showComingSoon(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tier.color,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        elevation: 2,
                        shadowColor: tier.color.withValues(alpha: 0.3),
                      ),
                      child: Text(
                        tier.name == 'Lifetime'
                            ? '🔥 Get Lifetime Access'
                            : 'Choose ${tier.name}',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
            // Badge
            if (tier.badge != null)
              Positioned(
                top: -4,
                right: -4,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [tier.color, ChiGlowTheme.warmGold],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: tier.color.withValues(alpha: 0.4),
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
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Payment processing coming soon! ✨',
          style: GoogleFonts.quicksand(fontSize: 14),
        ),
        backgroundColor: ChiGlowTheme.luckyRed,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
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
  final List<String> features;
  final bool highlighted;
  final String? badge;

  const _PricingTier({
    required this.name,
    required this.emoji,
    required this.price,
    required this.period,
    required this.color,
    required this.features,
    required this.highlighted,
    this.badge,
  });
}