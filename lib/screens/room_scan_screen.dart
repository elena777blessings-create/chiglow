import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';
import '../widgets/global_header.dart';
import '../widgets/home_button.dart';
import '../models/energy_models.dart';
import '../services/content_service.dart';
import '../services/journal_storage.dart';

class RoomScanScreen extends StatefulWidget {
  const RoomScanScreen({super.key});

  @override
  State<RoomScanScreen> createState() => _RoomScanScreenState();
}

class _RoomScanScreenState extends State<RoomScanScreen> {
  String _selectedRoomType = 'Living Room';
  bool _isAnalyzing = false;
  String? _lastSavedEntryId;

  final List<String> _imagePaths = [];
  static const int _maxPhotos = 6;

  final List<String> _roomTypes = [
    'Living Room', 'Bedroom', 'Kitchen', 'Home Office', 'Bathroom', 'Dining Room',
    'Entryway', 'Garden', 'Front Yard', 'Backyard', 'Corporate Office',
    'Retail Store', 'Restaurant/Café',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const GlobalHeader(
              title: 'Scan Your Space',
              subtitle: 'Discover the energy of your room',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Room type selector
                    GlowCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select Your Room Type',
                            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: _roomTypes.map((type) {
                              final selected = _selectedRoomType == type;
                              return GestureDetector(
                                onTap: () => setState(() => _selectedRoomType = type),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: selected ? ChiGlowTheme.richRed : ChiGlowTheme.richRed.withValues(alpha: 0.08),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    type,
                                    style: GoogleFonts.quicksand(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: selected ? Colors.white : ChiGlowTheme.richRed,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildPhotosSection(),
                    const SizedBox(height: 24),
                    // Analyze button — 1/4 narrower, centered
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.70,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: (_isAnalyzing || _imagePaths.isEmpty) ? null : _analyzeRoom,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ChiGlowTheme.richRed,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            disabledBackgroundColor: ChiGlowTheme.richRed.withValues(alpha: 0.4),
                          ),
                          child: _isAnalyzing
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                                )
                              : Center(
                                  child: Text(
                                    '✨ Analyze Chi Energy',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Your photos are processed locally and never leave your device.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(fontSize: 14, color: ChiGlowTheme.deepRed, fontWeight: FontWeight.w500),
                    ),
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

  /// Photo grid: thumbnails with remove buttons, an "Add Photo" tile, and a
  /// count — plus a large empty-state tile when no photos have been added.
  Widget _buildPhotosSection() {
    final count = _imagePaths.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Room Photos',
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
            ),
            const Spacer(),
            if (count > 0)
              Text(
                '$count / $_maxPhotos',
                style: GoogleFonts.quicksand(fontSize: 13, fontWeight: FontWeight.w600, color: ChiGlowTheme.bronzeGold),
              ),
          ],
        ),
        const SizedBox(height: 12),
        if (count == 0)
          GestureDetector(
            onTap: _pickImage,
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: ChiGlowTheme.richRed.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: ChiGlowTheme.richRed.withValues(alpha: 0.2),
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ChiGlowTheme.richRed.withValues(alpha: 0.1),
                    ),
                    child: const Center(
                      child: Text('📷', style: TextStyle(fontSize: 32)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Tap to add photos',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      fontSize: 17,
                      color: ChiGlowTheme.deepRed,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Add up to $_maxPhotos photos of your room',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      fontSize: 13,
                      color: ChiGlowTheme.deepRed,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ..._imagePaths.asMap().entries.map((e) => _buildThumbnail(e.key, e.value)),
              if (count < _maxPhotos) _buildAddTile(),
            ],
          ),
      ],
    );
  }

  Widget _buildThumbnail(int index, String path) {
    const double size = 96;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.file(
              File(path),
              width: size,
              height: size,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: size,
                height: size,
                color: ChiGlowTheme.richRed.withValues(alpha: 0.06),
                child: const Center(child: Text('📷', style: TextStyle(fontSize: 28))),
              ),
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () => _removePhoto(index),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.55),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddTile() {
    const double size = 96;
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: ChiGlowTheme.richRed.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: ChiGlowTheme.richRed.withValues(alpha: 0.25),
            width: 2,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add_a_photo_outlined, color: ChiGlowTheme.richRed, size: 28),
            const SizedBox(height: 6),
            Text(
              'Add Photo',
              style: GoogleFonts.quicksand(fontSize: 12, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
            ),
          ],
        ),
      ),
    );
  }

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    if (_imagePaths.length >= _maxPhotos) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You can add up to $_maxPhotos photos per scan.',
                style: GoogleFonts.quicksand(fontSize: 13)),
            backgroundColor: ChiGlowTheme.richRed,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );
      }
      return;
    }

    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Color(0xFFFEFCF6),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Scan Your Space',
                  style: GoogleFonts.quicksand(
                      fontSize: 20, fontWeight: FontWeight.w700, color: ChiGlowTheme.richRed)),
              const SizedBox(height: 8),
              Text('Choose how to capture your room',
                  style: GoogleFonts.quicksand(fontSize: 14, color: ChiGlowTheme.deepRed)),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _SourceOption(
                      icon: Icons.camera_alt_rounded,
                      label: 'Camera',
                      onTap: () => Navigator.pop(ctx, ImageSource.camera),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _SourceOption(
                      icon: Icons.photo_library_rounded,
                      label: 'Gallery',
                      onTap: () => Navigator.pop(ctx, ImageSource.gallery),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    if (source == null) return;

    try {
      if (source == ImageSource.gallery) {
        final images = await _picker.pickMultiImage(
          imageQuality: 85,
          maxWidth: 1920,
          maxHeight: 1920,
          limit: _maxPhotos,
        );
        if (images.isNotEmpty && mounted) {
          await _addImages(images.map((x) => x.path).toList());
        }
      } else {
        final XFile? image = await _picker.pickImage(
          source: ImageSource.camera,
          imageQuality: 85,
          maxWidth: 1920,
          maxHeight: 1920,
        );
        if (image != null && mounted) {
          await _addImages([image.path]);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Camera access is needed to scan your room. Please grant permission in Settings.',
                style: GoogleFonts.quicksand(fontSize: 13)),
            backgroundColor: ChiGlowTheme.richRed,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );
      }
    }
  }

  /// Append new photo paths (deduped, capped at _maxPhotos) and persist.
  Future<void> _addImages(List<String> paths) async {
    if (paths.isEmpty) return;
    setState(() {
      for (final p in paths) {
        if (_imagePaths.length >= _maxPhotos) break;
        if (!_imagePaths.contains(p)) {
          _imagePaths.add(p);
        }
      }
    });
    await _persistScan(notify: true);
  }

  Future<void> _removePhoto(int index) async {
    if (index < 0 || index >= _imagePaths.length) return;
    setState(() => _imagePaths.removeAt(index));
    await _persistScan(notify: false);
  }

  /// Persist the current photo list to the Harmony Journal. Keeps at most one
  /// "pending" entry per scan session: the previous entry (if any) is removed
  /// first so add/remove operations stay idempotent.
  Future<void> _persistScan({required bool notify}) async {
    final oldId = _lastSavedEntryId;
    _lastSavedEntryId = null;
    if (oldId != null) {
      try {
        await JournalStorage.deleteEntry(oldId);
      } catch (_) {}
    }
    if (_imagePaths.isEmpty) return;

    try {
      final tips = ContentService.tipsForRoom(_selectedRoomType);
      final colors = ContentService.colorGuidance.take(3).map((c) => c['color'] ?? '').toList();
      final entry = JournalEntry(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        roomType: _selectedRoomType,
        scanDate: DateTime.now(),
        imagePath: _imagePaths.first,
        imagePaths: List<String>.from(_imagePaths),
        tips: tips,
        suggestedColors: colors,
        recommendedDirections: const ['North', 'South', 'East', 'West'],
        energyScore: 'Harmonious',
        overallDescription: 'Your ${_selectedRoomType} has balanced energy with room for enhancement.',
        aiObservations: [
          'Energy flow detected as harmonious in the ${_selectedRoomType}',
          'Room shows balanced Bagua energy with potential for improvement',
          'Recommended: add ${tips.isNotEmpty ? tips.first['title'] ?? 'balancing elements' : 'balancing elements'}',
        ],
      );
      await JournalStorage.addEntry(entry);
      _lastSavedEntryId = entry.id;
      if (notify && mounted) {
        final n = _imagePaths.length;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ $n photo${n == 1 ? '' : 's'} saved to your Harmony Journal',
                style: GoogleFonts.quicksand(fontSize: 13)),
            backgroundColor: ChiGlowTheme.bronzeGold,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );
      }
    } catch (_) {
      // Never block the scan flow on a storage error.
    }
  }

  void _analyzeRoom() {
    if (_imagePaths.isEmpty) return;
    setState(() => _isAnalyzing = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _isAnalyzing = false);
        Navigator.pushNamed(context, '/room-results', arguments: {
          'roomType': _selectedRoomType,
          'imagePaths': List<String>.from(_imagePaths),
        });
      }
    });
  }
}

class _SourceOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SourceOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 28),
        decoration: BoxDecoration(
          color: ChiGlowTheme.richRed.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: ChiGlowTheme.richRed.withValues(alpha: 0.15),
          ),
        ),
        child: Column(
          children: [
            Icon(icon, size: 40, color: ChiGlowTheme.richRed),
            const SizedBox(height: 10),
            Text(label,
                style: GoogleFonts.quicksand(
                    fontSize: 15, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
          ],
        ),
      ),
    );
  }
}
