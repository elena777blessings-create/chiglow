import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';
import '../utils/asset_images.dart';
import '../widgets/global_header.dart';

class RoomScanScreen extends StatefulWidget {
  const RoomScanScreen({super.key});

  @override
  State<RoomScanScreen> createState() => _RoomScanScreenState();
}

class _RoomScanScreenState extends State<RoomScanScreen> {
  String? _imagePath;
  String _selectedRoomType = 'Living Room';
  bool _isAnalyzing = false;

  final List<String> _roomTypes = [
    'Living Room', 'Bedroom', 'Kitchen', 'Home Office', 'Bathroom', 'Dining Room', 'Entryway', 'Garden',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Page header
            const GlobalHeader(
              title: 'Scan Your Space',
              subtitle: 'Discover the energy of your room',
            ),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                  color: ChiGlowTheme.richRed.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: ChiGlowTheme.richRed.withValues(alpha: 0.2),
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                ),
                child: _imagePath == null
                    ? Column(
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
                            'Tap to take a photo\nor upload a room image',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                              fontSize: 14,
                              color: ChiGlowTheme.richRed.withValues(alpha: 0.7),
                              height: 1.5,
                            ),
                          ),
                        ],
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(_imagePath!, fit: BoxFit.cover),
                            Positioned(
                              top: 12,
                              right: 12,
                              child: GestureDetector(
                                onTap: () => setState(() => _imagePath = null),
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: 0.5),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.close, color: Colors.white, size: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 16),
            // Room illustration preview
            if (_imagePath == null)
              SizedBox(
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    AssetImages.roomImageFor(_selectedRoomType),
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(height: 16),
            // Room type selector
            GlowCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Room Type',
                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
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
                              fontSize: 13,
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
            const SizedBox(height: 24),
            // Analyze button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _isAnalyzing ? null : _analyzeRoom,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ChiGlowTheme.richRed,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                  elevation: 4,
                  disabledBackgroundColor: ChiGlowTheme.richRed.withValues(alpha: 0.4),
                ),
                child: _isAnalyzing
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : Text(
                        '✨ Analyze Chi Energy',
                        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Your photo is processed locally and never leaves your device.',
              textAlign: TextAlign.center,
              style: GoogleFonts.quicksand(fontSize: 12, color: ChiGlowTheme.bronzeGold.withValues(alpha: 0.7)),
            ),
          ],
        ),
      ),
    );
  }

  void _pickImage() {
    // Placeholder - in real app would use image_picker
    setState(() {
      _imagePath = 'placeholder';
    });
  }

  void _analyzeRoom() {
    setState(() => _isAnalyzing = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _isAnalyzing = false);
        Navigator.pushNamed(context, '/room-results', arguments: {
          'roomType': _selectedRoomType,
          'imagePath': _imagePath,
        });
      }
    });
  }
}