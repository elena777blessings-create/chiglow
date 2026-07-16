import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';
import '../widgets/global_header.dart';

class CompassScreen extends StatefulWidget {
  const CompassScreen({super.key});

  @override
  State<CompassScreen> createState() => _CompassScreenState();
}

class _CompassScreenState extends State<CompassScreen> {
  double _heading = 0;
  bool _isCalibrating = true;
  Timer? _timer;

  final Map<String, _BaguaSector> _sectors = {
    'N': _BaguaSector('Career', '🧭', 'Water', ChiGlowTheme.bronzeGold),
    'NE': _BaguaSector('Knowledge', '📚', 'Earth', ChiGlowTheme.richRed),
    'E': _BaguaSector('Family', '👨‍👩‍👧‍👦', 'Wood', ChiGlowTheme.bronzeGold),
    'SE': _BaguaSector('Wealth', '💰', 'Wood', ChiGlowTheme.softRed),
    'S': _BaguaSector('Fame', '🏆', 'Fire', Colors.red),
    'SW': _BaguaSector('Love', '💖', 'Earth', Colors.pink),
    'W': _BaguaSector('Creativity', '🎨', 'Metal', const Color(0xFF9E9E9E)),
    'NW': _BaguaSector('Mentors', '🙏', 'Metal', const Color(0xFFE0E0E0)),
  };

  @override
  void initState() {
    super.initState();
    _startSimulation();
  }

  void _startSimulation() {
    // Simulate compass (in real app would use sensors_plus)
    _isCalibrating = true;
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() => _isCalibrating = false);
      _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
        if (!mounted) { timer.cancel(); return; }
        setState(() {
          _heading = (_heading + (Random().nextDouble() - 0.5) * 2) % 360;
          if (_heading < 0) _heading += 360;
        });
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const GlobalHeader(title: 'Feng Shui Compass', subtitle: 'Find your Bagua sectors'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                child: Column(
                  children: [
            if (_isCalibrating)
              GlowCard(
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    const CircularProgressIndicator(),
                    const SizedBox(height: 12),
                    Text(
                      'Calibrating compass...\nPoint your phone north',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(fontSize: 14, color: ChiGlowTheme.richRed, height: 1.5),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              )
            else
              // Compass
              Column(
                children: [
                  // Compass rose
                  Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.95),
                      boxShadow: [
                        BoxShadow(color: ChiGlowTheme.richRed.withValues(alpha: 0.15), blurRadius: 24, spreadRadius: 4),
                      ],
                    ),
                    child: Transform.rotate(
                      angle: -_heading * pi / 180,
                      child: CustomPaint(
                        painter: _CompassPainter(),
                        child: Center(
                          child: Text(
                            _getDirection(_heading),
                            style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700, color: ChiGlowTheme.richRed),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${_heading.toStringAsFixed(1)}° ${_getDirection(_heading)}',
                    style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
                  ),
                  const SizedBox(height: 24),
                  // Active sector info
                  Text(
                    '📍 Current Sector',
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
                  ),
                  const SizedBox(height: 12),
                  GlowCard(
                    glowColor: _currentSector().color,
                    child: Row(
                      children: [
                        Text(_currentSector().emoji, style: const TextStyle(fontSize: 36)),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _currentSector().name,
                                style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
                              ),
                              Text(
                                'Element: ${_currentSector().element}',
                                style: GoogleFonts.quicksand(fontSize: 15, color: ChiGlowTheme.bronzeGold, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Bagua sectors list
                  Text(
                    'Bagua Map Sectors',
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed),
                  ),
                  const SizedBox(height: 12),
                  ..._sectors.entries.map((entry) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: GlowCard(
                      child: Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: entry.value.color.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child: Text(entry.value.emoji, style: const TextStyle(fontSize: 18))),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${entry.key} — ${entry.value.name}',
                                    style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
                                Text('Element: ${entry.value.element}',
                                    style: GoogleFonts.quicksand(fontSize: 13, color: ChiGlowTheme.bronzeGold, fontWeight: FontWeight.w700)),
                              ],
                            ),
                          ),
                          Text(entry.key, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700, color: entry.value.color)),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
          ],  // close inner Column children
        ),  // close inner Column
      ),  // close SingleChildScrollView
    ),  // close Expanded
    ],  // close outer Column children
  ),  // close outer Column
),  // close SafeArea
);  // close Scaffold + return
  }

  _BaguaSector _currentSector() {
    final dir = _getDirection(_heading);
    return _sectors[dir] ?? _sectors['N']!;
  }

  String _getDirection(double degrees) {
    const dirs = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'];
    final index = ((degrees + 22.5) % 360 / 45).floor();
    return dirs[index];
  }
}

class _BaguaSector {
  final String name;
  final String emoji;
  final String element;
  final Color color;

  const _BaguaSector(this.name, this.emoji, this.element, this.color);
}

class _CompassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    // Draw cardinal directions
    final paint = Paint()
      ..color = ChiGlowTheme.richRed.withValues(alpha: 0.3)
      ..strokeWidth = 1;

    for (int i = 0; i < 8; i++) {
      final angle = i * 45 * pi / 180;
      final x = center.dx + radius * 0.85 * cos(angle);
      final y = center.dy + radius * 0.85 * sin(angle);

      canvas.drawCircle(Offset(x, y), 3, paint);

      final tp = TextPainter(
        text: TextSpan(
          text: ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'][i],
          style: TextStyle(color: ChiGlowTheme.richRed, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(canvas, Offset(x - tp.width / 2, y - tp.height / 2));
    }

    // Outer ring
    final ringPaint = Paint()
      ..color = ChiGlowTheme.richRed.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, radius, ringPaint);
    canvas.drawCircle(center, radius * 0.85, ringPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}