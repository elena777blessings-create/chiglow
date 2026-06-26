import 'package:flutter/material.dart';
import '../models/energy_models.dart';
import '../services/kua_calculator.dart';

class AppStateProvider extends ChangeNotifier {
  // User info
  String _userName = '';
  String _zodiacSign = 'Dragon';
  int _birthYear = 2000;
  bool _isMale = true;
  int? _kuaNumber;

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
  bool get isMale => _isMale;
  int? get kuaNumber => _kuaNumber;
  List<RoomModel> get rooms => _rooms;
  int get loveScore => _loveScore;
  int get wealthScore => _wealthScore;
  int get healthScore => _healthScore;
  int get careerScore => _careerScore;
  String get dailyAffirmation => _dailyAffirmation;
  String get affirmationTheme => _affirmationTheme;

  /// Get the user's Kua reading (calculates if needed)
  Map<String, dynamic> get kuaReading {
    final kua = _kuaNumber ?? KuaCalculator.calculateKua(_birthYear, _isMale);
    return KuaCalculator.getPersonalReading(_birthYear, _isMale);
  }

  String get kuaGroup => KuaCalculator.getGroup(_kuaNumber ?? KuaCalculator.calculateKua(_birthYear, _isMale));
  String get kuaElement => KuaCalculator.getElement(_kuaNumber ?? KuaCalculator.calculateKua(_birthYear, _isMale));

  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void setZodiacSign(String sign) {
    _zodiacSign = sign;
    notifyListeners();
  }

  void setBirthYear(int year) {
    _birthYear = year;
    _kuaNumber = KuaCalculator.calculateKua(year, _isMale);
    notifyListeners();
  }

  void setGender(bool isMale) {
    _isMale = isMale;
    _kuaNumber = KuaCalculator.calculateKua(_birthYear, isMale);
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
      'luckyColor': '#5B9BD5',
      'luckyDirection': 'Southeast',
      'compatible': ['Dragon', 'Monkey', 'Ox'],
      'incompatible': ['Horse', 'Rooster'],
      'description': 'Quick-witted, resourceful, and versatile. You have a natural charm that draws people to you.',
    },
    'Ox': {
      'element': 'Earth',
      'luckyColor': '#FFD700',
      'luckyDirection': 'Northeast',
      'compatible': ['Rat', 'Snake', 'Rooster'],
      'incompatible': ['Tiger', 'Goat'],
      'description': 'Diligent, dependable, and strong. Your determination moves mountains.',
    },
    'Tiger': {
      'element': 'Wood',
      'luckyColor': '#4CAF50',
      'luckyDirection': 'East',
      'compatible': ['Horse', 'Dog', 'Pig'],
      'incompatible': ['Monkey', 'Snake'],
      'description': 'Brave, competitive, and confident. You lead with courage and passion.',
    },
    'Rabbit': {
      'element': 'Wood',
      'luckyColor': '#FF8A65',
      'luckyDirection': 'West',
      'compatible': ['Goat', 'Pig', 'Dog'],
      'incompatible': ['Rooster', 'Rat'],
      'description': 'Gentle, elegant, and compassionate. Your kindness creates harmony.',
    },
    'Dragon': {
      'element': 'Earth',
      'luckyColor': '#FFD700',
      'luckyDirection': 'South',
      'compatible': ['Rat', 'Monkey', 'Rooster'],
      'incompatible': ['Dog', 'Rabbit'],
      'description': 'Confident, ambitious, and charismatic. You inspire greatness in others.',
    },
    'Snake': {
      'element': 'Fire',
      'luckyColor': '#FF8A65',
      'luckyDirection': 'Southwest',
      'compatible': ['Ox', 'Rooster', 'Monkey'],
      'incompatible': ['Tiger', 'Pig'],
      'description': 'Intelligent, intuitive, and wise. Your depth sees what others miss.',
    },
    'Horse': {
      'element': 'Fire',
      'luckyColor': '#CE93D8',
      'luckyDirection': 'Northwest',
      'compatible': ['Tiger', 'Goat', 'Dog'],
      'incompatible': ['Rat', 'Ox'],
      'description': 'Energetic, free-spirited, and adventurous. Your passion lights the way.',
    },
    'Goat': {
      'element': 'Earth',
      'luckyColor': '#FFF8E7',
      'luckyDirection': 'South',
      'compatible': ['Rabbit', 'Horse', 'Pig'],
      'incompatible': ['Ox', 'Dog'],
      'description': 'Creative, gentle, and peaceful. Your artistry brings beauty to the world.',
    },
    'Monkey': {
      'element': 'Metal',
      'luckyColor': '#9E9E9E',
      'luckyDirection': 'Northeast',
      'compatible': ['Rat', 'Dragon', 'Snake'],
      'incompatible': ['Tiger', 'Pig'],
      'description': 'Witty, inventive, and playful. Your cleverness solves any puzzle.',
    },
    'Rooster': {
      'element': 'Metal',
      'luckyColor': '#FFD700',
      'luckyDirection': 'Southeast',
      'compatible': ['Ox', 'Dragon', 'Snake'],
      'incompatible': ['Rabbit', 'Rat'],
      'description': 'Observant, hardworking, and courageous. Your precision brings excellence.',
    },
    'Dog': {
      'element': 'Earth',
      'luckyColor': '#5B9BD5',
      'luckyDirection': 'East',
      'compatible': ['Tiger', 'Rabbit', 'Horse'],
      'incompatible': ['Dragon', 'Goat'],
      'description': 'Loyal, honest, and protective. Your faithfulness is your greatest strength.',
    },
    'Pig': {
      'element': 'Water',
      'luckyColor': '#4CAF50',
      'luckyDirection': 'West',
      'compatible': ['Tiger', 'Rabbit', 'Goat'],
      'incompatible': ['Snake', 'Monkey'],
      'description': 'Generous, compassionate, and diligent. Your warmth enriches every life you touch.',
    },
  };
}