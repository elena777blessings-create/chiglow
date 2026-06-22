/// Offline content library for ChiGlow
/// Provides Feng Shui wisdom, affirmations, and zodiac content without internet.

class ContentService {
  static const List<Map<String, String>> affirmations = [
    {'text': 'I welcome harmony into my life today.', 'theme': 'Harmony'},
    {'text': 'I recognize the untapped potential within my space and myself.', 'theme': 'Potential'},
    {'text': 'Today, my energy flows like the koi — graceful and strong.', 'theme': 'Grace'},
    {'text': 'I breathe in abundance and release what no longer serves me.', 'theme': 'Release'},
    {'text': 'My home is my sanctuary, and I treat it with love today.', 'theme': 'Sanctuary'},
    {'text': 'Every morning is a fresh canvas, and I paint it with golden light.', 'theme': 'Renewal'},
    {'text': 'I am exactly where I need to be.', 'theme': 'Trust'},
    {'text': 'I create balance within my home and within myself.', 'theme': 'Balance'},
    {'text': 'I bring positive energy into every space I enter.', 'theme': 'Radiance'},
    {'text': 'I allow love to flourish where my energy flows freely.', 'theme': 'Love'},
    {'text': 'I attract abundance through intention and gratitude.', 'theme': 'Abundance'},
    {'text': 'My space reflects the clarity I carry within.', 'theme': 'Clarity'},
    {'text': 'I release what no longer serves my space or my spirit.', 'theme': 'Release'},
    {'text': 'I trust the natural flow of energy in my life.', 'theme': 'Flow'},
    {'text': 'I am worthy of prosperity in all its forms.', 'theme': 'Worthiness'},
  ];

  /// ChiGlow Wisdom Messages — signature phrases from the app itself
  static const List<String> wisdomMessages = [
    'Let harmony find you today.',
    'A gentle shift can invite great fortune.',
    'Your space holds untapped potential.',
    'Small adjustments create flowing energy.',
    'Balance is not something you find — it\'s something you create.',
    'Fortune favors the spaces we tend with intention.',
    'Clear the clutter, clear the path to clarity.',
  ];

  static String wisdomForToday() {
    final index = DateTime.now().day % wisdomMessages.length;
    return wisdomMessages[index];
  }

  static const Map<String, List<Map<String, String>>> roomTips = {
    'Living Room': [
      {'title': 'Balance the Elements', 'description': 'Incorporate wood (plants), fire (lighting), earth (ceramics), metal (decor), and water (fountains/blue) for harmony.', 'icon': '🌿'},
      {'title': 'Clear the Center', 'description': 'Keep the center of your living room open for chi to circulate freely. Avoid heavy furniture blocking the flow.', 'icon': '🌀'},
      {'title': 'Soft Lighting', 'description': 'Use warm, layered lighting to create a welcoming atmosphere. Avoid harsh fluorescent lights.', 'icon': '💡'},
    ],
    'Bedroom': [
      {'title': 'Command Position', 'description': 'Place your bed diagonally opposite the door, not in line with it, for a sense of safety and control.', 'icon': '🛏️'},
      {'title': 'Calming Colors', 'description': 'Use soft, soothing colors like gentle blues, lavenders, and warm neutrals. Avoid reds and bright oranges.', 'icon': '🎨'},
      {'title': 'Mirror Placement', 'description': 'Avoid mirrors facing the bed as they can disrupt sleep. Cover or reposition if needed.', 'icon': '🪞'},
    ],
    'Kitchen': [
      {'title': 'Stove Position', 'description': 'Your stove represents wealth. Keep it clean and use all burners regularly to activate prosperity energy.', 'icon': '🔥'},
      {'title': 'Declutter Counters', 'description': 'Clear countertops invite abundance energy. Store appliances in cabinets when not in use.', 'icon': '✨'},
      {'title': 'Greenery for Prosperity', 'description': 'Place a small plant or bowl of fruit on your kitchen counter to attract abundance and health.', 'icon': '🍎'},
    ],
    'Home Office': [
      {'title': 'Power Position', 'description': 'Face your desk toward the door but not directly in line with it. You should be able to see who enters.', 'icon': '🪑'},
      {'title': 'Activate Career Corner', 'description': 'Strengthen your career area (north) with water elements: a small fountain, blue decor, or an image of flowing water.', 'icon': '🧭'},
      {'title': 'Crystal for Focus', 'description': 'Place a clear quartz or amethyst on your desk to enhance clarity, focus, and positive energy.', 'icon': '💎'},
    ],
  };

  static const List<Map<String, String>> colorGuidance = [
    {'goal': 'Love & Relationships', 'color': 'Soft Pink', 'hex': '#FFB6C1', 'element': 'Fire', 'tip': 'Add pink accents in the southwest (relationship) area of your home.'},
    {'goal': 'Wealth & Abundance', 'color': 'Purple', 'hex': '#9C27B0', 'element': 'Wood', 'tip': 'Place purple items in the southeast wealth corner to activate prosperity.'},
    {'goal': 'Health & Family', 'color': 'Green', 'hex': '#4CAF50', 'element': 'Wood', 'tip': 'Green in the east (family/health) area promotes growth and vitality.'},
    {'goal': 'Career & Life Path', 'color': 'Blue', 'hex': '#5B9BD5', 'element': 'Water', 'tip': 'Use blue tones in the north career area to encourage flow and opportunity.'},
    {'goal': 'Fame & Reputation', 'color': 'Red', 'hex': '#F44336', 'element': 'Fire', 'tip': 'A red accent in the south (fame) area boosts recognition and passion.'},
    {'goal': 'Knowledge & Wisdom', 'color': 'Dark Blue', 'hex': '#1A237E', 'element': 'Water', 'tip': 'Dark blue in the northeast (knowledge) area enhances learning and meditation.'},
    {'goal': 'Helpful People', 'color': 'White', 'hex': '#FFFFFF', 'element': 'Metal', 'tip': 'White in the northwest (helpful people) area attracts mentors and support.'},
    {'goal': 'Creativity & Children', 'color': 'White/Metal', 'hex': '#E0E0E0', 'element': 'Metal', 'tip': 'Metallic whites and grays in the west (creativity) area inspire new projects.'},
    {'goal': 'Center & Harmony', 'color': 'Yellow', 'hex': '#FFD700', 'element': 'Earth', 'tip': 'Warm yellow tones in the center ground and balance all energies.'},
  ];

  static String affirmationForToday() {
    final index = DateTime.now().day % affirmations.length;
    return affirmations[index]['text']!;
  }

  static String affirmationThemeForToday() {
    final index = DateTime.now().day % affirmations.length;
    return affirmations[index]['theme']!;
  }

  static List<Map<String, String>> tipsForRoom(String roomType) {
    return roomTips[roomType] ?? roomTips['Living Room']!;
  }
}