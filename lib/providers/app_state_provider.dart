import 'package:flutter/material.dart';
import '../models/energy_models.dart';

class AppStateProvider extends ChangeNotifier {
  // User info
  String _userName = '';
  String _zodiacSign = 'Dragon';
  int _birthYear = 2000;

  // Scanned rooms
  List<RoomModel> _rooms = [];

  // Energy scores
  int _loveScore = 45;
  int _wealthScore = 60;
  int _healthScore = 70;
  int _careerScore = 55;

  // Daily affirmation
  String _dailyAffirmation = 'Let harmony find you today. Your space holds untapped potential.';
  String _affirmationTheme = 'Harmony';

  // Getters
  String get userName => _userName;
  String get zodiacSign => _zodiacSign;
  int get birthYear => _birthYear;
  List<RoomModel> get rooms => _rooms;
  int get loveScore => _loveScore;
  int get wealthScore => _wealthScore;
  int get healthScore => _healthScore;
  int get careerScore => _careerScore;
  String get dailyAffirmation => _dailyAffirmation;
  String get affirmationTheme => _affirmationTheme;

  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void setZodiacSign(String sign) {
    _zodiacSign = sign;
    notifyListeners();
  }

  void addRoom(RoomModel room) {
    _rooms.add(room);
    notifyListeners();
  }

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

  void setDailyAffirmation(String text, String theme) {
    _dailyAffirmation = text;
    _affirmationTheme = theme;
    notifyListeners();
  }

  /// Get zodiac animal details
  static const Map<String, Map<String, dynamic>> zodiacData = {
    'Rat': {
      'element': 'Water',
      'luckyColor': 'Blue',
      'luckyDirection': 'Southeast',
      'compatible': ['Dragon', 'Monkey', 'Ox'],
      'incompatible': ['Horse', 'Rooster'],
      'description': 'Quick-witted, resourceful, and versatile. You have a natural charm that draws people to you.',
    },
    'Ox': {
      'element': 'Earth',
      'luckyColor': 'Gold',
      'luckyDirection': 'Northeast',
      'compatible': ['Rat', 'Snake', 'Rooster'],
      'incompatible': ['Tiger', 'Goat'],
      'description': 'Diligent, dependable, and strong. Your determination moves mountains.',
    },
    'Tiger': {
      'element': 'Wood',
      'luckyColor': 'Green',
      'luckyDirection': 'East',
      'compatible': ['Horse', 'Dog', 'Pig'],
      'incompatible': ['Monkey', 'Snake'],
      'description': 'Brave, competitive, and confident. You lead with courage and passion.',
    },
    'Rabbit': {
      'element': 'Wood',
      'luckyColor': 'Orange',
      'luckyDirection': 'West',
      'compatible': ['Goat', 'Pig', 'Dog'],
      'incompatible': ['Rooster', 'Rat'],
      'description': 'Gentle, elegant, and compassionate. Your kindness creates harmony.',
    },
    'Dragon': {
      'element': 'Earth',
      'luckyColor': 'Gold',
      'luckyDirection': 'South',
      'compatible': ['Rat', 'Monkey', 'Rooster'],
      'incompatible': ['Dog', 'Rabbit'],
      'description': 'Confident, ambitious, and charismatic. You inspire greatness in others.',
    },
    'Snake': {
      'element': 'Fire',
      'luckyColor': 'Orange',
      'luckyDirection': 'Southwest',
      'compatible': ['Ox', 'Rooster', 'Monkey'],
      'incompatible': ['Tiger', 'Pig'],
      'description': 'Intelligent, intuitive, and wise. Your depth sees what others miss.',
    },
    'Horse': {
      'element': 'Fire',
      'luckyColor': 'Purple',
      'luckyDirection': 'Northwest',
      'compatible': ['Tiger', 'Goat', 'Dog'],
      'incompatible': ['Rat', 'Ox'],
      'description': 'Energetic, free-spirited, and adventurous. Your passion lights the way.',
    },
    'Goat': {
      'element': 'Earth',
      'luckyColor': 'White',
      'luckyDirection': 'South',
      'compatible': ['Rabbit', 'Horse', 'Pig'],
      'incompatible': ['Ox', 'Dog'],
      'description': 'Creative, gentle, and peaceful. Your artistry brings beauty to the world.',
    },
    'Monkey': {
      'element': 'Metal',
      'luckyColor': 'Gray',
      'luckyDirection': 'Northeast',
      'compatible': ['Rat', 'Dragon', 'Snake'],
      'incompatible': ['Tiger', 'Pig'],
      'description': 'Witty, inventive, and playful. Your cleverness solves any puzzle.',
    },
    'Rooster': {
      'element': 'Metal',
      'luckyColor': 'Gold',
      'luckyDirection': 'Southeast',
      'compatible': ['Ox', 'Dragon', 'Snake'],
      'incompatible': ['Rabbit', 'Rat'],
      'description': 'Observant, hardworking, and courageous. Your precision brings excellence.',
    },
    'Dog': {
      'element': 'Earth',
      'luckyColor': 'Blue',
      'luckyDirection': 'East',
      'compatible': ['Tiger', 'Rabbit', 'Horse'],
      'incompatible': ['Dragon', 'Goat'],
      'description': 'Loyal, honest, and protective. Your faithfulness is your greatest strength.',
    },
    'Pig': {
      'element': 'Water',
      'luckyColor': 'Green',
      'luckyDirection': 'West',
      'compatible': ['Tiger', 'Rabbit', 'Goat'],
      'incompatible': ['Snake', 'Monkey'],
      'description': 'Generous, compassionate, and diligent. Your warmth enriches every life you touch.',
    },
  };
}