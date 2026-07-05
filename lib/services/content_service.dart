/// Offline content library for ChiGlow
/// Provides Feng Shui wisdom, affirmations, and zodiac content without internet.

class ContentService {
  static const List<Map<String, String>> affirmations = [
    {'text': 'Let harmony find you today. Your space holds untapped potential.', 'theme': 'Harmony'},
    {'text': 'As water flows, so does abundance into your life.', 'theme': 'Abundance'},
    {'text': 'Your home is your sanctuary. Nurture it, and it nurtures you.', 'theme': 'Sanctuary'},
    {'text': 'Clear the clutter, clear the mind. Space breathes possibility.', 'theme': 'Clarity'},
    {'text': 'Like the lotus, rise from the mud and bloom beautifully.', 'theme': 'Growth'},
    {'text': 'Every corner of your home holds a blessing waiting to unfold.', 'theme': 'Blessings'},
    {'text': 'Balance is not something you find; it is something you create.', 'theme': 'Balance'},
    {'text': 'The energy you put into your space returns to you tenfold.', 'theme': 'Energy'},
    {'text': 'Let warm light fill your rooms, and warmth will fill your heart.', 'theme': 'Warmth'},
    {'text': 'Your direction today is guided by ancient wisdom.', 'theme': 'Guidance'},
  ];

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
    'Dining Room': [
      {'title': 'Round Table', 'description': 'A round or oval table promotes equality and harmony among diners, allowing chi to flow evenly around the table.', 'icon': '🟤'},
      {'title': 'Brighten the Space', 'description': 'Good lighting over the dining table symbolizes abundance. Use a warm dimmer chandelier or pendant light.', 'icon': '💡'},
      {'title': 'Mirror for Abundance', 'description': 'Hanging a mirror reflecting the dining table visually doubles your food, symbolizing doubled prosperity.', 'icon': '🪞'},
    ],
    'Entryway': [
      {'title': 'Welcome Chi', 'description': 'Keep the entryway bright, clean, and clutter-free so that positive energy can enter your home freely.', 'icon': '🚪'},
      {'title': 'Commanding View', 'description': 'Place a small mirror or artwork at eye level to create an expansive first impression and invite opportunity.', 'icon': '🖼️'},
      {'title': 'Grounding Element', 'description': 'A bowl of fresh flowers or a plant in the entryway brings the wood element and lively chi into your home.', 'icon': '🌸'},
    ],
    'Office': [
      {'title': 'Desk Command Position', 'description': 'Position your desk facing the entrance from a diagonal angle so you can see the door while working.', 'icon': '🪑'},
      {'title': 'Activate Wealth Corner', 'description': 'Place a small water feature or purple item in the southeast corner of your office to attract career growth.', 'icon': '🧭'},
      {'title': 'Declutter for Flow', 'description': 'Keep your desk surface clear of non-essentials. Stagnant clutter blocks chi and slows productivity.', 'icon': '📋'},
    ],
    'Garden': [
      {'title': 'Flowing Pathways', 'description': 'Design gently curving paths rather than straight lines to slow chi and invite peaceful wandering.', 'icon': '🌳'},
      {'title': 'Five Element Balance', 'description': 'Include plants (wood), solar lights (fire), stone sculptures (earth), wind chimes (metal), and a birdbath (water).', 'icon': '⚖️'},
      {'title': 'Nurture the Southeast', 'description': 'Plant flowering shrubs or fruit trees in the southeast garden corner to activate wealth and abundance energy.', 'icon': '🌺'},
    ],
    'Front Yard': [
      {'title': 'Clear Approach', 'description': 'Keep the front walkway unobstructed and well-lit. A clear path invites auspicious chi to your door.', 'icon': '🌿'},
      {'title': 'Welcoming Entrance', 'description': 'A warm, inviting front door — painted red or rich brown — signals abundance and protection to all who arrive.', 'icon': '🚪'},
      {'title': 'Guardian Plants', 'description': 'Place tall, healthy plants or shrubs on either side of the entrance to act as guardians and balance energy.', 'icon': '🌲'},
    ],
    'Backyard': [
      {'title': 'Private Sanctuary', 'description': 'Create a secluded seating area with soft lighting for relaxation. This is your personal retreat for recharging chi.', 'icon': '🪑'},
      {'title': 'Water Feature', 'description': 'A small pond, fountain, or birdbath in the backyard activates nourishing water energy and attracts wildlife.', 'icon': '⛲'},
      {'title': 'Fire Pit for Connection', 'description': 'A fire pit or barbecue area in the south area of your yard strengthens the fire element, fueling passion and social joy.', 'icon': '🔥'},
    ],
    'Corporate Office': [
      {'title': 'Water for Career Flow', 'description': 'Place a fountain or blue-toned art in the north area of the office to support smooth career advancement and new opportunities.', 'icon': '🧭'},
      {'title': 'Command Seating', 'description': 'Executive desks should face the door diagonally. Avoid sitting with your back to the entrance.', 'icon': '🪑'},
      {'title': 'Collaboration Zones', 'description': 'Keep the center of the space open for team gatherings. A round table in the center promotes unity and shared chi.', 'icon': '🤝'},
    ],
    'Retail Store': [
      {'title': 'Entrance Energy', 'description': 'Keep the store entrance bright, clean, and free of obstacles. An open door invites customers and prosperity chi inside.', 'icon': '🏪'},
      {'title': 'Product Placement', 'description': 'Position best-selling items at eye level near the entrance. Use warm lighting to highlight key merchandise.', 'icon': '✨'},
      {'title': 'Cash Wrap Position', 'description': 'Place the register in the wealth corner (southeast) or in a commanding position facing the entrance for maximum prosperity.', 'icon': '💳'},
    ],
    'Restaurant/Café': [
      {'title': 'Warm Welcome', 'description': 'A warm, inviting host stand near the entrance sets the tone. Soft lighting and soothing music create positive chi for guests.', 'icon': '🍽️'},
      {'title': 'Kitchen Energy', 'description': 'Keep the kitchen organized and the stove clean. A well-cared-for kitchen generates nourishing energy for both food and staff.', 'icon': '👨‍🍳'},
      {'title': 'Seating Flow', 'description': 'Arrange tables so servers can move freely without crossing paths. Smooth service flow equals smooth energy flow.', 'icon': '🪑'},
    ],
    'Bathroom': [
      {'title': 'Keep It Closed', 'description': 'Always close the toilet lid and bathroom door to prevent chi and prosperity from being flushed away.', 'icon': '🚽'},
      {'title': 'Earth Element Balance', 'description': 'Use warm earth tones (terracotta, beige, sandy brown) to counterbalance the draining water energy of the bathroom.', 'icon': '🏺'},
      {'title': 'Plants for Purification', 'description': 'Place a moisture-loving plant like bamboo or a fern in the bathroom to absorb excess energy and purify the space.', 'icon': '🪴'},
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