import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';
import '../services/content_service.dart';
import '../utils/asset_images.dart';

class RoomResultsScreen extends StatelessWidget {
  final String roomType;
  final String? scanImagePath;

  const RoomResultsScreen({
    super.key,
    this.roomType = 'Living Room',
    this.scanImagePath,
  });

  @override
  Widget build(BuildContext context) {
    final tips = ContentService.tipsForRoom(roomType);

    return Scaffold(
      appBar: AppBar(
        title: Text('$roomType Analysis', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: ChiGlowTheme.richRed,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Room illustration
            SizedBox(
              width: double.infinity,
              height: 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Image.asset(
                      AssetImages.roomImageFor(roomType),
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                    // Overlay gradient for text legibility
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            ChiGlowTheme.richRed.withValues(alpha: 0.6),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      left: 16,
                      child: Text(
                        roomType,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          shadows: [Shadow(color: Colors.black26, blurRadius: 8)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Overall energy score
            GlowCard(
              glowColor: ChiGlowTheme.bronzeGold,
              child: Row(
                children: [
                  const Text('🌊', style: TextStyle(fontSize: 36)),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Energy Flow: Harmonious',
                          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Your $roomType has balanced energy with room for enhancement.',
                          style: GoogleFonts.quicksand(fontSize: 13, color: ChiGlowTheme.bronzeGold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Feng Shui Tips
            Text(
              '🪷 Feng Shui Recommendations',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
            ),
            const SizedBox(height: 12),
            ...tips.map((tip) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GlowCard(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tip['icon'] ?? '✨', style: const TextStyle(fontSize: 28)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tip['title'] ?? '',
                            style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            tip['description'] ?? '',
                            style: GoogleFonts.quicksand(fontSize: 13, color: const ChiGlowTheme.mediumGray, height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
            const SizedBox(height: 12),
            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.pushNamed(context, '/color-coaching'),
                    icon: const Text('🎨'),
                    label: Text('Color Tips', style: GoogleFonts.poppins(fontSize: 13)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.pushNamed(context, '/compass'),
                    icon: const Text('🧭'),
                    label: Text('Use Compass', style: GoogleFonts.poppins(fontSize: 13)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}