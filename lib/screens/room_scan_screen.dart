import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';

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
    'Front Yard', 'Backyard',
    'Corporate Office', 'Retail Store', 'Restaurant / Cafe',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Your Space', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: ChiGlowTheme.luckyRed,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Camera preview area
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                  color: ChiGlowTheme.luckyRed.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: ChiGlowTheme.luckyRed.withValues(alpha: 0.2),
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
                              color: ChiGlowTheme.luckyRed.withValues(alpha: 0.1),
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
                              color: ChiGlowTheme.luckyRed.withValues(alpha: 0.7),
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
            const SizedBox(height: 20),
            // Room type selector
            GlowCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Room Type',
                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: ChiGlowTheme.luckyRed),
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
                            color: selected ? ChiGlowTheme.luckyRed : ChiGlowTheme.luckyRed.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            type,
                            style: GoogleFonts.quicksand(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: selected ? Colors.white : ChiGlowTheme.luckyRed,
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
            // Privacy notice
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock_outline, size: 14, color: ChiGlowTheme.warmGold.withValues(alpha: 0.7)),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    'Your privacy is sacred — your photo stays on your phone. Nothing is uploaded or shared.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      fontSize: 11,
                      color: ChiGlowTheme.warmGold.withValues(alpha: 0.7),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Analyze button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _isAnalyzing ? null : _analyzeRoom,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ChiGlowTheme.luckyRed,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                  elevation: 4,
                  disabledBackgroundColor: ChiGlowTheme.luckyRed.withValues(alpha: 0.4),
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
              style: GoogleFonts.quicksand(fontSize: 12, color: ChiGlowTheme.warmGold.withValues(alpha: 0.7)),
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