import 'package:flutter/material.dart';
import '../models/energy_models.dart';
import '../services/energy_engine.dart';

class AppStateProvider extends ChangeNotifier {
  // ── User Info ──
  String _userName = '';
  String _zodiacSign = 'Dragon';
  int _birthYear = 2000;

  // ── Scanned Rooms ──
  List<RoomModel> _rooms = [];

  // ── Five Element Balance (computed from EnergyEngine) ──
  Map<String, int> _elementScores = {};

  // ── Bagua Life Area Scores (derived from element balance) ──
  int _loveScore = 50;
  int _wealthScore = 50;
  int _healthScore = 50;
  int _careerScore = 50;

  // ── Daily Affirmation ──
  String _dailyAffirmation =
      'Let harmony find you today. Your space holds untapped potential.';
  String _affirmationTheme = 'Harmony';

  // ── Constructor ──
  AppStateProvider() {
    _recalculateAll();
  }

  // ── Getters ──
  String get userName => _userName;
  String get zodiacSign => _zodiacSign;
  int get birthYear => _birthYear;
  List<RoomModel> get rooms => _rooms;
  Map<String, int> get elementScores => Map.unmodifiable(_elementScores);
  int get loveScore => _loveScore;
  int get wealthScore => _wealthScore;
  int get healthScore => _healthScore;
  int get careerScore => _careerScore;
  String get dailyAffirmation => _dailyAffirmation;
  String get affirmationTheme => _affirmationTheme;

  /// Returns the overall harmony score (average of all 4 Bagua scores).
  int get overallHarmony =>
      ((_loveScore + _wealthScore + _healthScore + _careerScore) / 4).round();

  // ── Core Recalculation Engine ──

  /// Recalculates the five-element balance and Bagua life area scores
  /// from the user's zodiac sign and birth year.
  void _recalculateAll() {
    final profile = EnergyEngine.calculateFullProfile(_zodiacSign, _birthYear);
    _elementScores = profile['elements']!;
    _loveScore = profile['bagua']!['Love']!;
    _wealthScore = profile['bagua']!['Wealth']!;
    _healthScore = profile['bagua']!['Health']!;
    _careerScore = profile['bagua']!['Career']!;
    notifyListeners();
  }

  // ── Setters with Recalculation ──

  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void setZodiacSign(String sign) {
    _zodiacSign = sign;
    _recalculateAll();
  }

  // ── Room Scan Integration ──

  void addRoom(RoomModel room) {
    _rooms.add(room);
    // Future: analyze room's element composition and blend into element scores
    // final scanData = _analyzeRoomElements(room);
    // _elementScores = EnergyEngine.blendRoomScan(
    //   _elementScores, scanData, scanCount: _rooms.length,
    // );
    // _recalculateBaguaScores();
    notifyListeners();
  }

  /// Manually update energy scores (used for future room scan hooks).
  /// Directly sets Bagua scores — use with calculated values from the engine.
  void updateEnergyScores({
    int? love,
    int? wealth,
    int? health,
    int? career,
  }) {
    if (love != null) _loveScore = love;
    if (wealth != null) _wealthScore = wealth;
    if (health != null) _healthScore = health;
    if (career != null) _careerScore = career;
    notifyListeners();
  }

  // ── Daily Affirmation ──

  void setDailyAffirmation(String text, String theme) {
    _dailyAffirmation = text;
    _affirmationTheme = theme;
    notifyListeners();
  }

  // ── Zodiac Reference Data ──

  /// Get zodiac animal details
  static const Map<String, Map<String, dynamic>> zodiacData = {
    'Rat': {
      'element': 'Water',
      'luckyColor': '#5B9BD5',
      'luckyDirection': 'Southeast',
      'compatible': ['Dragon', 'Monkey', 'Ox'],
      'incompatible': ['Horse', 'Rooster'],
      'description':
          'Quick-witted, resourceful, and versatile. You have a natural charm that draws people to you.',
    },
    'Ox': {
      'element': 'Earth',
      'luckyColor': '#FFD700',
      'luckyDirection': 'Northeast',
      'compatible': ['Rat', 'Snake', 'Rooster'],
      'incompatible': ['Tiger', 'Goat'],
      'description':
          'Diligent, dependable, and strong. Your determination moves mountains.',
    },
    'Tiger': {
      'element': 'Wood',
      'luckyColor': '#4CAF50',
      'luckyDirection': 'East',
      'compatible': ['Horse', 'Dog', 'Pig'],
      'incompatible': ['Monkey', 'Snake'],
      'description':
          'Brave, competitive, and confident. You lead with courage and passion.',
    },
    'Rabbit': {
      'element': 'Wood',
      'luckyColor': '#FF8A65',
      'luckyDirection': 'West',
      'compatible': ['Goat', 'Pig', 'Dog'],
      'incompatible': ['Rooster', 'Rat'],
      'description':
          'Gentle, elegant, and compassionate. Your kindness creates harmony.',
    },
    'Dragon': {
      'element': 'Earth',
      'luckyColor': '#FFD700',
      'luckyDirection': 'South',
      'compatible': ['Rat', 'Monkey', 'Rooster'],
      'incompatible': ['Dog', 'Rabbit'],
      'description':
          'Confident, ambitious, and charismatic. You inspire greatness in others.',
    },
    'Snake': {
      'element': 'Fire',
      'luckyColor': '#FF8A65',
      'luckyDirection': 'Southwest',
      'compatible': ['Ox', 'Rooster', 'Monkey'],
      'incompatible': ['Tiger', 'Pig'],
      'description':
          'Intelligent, intuitive, and wise. Your depth sees what others miss.',
    },
    'Horse': {
      'element': 'Fire',
      'luckyColor': '#CE93D8',
      'luckyDirection': 'Northwest',
      'compatible': ['Tiger', 'Goat', 'Dog'],
      'incompatible': ['Rat', 'Ox'],
      'description':
          'Energetic, free-spirited, and adventurous. Your passion lights the way.',
    },
    'Goat': {
      'element': 'Earth',
      'luckyColor': '#FFF8E7',
      'luckyDirection': 'South',
      'compatible': ['Rabbit', 'Horse', 'Pig'],
      'incompatible': ['Ox', 'Dog'],
      'description':
          'Creative, gentle, and peaceful. Your artistry brings beauty to the world.',
    },
    'Monkey': {
      'element': 'Metal',
      'luckyColor': '#9E9E9E',
      'luckyDirection': 'Northeast',
      'compatible': ['Rat', 'Dragon', 'Snake'],
      'incompatible': ['Tiger', 'Pig'],
      'description':
          'Witty, inventive, and playful. Your cleverness solves any puzzle.',
    },
    'Rooster': {
      'element': 'Metal',
      'luckyColor': '#FFD700',
      'luckyDirection': 'Southeast',
      'compatible': ['Ox', 'Dragon', 'Snake'],
      'incompatible': ['Rabbit', 'Rat'],
      'description':
          'Observant, hardworking, and courageous. Your precision brings excellence.',
    },
    'Dog': {
      'element': 'Earth',
      'luckyColor': '#5B9BD5',
      'luckyDirection': 'East',
      'compatible': ['Tiger', 'Rabbit', 'Horse'],
      'incompatible': ['Dragon', 'Goat'],
      'description':
          'Loyal, honest, and protective. Your faithfulness is your greatest strength.',
    },
    'Pig': {
      'element': 'Water',
      'luckyColor': '#4CAF50',
      'luckyDirection': 'West',
      'compatible': ['Tiger', 'Rabbit', 'Goat'],
      'incompatible': ['Snake', 'Monkey'],
      'description':
          'Generous, compassionate, and diligent. Your warmth enriches every life you touch.',
    },
  };
}