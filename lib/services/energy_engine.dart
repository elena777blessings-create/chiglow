/// Central ChiGlow energy calculation engine.
///
/// Connects Chinese Zodiac, Five Elements, Bagua, and current year energy
/// into one consistent system. Designed for future Room Scan integration.
///
/// ## Architecture
///   Zodiac + Year  ──►  Five Element Balance  ──►  Bagua Life Area Scores
///                          │                              │
///                     Room Scan Data                  Energy Dashboard
///                     (future blend)                  (Love, Wealth, etc.)
///
/// ## Design Principle
/// The engine is pure calculation logic — it reads business rules from
/// [EnergyConfig] and processes inputs. Changing weights, adding new
/// life areas, or adjusting cycle relationships happens in the config
/// file, never in the engine itself.
///
/// All methods are static and side-effect-free.
library;

import '../config/energy_config.dart';

class EnergyEngine {
  // ── Five Element Cycles ──

  /// Returns true if [parent] generates [child] in the Sheng cycle
  /// (Wood → Fire → Earth → Metal → Water → Wood).
  static bool generates(int parent, int child) =>
      EnergyConfig.generatingCycle[parent] == child;

  /// Returns true if [controller] controls [controlled] in the Ke cycle
  /// (Wood → Earth → Water → Fire → Metal → Wood).
  static bool controls(int controller, int controlled) =>
      EnergyConfig.controllingCycle[controller] == controlled;

  // ── Year Energy ──

  /// Returns the Heavenly Stem element index for the given [year].
  /// year % 10: 0-1→Metal, 2-3→Water, 4-5→Wood, 6-7→Fire, 8-9→Earth
  static int yearElementIndex(int year) =>
      EnergyConfig.stemElement[year % 10];

  // ── Core: Five Element Balance ──

  /// Calculates the 5-element balance from the user's [zodiacSign] and
  /// the current [year]'s Heavenly Stem energy.
  ///
  /// Returns a map of element name → score (10–95).
  ///
  /// ## Future Room Scan Expansion
  /// Pass the result through [blendRoomScan] to incorporate scanned room data
  /// without changing this function or any UI code.
  static Map<String, int> calculateElementBalance(
      String zodiacSign, int year) {
    final primary = EnergyConfig.zodiacElement[zodiacSign] ?? 2; // default Earth
    final yearElement = yearElementIndex(year);
    final scoring = EnergyConfig.elementBalanceScoring;
    final yearScoring = EnergyConfig.yearEnergyScoring;
    final labels = EnergyConfig.elementLabels;

    Map<String, int> scores = {};
    for (int i = 0; i < 5; i++) {
      int score = 50; // neutral base

      // Zodiac elemental relationship
      if (i == primary) {
        score += scoring['primaryElement'] as int;
      } else if (generates(primary, i)) {
        score += scoring['childElement'] as int;
      } else if (generates(i, primary)) {
        score += scoring['parentElement'] as int;
      } else if (controls(primary, i)) {
        score += scoring['controlledElement'] as int;
      } else if (controls(i, primary)) {
        score += scoring['controllingElement'] as int;
      }

      // Year energy modulation
      if (i == yearElement) {
        score += yearScoring['sameElement'] as int;
      } else if (generates(yearElement, i)) {
        score += yearScoring['nurturedElement'] as int;
      } else if (generates(i, yearElement)) {
        score += yearScoring['feedingElement'] as int;
      }

      scores[labels[i]] = score.clamp(10, 95);
    }

    return scores;
  }

  // ── Bagua Life Area Scores ──

  /// Derives Bagua life area scores from the [elementBalance].
  ///
  /// Each life area's score is calculated from the [EnergyConfig.baguaRules],
  /// which define the primary element, its weight, and supporting elements
  /// with their weights. This allows the scoring rules to be adjusted
  /// without changing the engine's calculation logic.
  static Map<String, int> calculateBaguaScores(Map<String, int> elements) {
    final labels = EnergyConfig.elementLabels;
    final rules = EnergyConfig.baguaRules;

    // Pre-compute element values for fast lookup
    final elementValues = <String, int>{
      for (final label in labels) label: elements[label] ?? 50,
    };

    // Pre-compute overall harmony (average of all 5 elements)
    final overallHarmony =
        elementValues.values.fold(0, (sum, v) => sum + v) / labels.length;

    Map<String, int> baguaScores = {};
    for (final area in rules.keys) {
      final rule = rules[area]!;
      final primary = rule['primary'] as String;
      final primaryWeight = rule['primaryWeight'] as double;
      final supporting = rule['supporting'] as Map<String, dynamic>;

      double score = elementValues[primary]! * primaryWeight;

      for (final supportingElement in supporting.keys) {
        final weight = supporting[supportingElement] as double;
        if (supportingElement == 'OverallHarmony') {
          score += overallHarmony * weight;
        } else {
          score += (elementValues[supportingElement] ?? 50) * weight;
        }
      }

      baguaScores[area] = score.round().clamp(10, 95);
    }

    return baguaScores;
  }

  /// Helper: calculate both element balance and bagua scores in one call.
  static Map<String, Map<String, int>> calculateFullProfile(
      String zodiacSign, int year) {
    final elements = calculateElementBalance(zodiacSign, year);
    final bagua = calculateBaguaScores(elements);
    return {'elements': elements, 'bagua': bagua};
  }

  // ── Room Scan Integration (Future) ──

  /// Blends room scan element data into the existing [elementBalance].
  ///
  /// [scanData] maps element names to detected intensity (0.0–1.0),
  /// e.g. {'Wood': 0.8, 'Fire': 0.3} from analyzing room colors, materials, etc.
  ///
  /// The blend ratio is controlled by [EnergyConfig.roomScanMaxBlend] and
  /// [EnergyConfig.roomScanBlendPerScan] — configurable without code changes.
  static Map<String, int> blendRoomScan(
    Map<String, int> elementBalance,
    Map<String, double> scanData, {
    int scanCount = 0,
  }) {
    final blendWeight =
        (scanCount * EnergyConfig.roomScanBlendPerScan)
            .clamp(0.0, EnergyConfig.roomScanMaxBlend);

    if (blendWeight <= 0) return Map.from(elementBalance);

    final result = Map<String, int>.from(elementBalance);
    for (final element in EnergyConfig.elementLabels) {
      final base = elementBalance[element] ?? 50;
      final scanValue = (scanData[element] ?? 0.5) * 100;
      result[element] =
          (base * (1 - blendWeight) + scanValue * blendWeight)
              .round()
              .clamp(10, 95);
    }
    return result;
  }
}