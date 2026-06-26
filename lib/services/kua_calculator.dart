/// ChiGlow Kua Number Calculator
/// Based on traditional Feng Shui — calculates personal lucky & unlucky directions
/// from birth year and gender.

class KuaCalculator {
  /// Calculate Kua number from birth year and gender
  /// Returns 1-9 (5 becomes 2 for males, 8 for females)
  static int calculateKua(int birthYear, bool isMale) {
    // Step 1: Sum the digits of the birth year
    int yearSum = _sumDigits(birthYear);
    
    // Step 2: Reduce to single digit
    while (yearSum > 9) {
      yearSum = _sumDigits(yearSum);
    }
    
    // Step 3: Calculate based on gender
    int kua;
    if (isMale) {
      kua = 11 - yearSum;
    } else {
      kua = 4 + yearSum;
    }
    
    // Step 4: Reduce to single digit
    while (kua > 9) {
      kua = kua - 9;
    }
    
    // Step 5: Handle Kua 5 (becomes 2 for males, 8 for females)
    if (kua == 5) {
      return isMale ? 2 : 8;
    }
    
    return kua;
  }
  
  static int _sumDigits(int number) {
    int sum = 0;
    while (number > 0) {
      sum += number % 10;
      number ~/= 10;
    }
    return sum;
  }
  
  /// Get directions for a Kua number
  static Map<String, Map<String, dynamic>> getDirections(int kua) {
    return _kuaDirections[kua] ?? _kuaDirections[1]!;
  }
  
  /// Get Kua group (East or West)
  static String getGroup(int kua) {
    return [1, 3, 4, 9].contains(kua) ? 'East Group' : 'West Group';
  }
  
  /// Get element for Kua number
  static String getElement(int kua) {
    switch (kua) {
      case 1: return 'Water';
      case 2: case 5: case 8: return 'Earth';
      case 3: case 4: return 'Wood';
      case 6: case 7: return 'Metal';
      case 9: return 'Fire';
      default: return 'Earth';
    }
  }

  static const Map<int, Map<String, Map<String, dynamic>>> _kuaDirections = {
    1: {
      'shengChi':  {'direction': 'Southeast', 'area': 'Wealth & Abundance',      'emoji': '💰'},
      'tienYi':    {'direction': 'East',       'area': 'Health & Family',        'emoji': '🌿'},
      'nienYen':   {'direction': 'South',      'area': 'Love & Relationships',   'emoji': '💖'},
      'fuWei':     {'direction': 'North',      'area': 'Personal Growth',        'emoji': '✨'},
      'hoHai':     {'direction': 'West',       'area': 'Misfortune — Avoid',     'emoji': '⚠️'},
      'wuGwei':    {'direction': 'Southwest',  'area': 'Five Ghosts — Caution',  'emoji': '⚠️'},
      'liuSha':    {'direction': 'Northwest',  'area': 'Six Killings — Avoid',   'emoji': '🔴'},
      'chuehMing': {'direction': 'Northeast',  'area': 'Total Loss — Avoid',     'emoji': '🔴'},
    },
    2: {
      'shengChi':  {'direction': 'Northeast',  'area': 'Wealth & Abundance',      'emoji': '💰'},
      'tienYi':    {'direction': 'West',       'area': 'Health & Family',        'emoji': '🌿'},
      'nienYen':   {'direction': 'Northwest',  'area': 'Love & Relationships',   'emoji': '💖'},
      'fuWei':     {'direction': 'Southwest',  'area': 'Personal Growth',        'emoji': '✨'},
      'hoHai':     {'direction': 'East',       'area': 'Misfortune — Avoid',     'emoji': '⚠️'},
      'wuGwei':    {'direction': 'Southeast',  'area': 'Five Ghosts — Caution',  'emoji': '⚠️'},
      'liuSha':    {'direction': 'South',      'area': 'Six Killings — Avoid',   'emoji': '🔴'},
      'chuehMing': {'direction': 'North',      'area': 'Total Loss — Avoid',     'emoji': '🔴'},
    },
    3: {
      'shengChi':  {'direction': 'South',      'area': 'Wealth & Abundance',      'emoji': '💰'},
      'tienYi':    {'direction': 'North',      'area': 'Health & Family',        'emoji': '🌿'},
      'nienYen':   {'direction': 'Southeast',  'area': 'Love & Relationships',   'emoji': '💖'},
      'fuWei':     {'direction': 'East',       'area': 'Personal Growth',        'emoji': '✨'},
      'hoHai':     {'direction': 'Northeast',  'area': 'Misfortune — Avoid',     'emoji': '⚠️'},
      'wuGwei':    {'direction': 'Southwest',  'area': 'Five Ghosts — Caution',  'emoji': '⚠️'},
      'liuSha':    {'direction': 'Northwest',  'area': 'Six Killings — Avoid',   'emoji': '🔴'},
      'chuehMing': {'direction': 'West',       'area': 'Total Loss — Avoid',     'emoji': '🔴'},
    },
    4: {
      'shengChi':  {'direction': 'North',      'area': 'Wealth & Abundance',      'emoji': '💰'},
      'tienYi':    {'direction': 'South',      'area': 'Health & Family',        'emoji': '🌿'},
      'nienYen':   {'direction': 'East',       'area': 'Love & Relationships',   'emoji': '💖'},
      'fuWei':     {'direction': 'Southeast',  'area': 'Personal Growth',        'emoji': '✨'},
      'hoHai':     {'direction': 'West',       'area': 'Misfortune — Avoid',     'emoji': '⚠️'},
      'wuGwei':    {'direction': 'Northwest',  'area': 'Five Ghosts — Caution',  'emoji': '⚠️'},
      'liuSha':    {'direction': 'Northeast',  'area': 'Six Killings — Avoid',   'emoji': '🔴'},
      'chuehMing': {'direction': 'Southwest',  'area': 'Total Loss — Avoid',     'emoji': '🔴'},
    },
    6: {
      'shengChi':  {'direction': 'West',       'area': 'Wealth & Abundance',      'emoji': '💰'},
      'tienYi':    {'direction': 'Northeast',  'area': 'Health & Family',        'emoji': '🌿'},
      'nienYen':   {'direction': 'Southwest',  'area': 'Love & Relationships',   'emoji': '💖'},
      'fuWei':     {'direction': 'Northwest',  'area': 'Personal Growth',        'emoji': '✨'},
      'hoHai':     {'direction': 'Southeast',  'area': 'Misfortune — Avoid',     'emoji': '⚠️'},
      'wuGwei':    {'direction': 'North',      'area': 'Five Ghosts — Caution',  'emoji': '⚠️'},
      'liuSha':    {'direction': 'East',       'area': 'Six Killings — Avoid',   'emoji': '🔴'},
      'chuehMing': {'direction': 'South',      'area': 'Total Loss — Avoid',     'emoji': '🔴'},
    },
    7: {
      'shengChi':  {'direction': 'Northwest',  'area': 'Wealth & Abundance',      'emoji': '💰'},
      'tienYi':    {'direction': 'Southwest',  'area': 'Health & Family',        'emoji': '🌿'},
      'nienYen':   {'direction': 'Northeast',  'area': 'Love & Relationships',   'emoji': '💖'},
      'fuWei':     {'direction': 'West',       'area': 'Personal Growth',        'emoji': '✨'},
      'hoHai':     {'direction': 'North',      'area': 'Misfortune — Avoid',     'emoji': '⚠️'},
      'wuGwei':    {'direction': 'East',       'area': 'Five Ghosts — Caution',  'emoji': '⚠️'},
      'liuSha':    {'direction': 'Southeast',  'area': 'Six Killings — Avoid',   'emoji': '🔴'},
      'chuehMing': {'direction': 'South',      'area': 'Total Loss — Avoid',     'emoji': '🔴'},
    },
    8: {
      'shengChi':  {'direction': 'Southwest',  'area': 'Wealth & Abundance',      'emoji': '💰'},
      'tienYi':    {'direction': 'Northwest',  'area': 'Health & Family',        'emoji': '🌿'},
      'nienYen':   {'direction': 'West',       'area': 'Love & Relationships',   'emoji': '💖'},
      'fuWei':     {'direction': 'Northeast',  'area': 'Personal Growth',        'emoji': '✨'},
      'hoHai':     {'direction': 'Southeast',  'area': 'Misfortune — Avoid',     'emoji': '⚠️'},
      'wuGwei':    {'direction': 'East',       'area': 'Five Ghosts — Caution',  'emoji': '⚠️'},
      'liuSha':    {'direction': 'North',      'area': 'Six Killings — Avoid',   'emoji': '🔴'},
      'chuehMing': {'direction': 'South',      'area': 'Total Loss — Avoid',     'emoji': '🔴'},
    },
    9: {
      'shengChi':  {'direction': 'East',       'area': 'Wealth & Abundance',      'emoji': '💰'},
      'tienYi':    {'direction': 'Southeast',  'area': 'Health & Family',        'emoji': '🌿'},
      'nienYen':   {'direction': 'North',      'area': 'Love & Relationships',   'emoji': '💖'},
      'fuWei':     {'direction': 'South',      'area': 'Personal Growth',        'emoji': '✨'},
      'hoHai':     {'direction': 'Southwest',  'area': 'Misfortune — Avoid',     'emoji': '⚠️'},
      'wuGwei':    {'direction': 'Northeast',  'area': 'Five Ghosts — Caution',  'emoji': '⚠️'},
      'liuSha':    {'direction': 'West',       'area': 'Six Killings — Avoid',   'emoji': '🔴'},
      'chuehMing': {'direction': 'Northwest',  'area': 'Total Loss — Avoid',     'emoji': '🔴'},
    },
  };

  /// Get simple personalized reading
  static Map<String, dynamic> getPersonalReading(int birthYear, bool isMale) {
    final kua = calculateKua(birthYear, isMale);
    final directions = getDirections(kua);
    final group = getGroup(kua);
    final element = getElement(kua);
    
    return {
      'kua': kua,
      'group': group,
      'element': element,
      'lucky': [
        {'name': 'Wealth', 'direction': directions['shengChi']!['direction'], 'emoji': '💰'},
        {'name': 'Health', 'direction': directions['tienYi']!['direction'], 'emoji': '🌿'},
        {'name': 'Love', 'direction': directions['nienYen']!['direction'], 'emoji': '💖'},
        {'name': 'Growth', 'direction': directions['fuWei']!['direction'], 'emoji': '✨'},
      ],
      'unlucky': [
        {'name': 'Misfortune', 'direction': directions['hoHai']!['direction'], 'emoji': '⚠️'},
        {'name': 'Conflict', 'direction': directions['wuGwei']!['direction'], 'emoji': '⚠️'},
        {'name': 'Violence', 'direction': directions['liuSha']!['direction'], 'emoji': '🔴'},
        {'name': 'Loss', 'direction': directions['chuehMing']!['direction'], 'emoji': '🔴'},
      ],
    };
  }
}