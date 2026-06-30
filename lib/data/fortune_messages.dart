/// Fortune of the Day messages — daily rotation based on calendar date
class FortuneMessages {
  static const List<String> messages = [
    "🌸 Today, trust yourself a little more than yesterday. Your quiet confidence will guide you well.",
    "🌿 A new opportunity may appear when you least expect it. Keep your heart open and your mind curious.",
    "💙 Today's greatest gift may be a moment of unexpected peace. Allow yourself to fully enjoy it.",
    "✨ You are closer to your goals than you realize. Every thoughtful step is moving you forward.",
    "🌼 Someone may need your kindness today. A small gesture could leave a lasting impression.",
    "🌅 Today carries fresh possibilities. Welcome them with hope rather than hesitation.",
    "🌸 Trust your inner wisdom today. You already have what you need to make a good decision.",
    "🌺 A meaningful conversation may brighten your day. Listen with an open heart.",
    "🍀 Your dedication is quietly creating a path toward greater prosperity. Keep believing in what you're building.",
    "🌙 Take a few peaceful moments for yourself today. Your heart will thank you.",
    "☀️ There is something beautiful waiting to make you smile today. Don't rush past it.",
    "🌿 Not everything blooms at once. Trust that your efforts are growing beneath the surface.",
    "💛 Gratitude has a wonderful way of revealing more reasons to be thankful.",
    "🌸 Today is another chance to become the person you are meant to be.",
    "🌊 Let today unfold naturally. Some of life's best moments arrive without being planned.",
    "🌟 You are stronger than yesterday and wiser than you realize.",
    "🌈 Even the smallest light can brighten an entire room. Let your light shine today.",
    "🌺 Remember to care for yourself with the same kindness you offer others.",
    "🌼 Today's thoughtful choices may become tomorrow's greatest accomplishments.",
    "🌸 May today bring you peace, meaningful moments, and unexpected reasons to smile.",
  ];

  /// Returns the fortune message for today based on the day of year.
  /// Same message all day, changes each calendar day.
  static String messageForToday() {
    final now = DateTime.now();
    final dayOfYear = _dayOfYear(now);
    return messages[dayOfYear % messages.length];
  }

  /// Returns the index for today (0-based).
  static int todayIndex() {
    return _dayOfYear(DateTime.now()) % messages.length;
  }

  static int _dayOfYear(DateTime date) {
    final startOfYear = DateTime(date.year, 1, 1);
    return date.difference(startOfYear).inDays;
  }
}