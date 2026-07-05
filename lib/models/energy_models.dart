/// Energy area model for the Bagua map
class EnergyArea {
  final String name;
  final String emoji;
  final String description;
  final String element;
  final String colorHex;
  final int level; // 0-100 energy score

  const EnergyArea({
    required this.name,
    required this.emoji,
    required this.description,
    required this.element,
    required this.colorHex,
    this.level = 50,
  });

  EnergyArea copyWith({int? level}) {
    return EnergyArea(
      name: name,
      emoji: emoji,
      description: description,
      element: element,
      colorHex: colorHex,
      level: level ?? this.level,
    );
  }
}

/// Room model for storing scanned rooms
class RoomModel {
  final String id;
  final String name;
  final String roomType;
  final String? imagePath;
  final DateTime scanDate;
  final List<EnergyArea> energyAreas;

  RoomModel({
    required this.id,
    required this.name,
    this.roomType = 'Living Room',
    this.imagePath,
    DateTime? scanDate,
    List<EnergyArea>? energyAreas,
  })  : scanDate = scanDate ?? DateTime.now(),
        energyAreas = energyAreas ?? _defaultEnergyAreas();

  static List<EnergyArea> _defaultEnergyAreas() {
    return [
      const EnergyArea(name: 'Love', emoji: '💖', description: 'Relationships & partnership', element: 'Fire', colorHex: '#FF8A65', level: 50),
      const EnergyArea(name: 'Wealth', emoji: '💰', description: 'Abundance & prosperity', element: 'Wood', colorHex: '#4CAF50', level: 50),
      const EnergyArea(name: 'Health', emoji: '🌿', description: 'Wellness & vitality', element: 'Earth', colorHex: '#FFD700', level: 50),
      const EnergyArea(name: 'Career', emoji: '🧭', description: 'Life path & purpose', element: 'Water', colorHex: '#5B9BD5', level: 50),
    ];
  }
}

/// Chinese zodiac animal model
class ZodiacAnimal {
  final String name;
  final String year;
  final String element;
  final String description;
  final String luckyColor;
  final String luckyDirection;
  final List<String> compatibleWith;
  final List<String> incompatibleWith;

  const ZodiacAnimal({
    required this.name,
    required this.year,
    required this.element,
    required this.description,
    required this.luckyColor,
    required this.luckyDirection,
    required this.compatibleWith,
    required this.incompatibleWith,
  });
}

/// Feng Shui recommendation
class FengShuiTip {
  final String title;
  final String description;
  final String area;
  final String icon;

  const FengShuiTip({
    required this.title,
    required this.description,
    required this.area,
    required this.icon,
  });
}

/// Daily affirmation
class DailyAffirmation {
  final String text;
  final String theme;

  const DailyAffirmation({
    required this.text,
    required this.theme,
  });
}

/// Journal entry for a room scan with AI observations
class JournalEntry {
  final String id;
  final String roomType;
  final DateTime scanDate;
  final String? imagePath;
  final List<Map<String, String>> tips;
  final List<String> suggestedColors;
  final List<String> recommendedDirections;
  final String energyScore;
  final String overallDescription;
  final List<String> aiObservations;

  const JournalEntry({
    required this.id,
    required this.roomType,
    required this.scanDate,
    this.imagePath,
    required this.tips,
    required this.suggestedColors,
    required this.recommendedDirections,
    required this.energyScore,
    required this.overallDescription,
    required this.aiObservations,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'roomType': roomType,
    'scanDate': scanDate.toIso8601String(),
    'imagePath': imagePath,
    'tips': tips,
    'suggestedColors': suggestedColors,
    'recommendedDirections': recommendedDirections,
    'energyScore': energyScore,
    'overallDescription': overallDescription,
    'aiObservations': aiObservations,
  };

  factory JournalEntry.fromJson(Map<String, dynamic> json) => JournalEntry(
    id: json['id'] as String,
    roomType: json['roomType'] as String,
    scanDate: DateTime.parse(json['scanDate'] as String),
    imagePath: json['imagePath'] as String?,
    tips: (json['tips'] as List).cast<Map<String, String>>(),
    suggestedColors: (json['suggestedColors'] as List).cast<String>(),
    recommendedDirections: (json['recommendedDirections'] as List).cast<String>(),
    energyScore: json['energyScore'] as String,
    overallDescription: json['overallDescription'] as String,
    aiObservations: (json['aiObservations'] as List).cast<String>(),
  );
}