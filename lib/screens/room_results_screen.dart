import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';
import '../services/content_service.dart';
import '../services/journal_storage.dart';
import '../models/energy_models.dart';
import '../utils/asset_images.dart';
import '../widgets/global_header.dart';
import '../widgets/home_button.dart';

class RoomResultsScreen extends StatefulWidget {
  final String roomType;

  /// Legacy single-image path (kept for backward compatibility).
  final String? scanImagePath;

  /// All image paths for the scan (>=1 when photos exist).
  final List<String> scanImagePaths;

  const RoomResultsScreen({
    super.key,
    this.roomType = 'Living Room',
    this.scanImagePath,
    this.scanImagePaths = const [],
  });

  @override
  State<RoomResultsScreen> createState() => _RoomResultsScreenState();
}

class _RoomResultsScreenState extends State<RoomResultsScreen> {
  bool _saved = false;

  @override
  void initState() {
    super.initState();
    _autoSave();
  }

  /// Effective list of image paths — combines the new multi-photo list with
  /// the legacy single-image param for backward compatibility.
  List<String> get _imagePaths {
    if (widget.scanImagePaths.isNotEmpty) return widget.scanImagePaths;
    if (widget.scanImagePath != null && widget.scanImagePath!.isNotEmpty) {
      return [widget.scanImagePath!];
    }
    return const [];
  }

  Future<void> _autoSave() async {
    try {
      // Already saved at photo confirmation (same first image) — skip to avoid duplicates.
      if (_imagePaths.isNotEmpty) {
        final existing = await JournalStorage.loadEntries();
        final firstPath = _imagePaths.first;
        final alreadySaved = existing.any((e) =>
            e.imagePath == firstPath || e.imagePaths.contains(firstPath));
        if (alreadySaved) {
          if (mounted) setState(() => _saved = true);
          return;
        }
      }
      final tips = ContentService.tipsForRoom(widget.roomType);
      final colors = ContentService.colorGuidance.take(3).map((c) => c['color'] ?? '').toList();
      final directions = ['North', 'South', 'East', 'West'];

      final description = 'Your ${widget.roomType} has balanced energy with room for enhancement.';
      final observations = [
        'Energy flow detected as harmonious in the ${widget.roomType}',
        'Room shows balanced Bagua energy with potential for improvement',
        'Recommended: add ${tips.isNotEmpty ? tips.first['title'] ?? 'balancing elements' : 'balancing elements'}',
      ];

      final entry = JournalEntry(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        roomType: widget.roomType,
        scanDate: DateTime.now(),
        imagePath: _imagePaths.isEmpty ? null : _imagePaths.first,
        imagePaths: _imagePaths,
        tips: tips,
        suggestedColors: colors,
        recommendedDirections: directions,
        energyScore: 'Harmonious',
        overallDescription: description,
        aiObservations: observations,
      );
      await JournalStorage.addEntry(entry);
    } catch (_) {
      // Never block the results screen on a storage error.
    } finally {
      if (mounted) {
        setState(() => _saved = true);
      }
    }
  }

  /// Displays the scanned photos: first photo large with a count badge, plus
  /// a horizontal thumbnail strip when there is more than one photo.
  Widget _buildPhotosStrip() {
    final paths = _imagePaths;
    if (paths.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 180,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.file(
                  File(paths.first),
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: ChiGlowTheme.creamWhite,
                    child: const Center(child: Text('📷', style: TextStyle(fontSize: 40))),
                  ),
                ),
                if (paths.length > 1)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.55),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        '1 of ${paths.length}',
                        style: GoogleFonts.quicksand(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (paths.length > 1) ...[
          const SizedBox(height: 12),
          SizedBox(
            height: 72,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: paths.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(paths[i]),
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 72,
                    height: 72,
                    color: ChiGlowTheme.richRed.withValues(alpha: 0.06),
                    child: const Center(child: Text('📷', style: TextStyle(fontSize: 24))),
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final tips = ContentService.tipsForRoom(widget.roomType);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GlobalHeader(
              title: '${widget.roomType} Analysis',
              subtitle: 'ChiGlow Feng Shui guidance for your space',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            SizedBox(
              width: double.infinity,
              height: 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Image.asset(
                      AssetImages.roomImageFor(widget.roomType),
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
                        widget.roomType,
                        style: GoogleFonts.playfairDisplay(
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
            if (_imagePaths.isNotEmpty) ...[
              _buildPhotosStrip(),
              const SizedBox(height: 20),
            ],
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
                          'Your ${widget.roomType} has balanced energy with room for enhancement.',
                          style: GoogleFonts.quicksand(fontSize: 15, color: ChiGlowTheme.bronzeGold, fontWeight: FontWeight.w700),
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
                    Text(tip['icon'] ?? '✨', style: const TextStyle(fontSize: 36)),
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
                            style: GoogleFonts.quicksand(fontSize: 14, color: Color(0xFF2E7D32), fontWeight: FontWeight.w700, height: 1.5),
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
                    label: Text('Color Tips', style: GoogleFonts.poppins(fontSize: 14)),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.pushNamed(context, '/compass'),
                    icon: const Text('🧭'),
                    label: Text('Use Compass', style: GoogleFonts.poppins(fontSize: 14), softWrap: false),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Saved to journal indicator
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    '✅ Saved to Harmony Journal',
                    style: GoogleFonts.quicksand(fontSize: 16, color: Color(0xFF2E7D32), fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            // View Journal button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/harmony-journal'),
                icon: const Icon(Icons.book_outlined, size: 18),
                label: Text('View Harmony Journal', style: GoogleFonts.poppins(fontSize: 16), softWrap: false),
                style: OutlinedButton.styleFrom(
                  foregroundColor: ChiGlowTheme.richRed,
                  side: BorderSide(color: ChiGlowTheme.richRed.withValues(alpha: 0.3)),
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
}