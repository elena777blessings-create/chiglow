import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_card.dart';
import '../widgets/global_header.dart';
import '../widgets/home_button.dart';

class CompassScreen extends StatefulWidget {
  const CompassScreen({super.key});

  @override
  State<CompassScreen> createState() => _CompassScreenState();
}

class _CompassScreenState extends State<CompassScreen> {
  double _heading = 0;
  bool _isCalibrating = true;
  StreamSubscription<CompassEvent>? _compassSubscription;

  final Map<String, _BaguaSector> _sectors = {
    'N': _BaguaSector('Career', '🧭', 'Water', ChiGlowTheme.bronzeGold,
      description: 'The Career sector governs your life path, purpose, and professional journey. Water energy here supports flow, wisdom, and adaptability.',
      enhance: ['Add a small fountain or water feature', 'Use deep blue, black, or metallic accents', 'Place a mirror to reflect light and expand energy', 'Display symbols of your professional aspirations'],
      avoid: ['Clutter or stagnant piles of paper', 'Broken electronics or dead plants', 'Heavy earth tones that block water energy', 'Harsh overhead lighting — use soft, directional light instead'],
      tips: ['Place your desk facing the door (command position)', 'Keep a single healthy plant for gentle wood energy', 'Add a small crystal like clear quartz for clarity']),
    'NE': _BaguaSector('Knowledge', '📚', 'Earth', ChiGlowTheme.richRed,
      description: 'The Knowledge sector supports learning, wisdom, and personal growth. Earth energy here brings stability, grounding, and deep understanding.',
      enhance: ['Create a dedicated reading nook or study corner', 'Use warm yellows, terracotta, and earth tones', 'Display books, certificates, or meaningful artwork', 'Add ceramic objects or pottery'],
      avoid: ['Too much wood element (overpowers earth)', 'Dark, unlit corners that feel heavy', 'Distractions like TV screens or gaming devices', 'Sharp or spiky decor — favor rounded shapes'],
      tips: ['Burn a candle while reading or studying', 'Keep a journal nearby for ideas and insights', 'Add a comfortable chair with a soft throw blanket']),
    'E': _BaguaSector('Family', '👨‍👩‍👧‍👦', 'Wood', ChiGlowTheme.bronzeGold,
      description: 'The Family sector nurtures your roots, heritage, and closest relationships. Wood energy encourages growth, renewal, and connection.',
      enhance: ['Display family photos in wooden frames', 'Add healthy green plants (especially tall ones)', 'Use green and blue color accents', 'Include a small water element to nourish wood'],
      avoid: ['Metal objects that "cut" wood energy', 'Dead or dried plants — keep everything alive', 'Excessive fire symbols (red decor, candles)', 'Clutter that blocks the flow of chi'],
      tips: ['Place a family photo where you see it daily', 'Add a wooden bowl with fresh fruit', 'Open windows regularly to circulate fresh air']),
    'SE': _BaguaSector('Wealth', '💰', 'Wood', ChiGlowTheme.softRed,
      description: 'The Wealth sector attracts abundance, prosperity, and gratitude. Wood energy here supports growth, and a touch of water nourishes it.',
      enhance: ['Place a healthy money plant or jade plant', 'Use purple, green, and gold accents', 'Display a small bowl of coins or crystals (citrine, pyrite)', 'Add a gentle water feature like a tiny fountain'],
      avoid: ['Clutter — especially old bills or receipts', 'Broken items that symbolise lack', 'Bathroom or toilet energy nearby', 'Excessive fire (burns through wealth)'],
      tips: ['Keep a gratitude journal in this area', 'Place citrine or pyrite in the far-left corner from your door', 'Use a purple cloth under your valuables']),
    'S': _BaguaSector('Fame', '🏆', 'Fire', Colors.red,
      description: 'The Fame sector governs recognition, reputation, and how the world sees you. Fire energy fuels passion, visibility, and authentic self-expression.',
      enhance: ['Use red, orange, and bright warm tones', 'Add candles or a fireplace (real or decorative)', 'Display awards, diplomas, or achievements', 'Include triangular shapes and upward-reaching decor'],
      avoid: ['Water elements that dampen fire', 'Dark, shadowy corners — keep it well-lit', 'Modest or self-deprecating imagery', 'Clutter that dims your light'],
      tips: ['Light a candle while setting daily intentions', 'Display something you are proud of', 'Use upward lighting to lift the energy']),
    'SW': _BaguaSector('Love', '💖', 'Earth', Colors.pink,
      description: 'The Love sector governs romance, partnership, and self-love. Earth energy here creates stability, warmth, and nurturing connection.',
      enhance: ['Display pairs of objects (two candles, two crystals)', 'Use pink, red, and warm earth tones', 'Add rose quartz or amethyst crystals', 'Include soft textures — velvet, silk, plush pillows'],
      avoid: ['Single or solitary imagery', 'Work-related items or electronics', 'Clutter under the bed', 'Sharp corners pointing at the bed'],
      tips: ['Place two rose quartz hearts on your nightstand', 'Keep fresh flowers in this area', 'Remove anything that does not represent partnership']),
    'W': _BaguaSector('Creativity', '🎨', 'Metal', const Color(0xFF9E9E9E),
      description: 'The Creativity sector inspires joy, artistic expression, and new ideas. Metal energy brings precision, clarity, and the courage to create.',
      enhance: ['Use white, grey, and metallic accents', 'Display art supplies or finished creative work', 'Add round or circular shapes', 'Include a small bell or chime for sound activation'],
      avoid: ['Fire elements that melt metal energy', 'Clutter that blocks creative flow', 'Dark, uninspiring walls', 'Overly serious or rigid furniture arrangements'],
      tips: ['Keep a sketchbook or journal visible and accessible', 'Hang inspirational artwork at eye level', 'Add a small metal sculpture or wind chime']),
    'NW': _BaguaSector('Mentors', '🤝', 'Metal', const Color(0xFFE0E0E0),
      description: 'The Mentors sector attracts helpful people, guidance, and support networks. Metal energy here draws wisdom, clarity, and meaningful connections.',
      enhance: ['Use white, silver, and grey tones', 'Display images of mentors, teachers, or inspiring figures', 'Add a small bell to activate energy', 'Include round metal objects or frames'],
      avoid: ['Fire elements that overpower metal', 'Clutter that blocks new connections', 'Isolated seating — create conversation areas', 'Heavy, dark furniture that feels unapproachable'],
      tips: ['Keep a list of people you would like to meet', 'Place a comfortable chair for guests', 'Add a small mirror to reflect positive energy']),
  };

  @override
  void initState() {
    super.initState();
    _startCompass();
  }

  void _startCompass() {
    _isCalibrating = true;

    _compassSubscription = FlutterCompass.events!.listen((CompassEvent event) {
      if (!mounted) return;
      if (event.heading == null) return;

      setState(() {
        _heading = event.heading!;
        _isCalibrating = false;
      });
    }, onError: (error) {
      if (!mounted) return;
      setState(() => _isCalibrating = false);
      debugPrint('Compass error: $error');
    });
  }

  @override
  void dispose() {
    _compassSubscription?.cancel();
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
                  GestureDetector(
                    onTap: () => _showSectorDetail(context, _currentSector()),
                    child: GlowCard(
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
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.chevron_right, color: ChiGlowTheme.bronzeGold, size: 22),
                          ),
                        ],
                      ),
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
                    child: GestureDetector(
                      onTap: () => _showSectorDetail(context, entry.value),
                      child: GlowCard(
                        child: Row(
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: ChiGlowTheme.richRed.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: Text(entry.value.emoji, style: const TextStyle(fontSize: 24))),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${entry.key} — ${entry.value.name}',
                                      style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
                                  Text('Element: ${entry.value.element}',
                                      style: GoogleFonts.quicksand(fontSize: 14, color: ChiGlowTheme.bronzeGold, fontWeight: FontWeight.w700)),
                                ],
                              ),
                            ),
                            Text(entry.key, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700, color: ChiGlowTheme.richRed)),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              const SizedBox(height: 8),
              const HomeButton(),
          ],  // close inner Column children
        ),  // close inner Column
      ),  // close SingleChildScrollView
    ),  // close Expanded
    ],  // close outer Column children
  ),  // close outer Column
),  // close SafeArea
);  // close Scaffold + return
  }

  void _showSectorDetail(BuildContext context, _BaguaSector sector) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.5,
        maxChildSize: 0.92,
        builder: (ctx, scrollController) => Container(
          decoration: const BoxDecoration(
            color: ChiGlowTheme.creamWhite,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
            children: [
              // Drag handle
              Center(
                child: Container(
                  width: 40, height: 4,
                  decoration: BoxDecoration(
                    color: ChiGlowTheme.richRed.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Header
              Row(
                children: [
                  Text(sector.emoji, style: const TextStyle(fontSize: 40)),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(sector.name, style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700, color: ChiGlowTheme.richRed)),
                        Text('Element: ${sector.element}', style: GoogleFonts.quicksand(fontSize: 16, color: ChiGlowTheme.bronzeGold, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Description
              Text(sector.description, style: GoogleFonts.quicksand(fontSize: 15, color: ChiGlowTheme.charcoal, height: 1.6)),
              const SizedBox(height: 24),
              // Enhance section
              _sectionHeader('🌸 Things to Enhance', Icons.add_circle_outline),
              const SizedBox(height: 8),
              ...sector.enhance.map((e) => _bulletItem(e, true)),
              const SizedBox(height: 24),
              // Avoid section
              _sectionHeader('⚠️ Things to Avoid', Icons.remove_circle_outline),
              const SizedBox(height: 8),
              ...sector.avoid.map((a) => _bulletItem(a, false)),
              const SizedBox(height: 24),
              // Tips section
              _sectionHeader('✨ Actionable Tips', Icons.auto_awesome),
              const SizedBox(height: 8),
              ...sector.tips.map((t) => _bulletItem(t, true)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 20, color: ChiGlowTheme.richRed),
        const SizedBox(width: 8),
        Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: ChiGlowTheme.richRed)),
      ],
    );
  }

  Widget _bulletItem(String text, bool isPositive) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Icon(
              isPositive ? Icons.circle : Icons.circle,
              size: 7,
              color: isPositive ? ChiGlowTheme.bronzeGold : ChiGlowTheme.softRed,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: GoogleFonts.quicksand(fontSize: 14, color: ChiGlowTheme.charcoal, height: 1.5)),
          ),
        ],
      ),
    );
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
  final String description;
  final List<String> enhance;
  final List<String> avoid;
  final List<String> tips;

  const _BaguaSector(
    this.name, this.emoji, this.element, this.color, {
    required this.description,
    required this.enhance,
    required this.avoid,
    required this.tips,
  });
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