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
/// All calculations are pure functions — no side effects, no state.
class EnergyEngine {
  // ── Element Index Reference ──
  // 0: Wood, 1: Fire, 2: Earth, 3: Metal, 4: Water
  static const elementLabels = ['Wood', 'Fire', 'Earth', 'Metal', 'Water'];

  // ── Zodiac → Primary Element ──
  static const _zodiacElement = <String, int>{
    'Rat': 4, 'Ox': 2, 'Tiger': 0, 'Rabbit': 0,
    'Dragon': 2, 'Snake': 1, 'Horse': 1, 'Goat': 2,
    'Monkey': 3, 'Rooster': 3, 'Dog': 2, 'Pig': 4,
  };

  // ── Five Element Cycles ──

  /// Generating (Sheng) cycle: Wood → Fire → Earth → Metal → Water → Wood
  /// Returns true if [parent] generates [child].
  static bool generates(int parent, int child) => (parent + 1) % 5 == child;

  /// Controlling (Ke) cycle: Wood → Earth → Water → Fire → Metal → Wood
  /// Returns true if [controller] controls [controlled].
  static bool controls(int controller, int controlled) =>
      (controller + 2) % 5 == controlled;

  // ── Year Energy ──

  /// Returns the Heavenly Stem element index for the given [year].
  /// year % 10: 0-1→Metal, 2-3→Water, 4-5→Wood, 6-7→Fire, 8-9→Earth
  static int yearElementIndex(int year) {
    const stemElement = [3, 3, 4, 4, 0, 0, 1, 1, 2, 2];
    return stemElement[year % 10];
  }

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
    final primary = _zodiacElement[zodiacSign] ?? 2; // default Earth
    final yearElement = yearElementIndex(year);

    Map<String, int> scores = {};
    for (int i = 0; i < 5; i++) {
      int score = 50; // neutral base

      // Zodiac elemental relationship
      if (i == primary) {
        score += 25; // primary element is strongest
      } else if (generates(primary, i)) {
        score += 5; // child of primary (primary generates this)
      } else if (generates(i, primary)) {
        score += 10; // parent of primary (this generates primary)
      } else if (controls(primary, i)) {
        score -= 5; // controlled by primary
      } else if (controls(i, primary)) {
        score -= 10; // controls primary
      }

      // Year energy modulation
      if (i == yearElement) {
        score += 12; // year's element resonates
      } else if (generates(yearElement, i)) {
        score += 6; // year's energy nurtures this element
      } else if (generates(i, yearElement)) {
        score += 4; // this element feeds the year's energy
      }

      scores[elementLabels[i]] = score.clamp(10, 95);
    }

    return scores;
  }

  // ── Bagua Life Area Scores ──

  /// Derives Bagua life area scores from the [elementBalance].
  ///
  /// Each life area has a primary element and supporting elements
  /// based on the Generating cycle:
  ///
  /// | Life Area    | Primary Element | Supporting Elements |
  /// |-------------|----------------|-------------------|
  /// | Love        | Earth          | Fire (parent), Metal (child) |
  /// | Wealth      | Wood           | Water (parent), Fire (child) |
  /// | Health      | Harmony + Earth| All 5 elements, Earth-weighted |
  /// | Career      | Water          | Metal (parent), Wood (child) |
  static Map<String, int> calculateBaguaScores(Map<String, int> elements) {
    final wood = elements['Wood'] ?? 50;
    final fire = elements['Fire'] ?? 50;
    final earth = elements['Earth'] ?? 50;
    final metal = elements['Metal'] ?? 50;
    final water = elements['Water'] ?? 50;

    // ❤️ Love & Relationships → Earth (Southwest)
    // Primary: Earth, supporting: Fire (generates Earth), Metal (Earth generates)
    final love = (earth * 0.50 + fire * 0.25 + metal * 0.25).round();

    // 💰 Wealth & Prosperity → Wood (Southeast)
    // Primary: Wood, supporting: Water (generates Wood), Fire (Wood generates)
    final wealth = (wood * 0.50 + water * 0.25 + fire * 0.25).round();

    // 💚 Health → Overall Harmony, Earth-weighted
    // All five elements contribute, with Earth as the central influence
    final avgAll = (wood + fire + earth + metal + water) / 5;
    final health = (earth * 0.40 + avgAll * 0.60).round();

    // 💼 Career → Water (North)
    // Primary: Water, supporting: Metal (generates Water), Wood (Water generates)
    final career = (water * 0.50 + metal * 0.25 + wood * 0.25).round();

    return {
      'Love': love.clamp(10, 95),
      'Wealth': wealth.clamp(10, 95),
      'Health': health.clamp(10, 95),
      'Career': career.clamp(10, 95),
    };
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
  /// The blend ratio gradually shifts toward the scanned environment
  /// as more rooms are scanned. Currently returns a placeholder —
  /// the architecture is ready for when room scan analysis is implemented.
  static Map<String, int> blendRoomScan(
    Map<String, int> elementBalance,
    Map<String, double> scanData, {
    int scanCount = 0,
  }) {
    // Blend weight: more scans = greater influence
    final blendWeight = (scanCount * 0.05).clamp(0.0, 0.4);

    if (blendWeight <= 0) return Map.from(elementBalance);

    final result = Map<String, int>.from(elementBalance);
    for (final element in elementLabels) {
      final base = elementBalance[element] ?? 50;
      final scanValue = (scanData[element] ?? 0.5) * 100;
      result[element] =
          (base * (1 - blendWeight) + scanValue * blendWeight).round().clamp(10, 95);
    }
    return result;
  }
}