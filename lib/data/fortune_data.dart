/// Official ChiGlow Fortune Library
/// 366 original fortunes for every day of the year (including leap years).
///
/// Categories:
///   daily       — Daily Fortunes (common)
///   abundance   — Abundance & Prosperity
///   love        — Love, Family & Friendship
///   golden      — Golden Fortunes (Rare)
///   lotus       — Lotus Fortunes (Very Rare)
///   dragon      — Dragon Fortunes (Ultra Rare)
///   rainbow     — Rainbow Fortunes (Extremely Rare)
///   seasonal    — Seasonal & Holiday Fortunes
///
/// Some fortunes include Lucky Numbers and/or Lucky Colors.
/// Internal indices are for development only — never display them to users.

class FortuneEntry {
  final String message;
  final String category;
  final String? title;
  final List<int>? luckyNumbers;
  final String? luckyColor;

  const FortuneEntry({
    required this.message,
    required this.category,
    this.title,
    this.luckyNumbers,
    this.luckyColor,
  });
}

class FortuneLibrary {
  static const List<FortuneEntry> allFortunes = [
    // ── Part 1: Fortunes 1–30 ──
    // Daily Fortunes
    FortuneEntry(message: 'Today is a beautiful day to begin something new.', category: 'daily'),
    FortuneEntry(message: 'A peaceful heart welcomes wonderful opportunities.', category: 'daily'),
    FortuneEntry(message: 'Every small step today creates tomorrow\'s success.', category: 'daily'),
    FortuneEntry(message: 'Your kindness brings light wherever you go.', category: 'daily'),
    FortuneEntry(message: 'Trust your intuition—it is quietly guiding you.', category: 'daily'),
    FortuneEntry(message: 'Good things often arrive when least expected.', category: 'daily'),
    FortuneEntry(message: 'A grateful heart attracts lasting abundance.', category: 'daily'),
    FortuneEntry(message: 'Choose peace over worry today.', category: 'daily'),
    FortuneEntry(message: 'Smile often—joy is contagious.', category: 'daily'),
    FortuneEntry(message: 'Every sunrise offers a fresh beginning.', category: 'daily'),
    FortuneEntry(message: 'Let today unfold with curiosity.', category: 'daily'),
    FortuneEntry(message: 'Your patience is creating something beautiful.', category: 'daily'),
    FortuneEntry(message: 'Small acts of kindness leave lasting footprints.', category: 'daily'),
    FortuneEntry(message: 'Believe in yourself a little more today.', category: 'daily'),
    FortuneEntry(message: 'The energy you share returns to you.', category: 'daily'),
    FortuneEntry(message: 'Every challenge hides a valuable lesson.', category: 'daily'),
    FortuneEntry(message: 'Stay open to unexpected blessings.', category: 'daily'),
    FortuneEntry(message: 'Happiness grows where gratitude lives.', category: 'daily'),
    FortuneEntry(message: 'Let your confidence shine naturally.', category: 'daily'),
    FortuneEntry(message: 'Calm thoughts create peaceful days.', category: 'daily'),
    FortuneEntry(message: 'Someone appreciates you more than you realize.', category: 'daily'),
    FortuneEntry(message: 'Every ending prepares a beautiful beginning.', category: 'daily'),
    FortuneEntry(message: 'Listen carefully—your heart knows the answer.', category: 'daily'),
    FortuneEntry(message: 'Wonderful opportunities are quietly approaching.', category: 'daily'),
    FortuneEntry(message: 'Today is perfect for planting new dreams.', category: 'daily'),
    FortuneEntry(message: 'You are stronger than yesterday.', category: 'daily'),
    FortuneEntry(message: 'The best moments are often unplanned.', category: 'daily'),
    FortuneEntry(message: 'Your positive energy inspires others.', category: 'daily'),
    FortuneEntry(message: 'Trust the timing of your life.', category: 'daily'),
    FortuneEntry(message: 'Flow gently through today and enjoy the journey.', category: 'daily'),

    // ── Part 2: Fortunes 31–60 ──
    FortuneEntry(message: 'A new opportunity is quietly finding its way to you.', category: 'daily'),
    FortuneEntry(message: 'Your calm spirit brings harmony wherever you go.', category: 'daily'),
    FortuneEntry(message: 'Every day is another chance to bloom.', category: 'daily'),
    FortuneEntry(message: 'Someone will appreciate your kindness today.', category: 'daily'),
    FortuneEntry(message: 'Trust that everything is unfolding at the right time.', category: 'daily'),
    FortuneEntry(message: 'Peace grows where gratitude is practiced.', category: 'daily'),
    FortuneEntry(message: 'A gentle heart is a powerful heart.', category: 'daily'),
    FortuneEntry(message: 'Today is a wonderful day to believe in yourself.', category: 'daily'),
    FortuneEntry(message: 'Good things often begin with one small step.', category: 'daily'),
    FortuneEntry(message: 'Your patience will soon be rewarded.', category: 'daily'),
    FortuneEntry(message: 'Welcome today\'s possibilities with an open mind.', category: 'daily'),
    FortuneEntry(message: 'A joyful surprise may brighten your path.', category: 'daily'),
    FortuneEntry(message: 'Let your optimism lead the way.', category: 'daily'),
    FortuneEntry(message: 'The energy you create today shapes tomorrow.', category: 'daily'),
    FortuneEntry(message: 'Beautiful moments are waiting to be noticed.', category: 'daily'),
    FortuneEntry(message: 'Trust the quiet wisdom within you.', category: 'daily'),
    FortuneEntry(message: 'You are growing stronger with every experience.', category: 'daily'),
    FortuneEntry(message: 'Kind words have the power to transform a day.', category: 'daily'),
    FortuneEntry(message: 'Today is perfect for creating happy memories.', category: 'daily'),
    FortuneEntry(message: 'Keep your heart open to unexpected blessings.', category: 'daily'),
    FortuneEntry(message: 'The best journeys begin with a single decision.', category: 'daily'),
    FortuneEntry(message: 'Every sunrise brings fresh possibilities.', category: 'daily'),
    FortuneEntry(message: 'Hope shines brightest when shared.', category: 'daily'),
    FortuneEntry(message: 'Let today\'s peace become tomorrow\'s strength.', category: 'daily'),
    FortuneEntry(message: 'You are exactly where you need to be.', category: 'daily'),
    FortuneEntry(message: 'Small moments of joy become treasured memories.', category: 'daily'),
    FortuneEntry(message: 'Let kindness be your greatest achievement today.', category: 'daily'),
    FortuneEntry(message: 'Your smile carries more power than you know.', category: 'daily'),
    FortuneEntry(message: 'Every challenge is preparing you for something greater.', category: 'daily'),
    FortuneEntry(message: 'Flow gently, grow confidently, and bloom beautifully.', category: 'daily'),

    // ── Part 3: Fortunes 61–90 ──
    FortuneEntry(message: 'A pleasant surprise is closer than you think.', category: 'daily'),
    FortuneEntry(message: 'Someone is about to bring good news into your life.', category: 'daily'),
    FortuneEntry(message: 'An unexpected opportunity will soon catch your attention.', category: 'daily'),
    FortuneEntry(message: 'Great fortune often begins with a simple conversation.', category: 'daily'),
    FortuneEntry(message: 'Your patience is about to be rewarded.', category: 'daily'),
    FortuneEntry(message: 'A joyful celebration is drawing near.', category: 'daily'),
    FortuneEntry(message: 'Today carries the energy of new beginnings.', category: 'daily'),
    FortuneEntry(message: 'Someone will remember your kindness.', category: 'daily'),
    FortuneEntry(message: 'A lucky coincidence may brighten your day.', category: 'daily'),
    FortuneEntry(message: 'Good fortune is quietly walking beside you.', category: 'daily'),
    FortuneEntry(message: 'Your home will soon welcome peaceful energy.', category: 'daily'),
    FortuneEntry(message: 'A wish you\'ve almost forgotten is beginning to bloom.', category: 'daily'),
    FortuneEntry(message: 'A smile shared today will return to you many times over.', category: 'daily'),
    FortuneEntry(message: 'An answer you\'ve been seeking is closer than it appears.', category: 'daily'),
    FortuneEntry(message: 'Fortune favors your calm and steady heart.', category: 'daily'),
    FortuneEntry(message: 'Your positive energy is attracting wonderful people.', category: 'daily'),
    FortuneEntry(message: 'A beautiful chapter is ready to begin.', category: 'daily'),
    FortuneEntry(message: 'Trust your instincts today—they are especially strong.', category: 'daily'),
    FortuneEntry(message: 'An exciting possibility will soon reveal itself.', category: 'daily'),
    FortuneEntry(message: 'Good things are growing behind the scenes.', category: 'daily'),
    FortuneEntry(message: 'Your kindness has already started a chain of blessings.', category: 'daily'),
    FortuneEntry(message: 'Today is an excellent day to welcome abundance.', category: 'abundance'),
    FortuneEntry(message: 'Something you\'ve hoped for is moving closer.', category: 'daily'),
    FortuneEntry(message: 'A door that once seemed closed may soon open.', category: 'daily'),
    FortuneEntry(message: 'Peace will guide today\'s decisions.', category: 'daily'),
    FortuneEntry(message: 'A happy surprise may arrive sooner than expected.', category: 'daily'),
    FortuneEntry(message: 'Your confidence will inspire someone today.', category: 'daily'),
    FortuneEntry(message: 'A new friendship may begin unexpectedly.', category: 'love'),
    FortuneEntry(message: 'Great things often arrive quietly.', category: 'daily'),
    FortuneEntry(message: 'Fortune smiles upon those who share their light.', category: 'daily'),

    // ── Part 4: Fortunes 91–120 ──
    FortuneEntry(message: 'Today holds more possibilities than you can see.', category: 'daily'),
    FortuneEntry(message: 'A kind gesture will return to you in a beautiful way.', category: 'daily'),
    FortuneEntry(message: 'The answer you seek is already finding you.', category: 'daily'),
    FortuneEntry(message: 'An unexpected smile will brighten your day.', category: 'daily'),
    FortuneEntry(message: 'A peaceful home creates a joyful heart.', category: 'daily'),
    FortuneEntry(message: 'Someone is grateful to have you in their life.', category: 'love'),
    FortuneEntry(message: 'New beginnings often arrive quietly.', category: 'daily'),
    FortuneEntry(message: 'A wonderful memory is waiting to be made.', category: 'daily'),
    FortuneEntry(message: 'Trust the timing of life\'s gentle surprises.', category: 'daily'),
    FortuneEntry(message: 'A lucky moment may arrive when you least expect it.', category: 'daily'),
    FortuneEntry(message: 'Happiness is already closer than it feels.', category: 'daily'),
    FortuneEntry(message: 'Your next step will lead somewhere beautiful.', category: 'daily'),
    FortuneEntry(message: 'The kindness you give today will bloom tomorrow.', category: 'daily'),
    FortuneEntry(message: 'Your calm spirit attracts positive energy.', category: 'daily'),
    FortuneEntry(message: 'Something you\'ve been hoping for is moving toward you.', category: 'daily'),
    FortuneEntry(message: 'Today is filled with hidden blessings.', category: 'daily'),
    FortuneEntry(message: 'A cheerful heart invites wonderful opportunities.', category: 'daily'),
    FortuneEntry(message: 'You are surrounded by more support than you realize.', category: 'daily'),
    FortuneEntry(message: 'Joy grows when it is shared.', category: 'daily'),
    FortuneEntry(message: 'A beautiful surprise is quietly on its way.', category: 'daily'),
    FortuneEntry(message: 'Good fortune enjoys patient hearts.', category: 'daily'),
    FortuneEntry(message: 'A peaceful decision today creates tomorrow\'s happiness.', category: 'daily'),
    FortuneEntry(message: 'Something valuable is about to reveal itself.', category: 'daily'),
    FortuneEntry(message: 'The universe delights in surprising grateful hearts.', category: 'daily'),
    FortuneEntry(message: 'A new path will soon become clear.', category: 'daily'),
    FortuneEntry(message: 'The best chapters often begin unexpectedly.', category: 'daily'),
    FortuneEntry(message: 'Keep your heart open today.', category: 'daily'),
    FortuneEntry(message: 'Great things grow from small beginnings.', category: 'daily'),
    FortuneEntry(message: 'You are creating a future filled with harmony.', category: 'daily'),
    FortuneEntry(message: 'Fortune often arrives dressed as opportunity.', category: 'daily'),

    // ── Part 5: Fortunes 121–150 ──
    FortuneEntry(
      message: 'A joyful surprise is waiting just around the corner.',
      category: 'daily',
      luckyNumbers: [7, 14, 22, 31, 45, 49],
    ),
    FortuneEntry(message: 'Someone will soon appreciate something you\'ve done.', category: 'daily'),
    FortuneEntry(message: 'A new friendship may begin when you least expect it.', category: 'love'),
    FortuneEntry(
      message: 'Good news has already started its journey toward you.',
      category: 'daily',
      luckyNumbers: [3, 11, 18, 27, 39, 52],
    ),
    FortuneEntry(message: 'A peaceful decision today will bring lasting happiness.', category: 'daily'),
    FortuneEntry(message: 'Your next opportunity may arrive disguised as something small.', category: 'daily'),
    FortuneEntry(
      message: 'Fortune smiles upon those who remain hopeful.',
      category: 'daily',
      luckyNumbers: [5, 16, 24, 33, 41, 56],
    ),
    FortuneEntry(message: 'Someone is quietly cheering for your success.', category: 'daily'),
    FortuneEntry(message: 'Today is an excellent day to welcome abundance.', category: 'abundance'),
    FortuneEntry(
      message: 'The kindness you give will return in unexpected ways.',
      category: 'daily',
      luckyNumbers: [2, 9, 17, 28, 36, 48],
    ),
    FortuneEntry(message: 'Something wonderful is beginning behind the scenes.', category: 'daily'),
    FortuneEntry(message: 'Your heart already knows the right direction.', category: 'daily'),
    FortuneEntry(
      message: 'A happy surprise may brighten your week.',
      category: 'daily',
      luckyNumbers: [8, 15, 21, 34, 46, 58],
    ),
    FortuneEntry(message: 'Your peaceful spirit attracts wonderful opportunities.', category: 'daily'),

    // ── Fortunes 135–180 ──
    FortuneEntry(message: 'A dream you\'ve been nurturing is beginning to bloom.', category: 'daily'),
    FortuneEntry(
      message: 'Every act of kindness plants a beautiful seed.',
      category: 'daily',
      luckyNumbers: [1, 12, 23, 35, 44, 55],
    ),
    FortuneEntry(message: 'Great things often arrive quietly.', category: 'daily'),
    FortuneEntry(message: 'An unexpected invitation may bring unexpected joy.', category: 'daily'),
    FortuneEntry(
      message: 'Today carries a little extra luck.',
      category: 'daily',
      luckyNumbers: [6, 19, 25, 32, 47, 60],
    ),
    FortuneEntry(message: 'Your optimism is creating new possibilities.', category: 'daily'),
    FortuneEntry(message: 'Someone may soon share wonderful news with you.', category: 'daily'),
    FortuneEntry(
      message: 'A new chapter is opening before you.',
      category: 'daily',
      luckyNumbers: [4, 13, 26, 38, 43, 57],
    ),
    FortuneEntry(message: 'Your calm energy brings comfort to others.', category: 'daily'),
    FortuneEntry(message: 'A beautiful opportunity is preparing to find you.', category: 'daily'),
    FortuneEntry(
      message: 'The universe enjoys rewarding grateful hearts.',
      category: 'daily',
      luckyNumbers: [10, 20, 29, 37, 50, 59],
    ),
    FortuneEntry(message: 'Today is a perfect day to trust yourself.', category: 'daily'),
    FortuneEntry(message: 'A pleasant coincidence may soon become a treasured memory.', category: 'daily'),
    FortuneEntry(
      message: 'Good fortune often follows quiet persistence.',
      category: 'daily',
      luckyNumbers: [9, 18, 30, 42, 51, 61],
    ),
    FortuneEntry(message: 'Your smile may open a door today.', category: 'daily'),
    FortuneEntry(
      message: 'Every day brings another chance to Flow, Grow & Bloom.',
      category: 'daily',
      luckyNumbers: [7, 16, 28, 35, 49, 63],
    ),
    FortuneEntry(
      message: 'Today is quietly preparing something wonderful for you.',
      category: 'daily',
      luckyNumbers: [5, 14, 22, 37, 48, 61],
    ),
    FortuneEntry(message: 'A thoughtful conversation may lead to a beautiful opportunity.', category: 'daily'),
    FortuneEntry(message: 'Someone is about to recognize your unique gifts.', category: 'daily'),
    // Golden Fortune
    FortuneEntry(
      message: 'Today carries exceptional energy. Walk forward with confidence—an unexpected blessing may be waiting just ahead.',
      category: 'golden', title: '🌟 Golden Fortune',
      luckyNumbers: [3, 11, 19, 27, 41, 58, 66],
      luckyColor: 'Gold',
    ),
    FortuneEntry(message: 'Your kindness is opening doors you cannot yet see.', category: 'daily'),
    FortuneEntry(message: 'A peaceful heart attracts joyful moments.', category: 'daily'),
    FortuneEntry(
      message: 'Great things often begin with quiet confidence.',
      category: 'daily',
      luckyNumbers: [8, 17, 29, 34, 46, 55],
    ),
    FortuneEntry(message: 'Today is a wonderful day to welcome happiness.', category: 'daily'),
    FortuneEntry(message: 'A beautiful surprise is slowly unfolding.', category: 'daily'),
    // Lotus Fortune
    FortuneEntry(
      message: 'Like the lotus rising through still waters, you are growing stronger with every challenge. Trust your journey—your time to bloom is near.',
      category: 'lotus', title: '🌸 Lotus Fortune',
      luckyNumbers: [7, 16, 24, 33, 45, 62],
      luckyColor: 'Lotus Pink',
    ),
    FortuneEntry(message: 'Someone\'s gratitude will brighten your day.', category: 'daily'),
    FortuneEntry(message: 'A joyful opportunity is drawing closer.', category: 'daily'),
    FortuneEntry(
      message: 'Your patience is quietly creating success.',
      category: 'daily',
      luckyNumbers: [2, 12, 23, 35, 49, 60],
    ),
    FortuneEntry(message: 'Good fortune loves grateful hearts.', category: 'daily'),
    FortuneEntry(message: 'Today may bring a reason to celebrate.', category: 'daily'),
    FortuneEntry(
      message: 'The path ahead is becoming clearer.',
      category: 'daily',
      luckyNumbers: [9, 18, 26, 38, 52, 64],
    ),
    FortuneEntry(message: 'A smile you share today will return many times over.', category: 'daily'),
    FortuneEntry(message: 'The universe is arranging beautiful things on your behalf.', category: 'daily'),
    // Dragon Fortune
    FortuneEntry(
      message: 'Courage awakens powerful opportunities. Trust your instincts today—they will guide you well.',
      category: 'dragon', title: '🐉 Dragon Fortune',
      luckyNumbers: [1, 10, 21, 36, 50, 65, 69],
      luckyColor: 'Dragon Red',
    ),
    FortuneEntry(message: 'Harmony within your home creates harmony within your heart.', category: 'daily'),
    FortuneEntry(message: 'Your next step will bring unexpected rewards.', category: 'daily'),
    FortuneEntry(
      message: 'A hopeful heart invites wonderful possibilities.',
      category: 'daily',
      luckyNumbers: [6, 15, 30, 42, 53, 68],
    ),
    FortuneEntry(message: 'Someone may soon bring you joyful news.', category: 'daily'),
    FortuneEntry(message: 'Your brightest days are still ahead.', category: 'daily'),
    // Golden Fortune
    FortuneEntry(
      message: 'Fortune smiles upon today\'s choices. Trust your heart and welcome every new possibility with gratitude.',
      category: 'golden', title: '🌟 Golden Fortune',
      luckyNumbers: [4, 13, 28, 39, 47, 59, 67],
      luckyColor: 'Warm Gold',
    ),
    FortuneEntry(message: 'A happy coincidence may soon become a treasured memory.', category: 'daily'),
    FortuneEntry(message: 'Today is rich with hidden possibilities.', category: 'daily'),
    FortuneEntry(
      message: 'Every act of kindness plants seeds of abundance.',
      category: 'daily',
      luckyNumbers: [5, 20, 31, 43, 56, 63],
    ),
    FortuneEntry(message: 'Something you\'ve wished for is moving closer each day.', category: 'daily'),
    FortuneEntry(
      message: 'Flow gently, welcome abundance, and bloom with confidence.',
      category: 'daily',
      luckyNumbers: [8, 17, 25, 40, 51, 66],
    ),

    // ── Fortunes 181–210 ──
    FortuneEntry(
      message: 'A joyful discovery is waiting just ahead.',
      category: 'daily',
      luckyNumbers: [4, 12, 26, 37, 49, 63],
    ),
    FortuneEntry(message: 'Today brings fresh opportunities to brighten your path.', category: 'daily'),
    FortuneEntry(message: 'A gentle decision today will lead to lasting peace.', category: 'daily'),
    FortuneEntry(
      message: 'Someone\'s kindness will warm your heart.',
      category: 'daily',
      luckyNumbers: [7, 15, 23, 34, 46, 58],
    ),
    FortuneEntry(message: 'The answer you\'ve been waiting for is closer than it seems.', category: 'daily'),
    FortuneEntry(message: 'Happiness often arrives through unexpected moments.', category: 'daily'),
    FortuneEntry(
      message: 'Trust your heart—it already knows the way.',
      category: 'daily',
      luckyNumbers: [2, 11, 20, 35, 44, 61],
    ),
    FortuneEntry(message: 'Your peaceful spirit creates harmony wherever you go.', category: 'daily'),
    FortuneEntry(message: 'A new reason to smile is coming your way.', category: 'daily'),
    FortuneEntry(
      message: 'Every sunrise brings another beautiful beginning.',
      category: 'daily',
      luckyNumbers: [6, 18, 24, 39, 51, 65],
    ),
    // Golden Fortune
    FortuneEntry(
      message: 'Today shines with extraordinary promise. Welcome every opportunity with confidence—something remarkable may be unfolding just for you.',
      category: 'golden', title: '🌟 Golden Fortune',
      luckyNumbers: [8, 17, 28, 40, 53, 67, 72],
      luckyColor: 'Gold',
    ),
    FortuneEntry(message: 'A grateful heart opens unexpected doors.', category: 'daily'),
    FortuneEntry(message: 'Someone believes in you more than you know.', category: 'daily'),
    FortuneEntry(
      message: 'Your next step will lead somewhere wonderful.',
      category: 'daily',
      luckyNumbers: [5, 14, 29, 36, 48, 60],
    ),
    // Lotus Fortune
    FortuneEntry(
      message: 'Even the calmest waters reflect the brightest skies. Stay patient—your beautiful season is approaching.',
      category: 'lotus', title: '🌸 Lotus Fortune',
      luckyNumbers: [1, 16, 27, 38, 47, 62],
      luckyColor: 'Soft Pink',
    ),
    FortuneEntry(message: 'Peace follows those who welcome each day with gratitude.', category: 'daily'),
    FortuneEntry(message: 'A cheerful conversation may change your perspective.', category: 'daily'),
    FortuneEntry(
      message: 'Something you\'ve quietly hoped for is moving closer.',
      category: 'daily',
      luckyNumbers: [3, 13, 22, 31, 45, 57],
    ),
    FortuneEntry(message: 'A wonderful memory is waiting to be created.', category: 'daily'),
    FortuneEntry(
      message: 'Today is a perfect day to believe in good things.',
      category: 'daily',
      luckyNumbers: [9, 19, 30, 41, 52, 64],
    ),
    // Dragon Fortune
    FortuneEntry(
      message: 'Strength and wisdom walk beside you today. Trust your courage—your next decision may shape an exciting future.',
      category: 'dragon', title: '🐉 Dragon Fortune',
      luckyNumbers: [10, 21, 33, 42, 55, 68, 74],
      luckyColor: 'Imperial Red',
    ),
    FortuneEntry(message: 'Every kind word plants a lasting seed of joy.', category: 'daily'),
    FortuneEntry(message: 'A quiet moment today will bring unexpected clarity.', category: 'daily'),
    FortuneEntry(
      message: 'Great things are growing where you cannot yet see them.',
      category: 'daily',
      luckyNumbers: [6, 17, 25, 43, 50, 66],
    ),
    FortuneEntry(message: 'Your optimism lights the way for others.', category: 'daily'),
    FortuneEntry(message: 'An exciting possibility is about to appear.', category: 'daily'),
    FortuneEntry(
      message: 'Fortune often arrives when your heart is open.',
      category: 'daily',
      luckyNumbers: [2, 18, 26, 37, 49, 71],
    ),

    // ── Fortunes 208–240 ──
    FortuneEntry(message: 'The future is filled with beautiful possibilities.', category: 'daily'),
    FortuneEntry(message: 'Your kindness is creating ripples of happiness.', category: 'daily'),
    FortuneEntry(
      message: 'Today invites you to Flow, Grow, Bloom—and smile.',
      category: 'daily',
      luckyNumbers: [5, 20, 32, 44, 56, 69],
    ),
    FortuneEntry(
      message: 'Today brings more reasons to smile than you expect.',
      category: 'daily',
      luckyNumbers: [4, 15, 23, 36, 48, 62],
    ),
    FortuneEntry(message: 'A wonderful surprise may arrive through an ordinary moment.', category: 'daily'),
    FortuneEntry(message: 'Someone is grateful for your kindness today.', category: 'daily'),
    FortuneEntry(
      message: 'Your next "yes" may lead to something beautiful.',
      category: 'daily',
      luckyNumbers: [7, 18, 27, 39, 51, 66],
    ),
    FortuneEntry(message: 'A peaceful home begins with a peaceful heart.', category: 'daily'),
    // Golden Fortune
    FortuneEntry(
      message: 'Today shines with rare promise. Keep your eyes and heart open—an unexpected blessing may arrive when you least expect it.',
      category: 'golden', title: '🌟 Golden Fortune',
      luckyNumbers: [8, 16, 29, 41, 54, 68, 75],
      luckyColor: 'Gold',
    ),
    FortuneEntry(message: 'Good things are quietly finding their way to you.', category: 'daily'),
    FortuneEntry(message: 'Someone may soon offer exactly the encouragement you need.', category: 'daily'),
    FortuneEntry(
      message: 'Joy grows when it is shared.',
      category: 'daily',
      luckyNumbers: [2, 12, 24, 35, 46, 61],
    ),
    FortuneEntry(message: 'Your patience is creating beautiful results.', category: 'daily'),
    FortuneEntry(message: 'The next chapter may begin with a simple conversation.', category: 'daily'),
    FortuneEntry(
      message: 'Your brightest ideas often arrive during peaceful moments.',
      category: 'daily',
      luckyNumbers: [5, 14, 28, 37, 49, 64],
    ),
    // Lotus Fortune
    FortuneEntry(
      message: 'Just as the lotus blooms in its own perfect season, your time to flourish is unfolding beautifully.',
      category: 'lotus', title: '🌸 Lotus Fortune',
      luckyNumbers: [1, 17, 25, 38, 47, 63],
      luckyColor: 'Lotus Pink',
    ),
    FortuneEntry(message: 'Today invites you to notice life\'s little miracles.', category: 'daily'),
    FortuneEntry(message: 'A cheerful heart welcomes cheerful days.', category: 'daily'),
    FortuneEntry(
      message: 'Your kindness has reached farther than you realize.',
      category: 'daily',
      luckyNumbers: [6, 13, 26, 42, 52, 65],
    ),
    FortuneEntry(message: 'A peaceful choice today creates tomorrow\'s happiness.', category: 'daily'),
    // Classic Fortune
    FortuneEntry(
      message: 'The fortune you\'ve been waiting for is already on its way.',
      category: 'daily', title: '🥠 Classic Fortune',
      luckyNumbers: [3, 19, 30, 44, 55, 69],
    ),
    FortuneEntry(message: 'Someone will remember your generosity with gratitude.', category: 'daily'),
    // Dragon Fortune
    FortuneEntry(
      message: 'Today is a day for courage. Trust yourself, take the first step, and let confidence guide your journey.',
      category: 'dragon', title: '🐉 Dragon Fortune',
      luckyNumbers: [9, 20, 31, 43, 56, 70, 77],
      luckyColor: 'Dragon Red',
    ),
    FortuneEntry(message: 'The smallest blessing today may become your greatest joy.', category: 'daily'),
    FortuneEntry(message: 'Good fortune often arrives quietly.', category: 'daily'),
    FortuneEntry(
      message: 'A smile shared today will find its way back to you.',
      category: 'daily',
      luckyNumbers: [4, 11, 22, 34, 45, 58],
    ),
    FortuneEntry(message: 'Someone may soon thank you for something you had forgotten.', category: 'daily'),
    FortuneEntry(message: 'A calm mind welcomes wise decisions.', category: 'daily'),
    FortuneEntry(
      message: 'Your next opportunity may appear in an unexpected place.',
      category: 'daily',
      luckyNumbers: [7, 16, 27, 40, 53, 67],
    ),
    FortuneEntry(message: 'There is beauty waiting in today\'s simple moments.', category: 'daily'),
    FortuneEntry(message: 'Your future is brighter than you can imagine.', category: 'daily'),
    FortuneEntry(
      message: 'Today may become one of your favorite memories.',
      category: 'daily',
      luckyNumbers: [5, 18, 29, 41, 50, 72],
    ),
    FortuneEntry(message: 'Every sunrise reminds us that every day is a fresh beginning.', category: 'daily'),

    // ── Fortunes 241–270 ──
    FortuneEntry(
      message: 'A joyful surprise is quietly making its way to you.',
      category: 'daily',
      luckyNumbers: [6, 14, 27, 39, 48, 64],
    ),
    FortuneEntry(message: 'Today is an excellent day to welcome good news.', category: 'daily'),
    FortuneEntry(message: 'Someone\'s appreciation will brighten your heart.', category: 'daily'),
    FortuneEntry(
      message: 'A small decision today may lead to a wonderful future.',
      category: 'daily',
      luckyNumbers: [3, 11, 25, 37, 46, 59],
    ),
    FortuneEntry(message: 'Happiness is growing in places you cannot yet see.', category: 'daily'),
    // Golden Fortune
    FortuneEntry(
      message: 'Today shines with rare promise. A joyful opportunity may appear when you least expect it. Trust your heart and welcome it with gratitude.',
      category: 'golden', title: '🌟 Golden Fortune',
      luckyNumbers: [8, 18, 30, 44, 55, 67, 76],
      luckyColor: 'Sunrise Gold',
    ),
    FortuneEntry(message: 'Your next smile may begin someone else\'s happy day.', category: 'daily'),
    FortuneEntry(message: 'Good fortune often arrives quietly.', category: 'daily'),
    FortuneEntry(
      message: 'A kind word today will echo farther than you imagine.',
      category: 'daily',
      luckyNumbers: [5, 16, 28, 41, 52, 65],
    ),
    FortuneEntry(message: 'The universe is gently arranging beautiful things for you.', category: 'daily'),
    FortuneEntry(message: 'Today\'s calm may become tomorrow\'s strength.', category: 'daily'),
    FortuneEntry(
      message: 'A pleasant surprise may be hiding in today\'s plans.',
      category: 'daily',
      luckyNumbers: [4, 12, 23, 36, 47, 60],
    ),
    // Lotus Fortune
    FortuneEntry(
      message: 'Like sunlight reaching the lotus, your patience is about to be rewarded. Continue growing with confidence.',
      category: 'lotus', title: '🌸 Lotus Fortune',
      luckyNumbers: [7, 19, 29, 42, 53, 68],
      luckyColor: 'Lotus White',
    ),
    FortuneEntry(message: 'Every sunrise brings another chance to bloom.', category: 'daily'),
    FortuneEntry(message: 'Someone will soon bring laughter into your day.', category: 'daily'),
    FortuneEntry(
      message: 'A peaceful heart creates joyful moments.',
      category: 'daily',
      luckyNumbers: [9, 15, 31, 43, 51, 66],
    ),
    // Classic Fortune
    FortuneEntry(message: 'Your lucky moment may arrive in the most ordinary place.', category: 'daily', title: '🥠 Classic Fortune'),
    FortuneEntry(message: 'A familiar face may bring wonderful news.', category: 'daily'),
    // Dragon Fortune
    FortuneEntry(
      message: 'Today is a powerful day to believe in yourself. Courage will open a door that fear never could.',
      category: 'dragon', title: '🐉 Dragon Fortune',
      luckyNumbers: [2, 17, 26, 38, 50, 63, 79],
      luckyColor: 'Imperial Red',
    ),
    FortuneEntry(message: 'The next chapter of your story begins with hope.', category: 'daily'),
    FortuneEntry(message: 'Today\'s smallest blessing may become tomorrow\'s greatest treasure.', category: 'daily'),
    FortuneEntry(
      message: 'Expect kindness to find you today.',
      category: 'daily',
      luckyNumbers: [1, 13, 24, 35, 45, 57],
    ),
    FortuneEntry(message: 'A quiet moment may reveal a brilliant idea.', category: 'daily'),
    FortuneEntry(message: 'Your positive energy is attracting wonderful people.', category: 'daily'),
    FortuneEntry(
      message: 'Something beautiful is already on its way.',
      category: 'daily',
      luckyNumbers: [10, 20, 32, 40, 54, 69],
    ),
    FortuneEntry(message: 'The best surprises are often unplanned.', category: 'daily'),
    FortuneEntry(message: 'Someone will remember your kindness long after today.', category: 'daily'),
    FortuneEntry(
      message: 'Fortune favors grateful hearts.',
      category: 'daily',
      luckyNumbers: [5, 18, 30, 41, 56, 72],
    ),
    FortuneEntry(message: 'A joyful invitation may soon arrive.', category: 'daily'),
    FortuneEntry(message: 'Today is another beautiful opportunity to Flow, Grow & Bloom.', category: 'daily'),

    // ── Fortunes 271–300 ──
    FortuneEntry(
      message: 'Today is quietly opening a door meant just for you.',
      category: 'daily',
      luckyNumbers: [6, 13, 21, 38, 47, 62],
    ),
    FortuneEntry(message: 'A simple act of kindness will return in a beautiful way.', category: 'daily'),
    FortuneEntry(message: 'Someone may soon share exciting news with you.', category: 'daily'),
    FortuneEntry(
      message: 'The path ahead is brighter than it appears today.',
      category: 'daily',
      luckyNumbers: [4, 15, 26, 35, 49, 61],
    ),
    FortuneEntry(message: 'Your peaceful energy brings comfort wherever you go.', category: 'daily'),
    // Golden Fortune
    FortuneEntry(
      message: 'Today shines with extraordinary promise. A joyful opportunity is drawing near—welcome it with confidence and gratitude.',
      category: 'golden', title: '🌟 Golden Fortune',
      luckyNumbers: [8, 19, 28, 41, 54, 67, 73],
      luckyColor: 'Golden Amber',
    ),
    FortuneEntry(message: 'A wonderful memory is about to be created.', category: 'daily'),
    FortuneEntry(message: 'Your next conversation may change everything for the better.', category: 'daily'),
    FortuneEntry(
      message: 'Good fortune enjoys those who remain hopeful.',
      category: 'daily',
      luckyNumbers: [5, 11, 24, 37, 52, 64],
    ),
    FortuneEntry(message: 'Peace begins with one grateful thought.', category: 'daily'),
    // Classic Fortune
    FortuneEntry(message: 'Your lucky seat may be waiting for you today.', category: 'daily', title: '🥠 Classic Fortune'),
    FortuneEntry(
      message: 'A pleasant surprise could arrive before sunset.',
      category: 'daily',
      luckyNumbers: [7, 18, 29, 43, 56, 69],
    ),
    FortuneEntry(message: 'Someone is thankful to have you in their life.', category: 'love'),
    // Lotus Fortune
    FortuneEntry(
      message: 'Like the lotus reaching toward the sun, your quiet perseverance is about to blossom into something beautiful.',
      category: 'lotus', title: '🌸 Lotus Fortune',
      luckyNumbers: [2, 14, 27, 40, 51, 65],
      luckyColor: 'Lotus Pink',
    ),
    FortuneEntry(message: 'A cheerful heart invites cheerful days.', category: 'daily'),

    // ── Fortunes 286–300 ──
    FortuneEntry(message: 'Your kindness is quietly changing the world around you.', category: 'daily'),
    FortuneEntry(
      message: 'Today is a wonderful day to welcome abundance.',
      category: 'abundance',
      luckyNumbers: [1, 16, 30, 44, 53, 66],
    ),
    // Dragon Fortune
    FortuneEntry(
      message: 'Strength, wisdom, and courage are with you today. Take the first step—great things often begin with quiet confidence.',
      category: 'dragon', title: '🐉 Dragon Fortune',
      luckyNumbers: [9, 20, 33, 45, 58, 70, 78],
      luckyColor: 'Imperial Crimson',
    ),
    FortuneEntry(message: 'A happy coincidence may soon become a treasured memory.', category: 'daily'),
    FortuneEntry(message: 'The future is quietly preparing something wonderful.', category: 'daily'),
    FortuneEntry(
      message: 'Your smile will brighten someone\'s day today.',
      category: 'daily',
      luckyNumbers: [3, 12, 25, 39, 50, 63],
    ),
    FortuneEntry(message: 'A delicious meal shared with others brings extra good fortune.', category: 'daily', title: '🥠 Classic Fortune'),
    FortuneEntry(message: 'Keep your eyes open—today has a surprise for you.', category: 'daily'),
    FortuneEntry(
      message: 'The answer you\'ve been seeking may appear unexpectedly.',
      category: 'daily',
      luckyNumbers: [8, 17, 31, 42, 57, 68],
    ),
    FortuneEntry(message: 'Harmony grows where love and gratitude live together.', category: 'love'),
    FortuneEntry(message: 'A peaceful home creates joyful memories.', category: 'daily'),
    FortuneEntry(
      message: 'The smallest blessing today may become tomorrow\'s greatest gift.',
      category: 'daily',
      luckyNumbers: [10, 22, 34, 46, 55, 72],
    ),
    FortuneEntry(message: 'Good things often arrive one gentle step at a time.', category: 'daily'),
    FortuneEntry(message: 'Today carries the quiet promise of happiness.', category: 'daily'),
    FortuneEntry(
      message: 'Every new day is another invitation to Flow, Grow & Bloom.',
      category: 'daily',
      luckyNumbers: [6, 18, 28, 41, 59, 71],
    ),

    // ── Fortunes 301–330 ──
    FortuneEntry(
      message: 'A joyful surprise may arrive sooner than you expect.',
      category: 'daily',
      luckyNumbers: [5, 13, 27, 36, 49, 64],
    ),
    FortuneEntry(message: 'Your kindness is opening unseen doors.', category: 'daily'),
    FortuneEntry(message: 'Today is filled with quiet possibilities.', category: 'daily'),
    FortuneEntry(
      message: 'A wonderful opportunity is gently approaching.',
      category: 'daily',
      luckyNumbers: [2, 16, 25, 38, 52, 67],
    ),
    FortuneEntry(message: 'Someone will remember your generosity with gratitude.', category: 'daily'),
    // Golden Fortune
    FortuneEntry(
      message: 'Today carries extraordinary energy. Trust your instincts—they may guide you toward an unexpected blessing.',
      category: 'golden', title: '🌟 Golden Fortune',
      luckyNumbers: [7, 18, 29, 43, 55, 68, 77],
      luckyColor: 'Imperial Gold',
    ),
    FortuneEntry(message: 'Peace is quietly finding its way into your day.', category: 'daily'),
    FortuneEntry(message: 'A familiar face may bring wonderful news.', category: 'daily'),
    FortuneEntry(
      message: 'Good fortune often arrives in simple moments.',
      category: 'daily',
      luckyNumbers: [3, 14, 24, 39, 50, 61],
    ),
    FortuneEntry(message: 'Happiness grows when shared.', category: 'daily'),
    FortuneEntry(message: 'Your lucky day may begin with your next smile.', category: 'daily', title: '🥠 Classic Fortune'),
    FortuneEntry(
      message: 'A pleasant surprise may be waiting in today\'s plans.',
      category: 'daily',
      luckyNumbers: [8, 17, 31, 41, 56, 70],
    ),
    // Lotus Fortune
    FortuneEntry(
      message: 'Like gentle rain nourishing a garden, today\'s quiet moments are helping beautiful things grow.',
      category: 'lotus', title: '🌸 Lotus Fortune',
      luckyNumbers: [6, 15, 26, 40, 51, 63],
      luckyColor: 'Pearl White',
    ),
    FortuneEntry(message: 'Someone\'s encouragement will brighten your day.', category: 'daily'),
    FortuneEntry(message: 'The best is quietly yet to come.', category: 'daily'),
    FortuneEntry(
      message: 'Today is perfect for welcoming happiness.',
      category: 'daily',
      luckyNumbers: [4, 19, 30, 44, 54, 66],
    ),
    // Dragon Fortune
    FortuneEntry(
      message: 'Your courage is stronger than you know. Walk confidently toward your dreams—they are closer than they appear.',
      category: 'dragon', title: '🐉 Dragon Fortune',
      luckyNumbers: [9, 20, 34, 45, 58, 61, 80],
      luckyColor: 'Dragon Red',
    ),
    FortuneEntry(message: 'A joyful invitation may soon find you.', category: 'daily'),
    FortuneEntry(message: 'Someone may soon say exactly what you needed to hear.', category: 'daily'),
    FortuneEntry(
      message: 'Great things often begin quietly.',
      category: 'daily',
      luckyNumbers: [1, 12, 28, 37, 53, 65],
    ),
    FortuneEntry(message: 'The best conversations happen when you least expect them.', category: 'daily', title: '🥠 Classic Fortune'),
    FortuneEntry(message: 'Today may become one of your favorite memories.', category: 'daily'),
    FortuneEntry(
      message: 'A peaceful decision today creates tomorrow\'s success.',
      category: 'daily',
      luckyNumbers: [5, 18, 27, 42, 57, 69],
    ),
    FortuneEntry(message: 'Your optimism is creating beautiful opportunities.', category: 'daily'),
    FortuneEntry(message: 'A smile shared today may return for years to come.', category: 'daily'),
    FortuneEntry(
      message: 'Fortune enjoys the company of grateful hearts.',
      category: 'daily',
      luckyNumbers: [7, 13, 29, 41, 55, 32],
    ),
    FortuneEntry(message: 'Your future is filled with joyful possibilities.', category: 'daily'),
    FortuneEntry(message: 'Every sunrise brings another chance to bloom.', category: 'daily'),
    FortuneEntry(
      message: 'Wonderful things are already moving toward you.',
      category: 'daily',
      luckyNumbers: [2, 16, 33, 46, 59, 64],
    ),
    FortuneEntry(message: 'Today is another beautiful day to Flow, Grow & Bloom.', category: 'daily'),

    // ── Fortunes 331–360 ──
    FortuneEntry(
      message: 'A beautiful surprise is finding its way to you.',
      category: 'daily',
      luckyNumbers: [4, 15, 27, 38, 52, 66],
    ),
    FortuneEntry(message: 'Today is filled with quiet reasons to celebrate.', category: 'daily'),
    FortuneEntry(message: 'Someone\'s kindness will brighten your day.', category: 'daily'),
    FortuneEntry(
      message: 'A joyful opportunity is closer than it appears.',
      category: 'daily',
      luckyNumbers: [8, 17, 26, 40, 54, 69],
    ),
    // Rainbow Fortune (Ultra Rare)
    FortuneEntry(
      message: 'Today is a truly extraordinary day. Keep your heart open and your spirit light. Wonderful surprises often arrive when joy leads the way.',
      category: 'rainbow', title: '🌈 Rainbow Fortune',
      luckyNumbers: [3, 12, 21, 36, 45, 58, 63],
      luckyColor: 'Rainbow Pearl',
    ),
    FortuneEntry(message: 'Your next smile may become someone else\'s favorite moment.', category: 'daily'),
    FortuneEntry(message: 'Good fortune enjoys patient hearts.', category: 'daily'),
    FortuneEntry(
      message: 'A cheerful conversation may open a new door.',
      category: 'daily',
      luckyNumbers: [5, 18, 30, 41, 56, 61],
    ),
    // Lotus Fortune
    FortuneEntry(
      message: 'Even the smallest seed becomes a beautiful flower with patience. Continue growing—your season is coming.',
      category: 'lotus', title: '🌸 Lotus Fortune',
      luckyNumbers: [6, 16, 28, 39, 51, 64],
      luckyColor: 'Jade Green',
    ),
    FortuneEntry(message: 'The future is quietly preparing something wonderful.', category: 'daily'),
    FortuneEntry(message: 'A familiar face may bring unexpected happiness.', category: 'daily'),
    FortuneEntry(
      message: 'Today\'s smallest blessing may become tomorrow\'s greatest gift.',
      category: 'daily',
      luckyNumbers: [7, 20, 31, 43, 55, 68],
    ),
    // Golden Fortune
    FortuneEntry(
      message: 'Fortune is smiling upon you today. Walk confidently and welcome every opportunity with gratitude.',
      category: 'golden', title: '🌟 Golden Fortune',
      luckyNumbers: [1, 13, 25, 37, 49, 63, 68],
      luckyColor: 'Golden Sunrise',
    ),
    FortuneEntry(message: 'Someone may soon thank you for your kindness.', category: 'daily'),
    FortuneEntry(message: 'A peaceful day often becomes a memorable one.', category: 'daily'),
    FortuneEntry(
      message: 'Trust yourself—today\'s choice may lead somewhere beautiful.',
      category: 'daily',
      luckyNumbers: [9, 19, 29, 42, 57, 62],
    ),
    // Dragon Fortune
    FortuneEntry(
      message: 'Strength and wisdom are your companions today. Move forward with confidence—new possibilities await.',
      category: 'dragon', title: '🐉 Dragon Fortune',
      luckyNumbers: [2, 14, 33, 44, 53, 67, 69],
      luckyColor: 'Dragon Gold',
    ),
    FortuneEntry(message: 'Someone\'s laughter may become your favorite sound today.', category: 'daily'),
    FortuneEntry(message: 'Your peaceful spirit attracts joyful moments.', category: 'daily'),
    FortuneEntry(
      message: 'Great things often arrive quietly.',
      category: 'daily',
      luckyNumbers: [10, 22, 34, 46, 59, 64],
    ),
    FortuneEntry(message: 'Today\'s lucky moment may be hiding in plain sight.', category: 'daily', title: '🥠 Classic Fortune'),
    FortuneEntry(message: 'A warm greeting may begin a wonderful friendship.', category: 'love'),
    FortuneEntry(
      message: 'Happiness often arrives dressed as an ordinary day.',
      category: 'daily',
      luckyNumbers: [5, 17, 24, 35, 48, 62],
    ),
    FortuneEntry(message: 'Your kindness is creating beautiful ripples.', category: 'daily'),
    FortuneEntry(message: 'A dream you\'ve quietly held is beginning to bloom.', category: 'daily'),
    FortuneEntry(
      message: 'Good things are already moving toward you.',
      category: 'daily',
      luckyNumbers: [8, 18, 27, 41, 52, 60],
    ),
    FortuneEntry(message: 'Keep your heart open—today may surprise you.', category: 'daily'),
    FortuneEntry(message: 'Someone is cheering for your success.', category: 'daily'),
    FortuneEntry(
      message: 'Joy grows wherever gratitude lives.',
      category: 'daily',
      luckyNumbers: [3, 11, 30, 45, 56, 65],
    ),

    // ── Final Fortunes 361–366 ──
    FortuneEntry(
      message: 'Every sunrise is a reminder that beautiful beginnings never run out.',
      category: 'daily',
      luckyNumbers: [7, 18, 29, 43, 56, 71],
    ),
    FortuneEntry(
      message: 'Someone is smiling today because of something you once did.',
      category: 'daily', title: '🥠 Classic Fortune',
      luckyNumbers: [3, 14, 25, 37, 48, 63],
    ),
    // Lotus Fortune
    FortuneEntry(
      message: 'Just as every lotus opens at its perfect moment, your greatest blessings will arrive at exactly the right time. Trust your journey and continue to bloom.',
      category: 'lotus', title: '🌸 Lotus Fortune',
      luckyNumbers: [6, 17, 28, 40, 52, 66],
      luckyColor: 'Lotus Gold',
    ),
    // Dragon Fortune
    FortuneEntry(
      message: 'Today carries the strength of courage and the wisdom of patience. Walk forward with confidence—your future is brighter than you imagine.',
      category: 'dragon', title: '🐉 Dragon Fortune',
      luckyNumbers: [2, 16, 31, 45, 58, 73, 81],
      luckyColor: 'Imperial Crimson',
    ),
    // Rainbow Fortune (Ultra Rare)
    FortuneEntry(
      message: 'Today is a day to celebrate life\'s quiet miracles. Keep your heart open, welcome unexpected joy, and remember that even the smallest moments can become treasured memories.',
      category: 'rainbow', title: '🌈 Rainbow Fortune',
      luckyNumbers: [5, 11, 22, 36, 49, 64, 77],
      luckyColor: 'Rainbow Pearl',
    ),
    // Final Fortune  
    FortuneEntry(
      message: 'Thank you for sharing another beautiful year with ChiGlow. May your home be filled with harmony. May your heart be filled with peace. May your path be filled with hope. And may every new day invite you to Flow. Grow. Bloom.',
      category: 'daily', title: '🌸 Final Fortune',
      luckyNumbers: [8, 20, 33, 47, 59, 72],
      luckyColor: 'ChiGlow Gold',
    ),

    // ── Abundance & Prosperity Fortunes ──
    FortuneEntry(message: 'Prosperity is quietly growing in your life.', category: 'abundance', title: '🍀 Abundance'),
    FortuneEntry(message: 'A new door of opportunity is preparing to open.', category: 'abundance', title: '🍀 Prosperity'),
    FortuneEntry(message: 'Your generosity attracts lasting abundance.', category: 'abundance', title: '🍀 Abundance'),
    FortuneEntry(message: 'Good fortune follows a grateful heart.', category: 'abundance', title: '🍀 Fortune'),
    FortuneEntry(message: 'Expect something wonderful today.', category: 'abundance', title: '🍀 Abundance'),
    FortuneEntry(message: 'Success often arrives through quiet persistence.', category: 'abundance', title: '🍀 Success'),
    FortuneEntry(message: 'A pleasant surprise may bring unexpected happiness.', category: 'abundance', title: '🍀 Surprise'),
    FortuneEntry(message: 'Today\'s positive choices create tomorrow\'s rewards.', category: 'abundance', title: '🍀 Reward'),
    FortuneEntry(message: 'Your efforts are beginning to bear fruit.', category: 'abundance', title: '🍀 Harvest'),
    FortuneEntry(message: 'Abundance begins with believing in new possibilities.', category: 'abundance', title: '🍀 Abundance'),
    FortuneEntry(message: 'Prosperity is growing in ways you cannot yet see.', category: 'abundance', title: '🍀 Prosperity'),
    FortuneEntry(message: 'A fortunate opportunity is preparing to find you.', category: 'abundance', title: '🍀 Fortune'),
    FortuneEntry(message: 'Abundance flows most freely through grateful hearts.', category: 'abundance', title: '🍀 Abundance'),
    FortuneEntry(message: 'Financial peace begins with confident choices.', category: 'abundance', title: '🍀 Peace'),
    FortuneEntry(message: 'A valuable opportunity may appear unexpectedly.', category: 'abundance', title: '🍀 Opportunity'),
    FortuneEntry(message: 'Today carries the energy of prosperity.', category: 'abundance', title: '🍀 Prosperity'),
    FortuneEntry(message: 'Your hard work is quietly creating future rewards.', category: 'abundance', title: '🍀 Reward'),
    FortuneEntry(message: 'Success is moving closer with every patient step.', category: 'abundance', title: '🍀 Success'),
    FortuneEntry(message: 'Good fortune enjoys the company of optimism.', category: 'abundance', title: '🍀 Fortune'),
    FortuneEntry(message: 'Your future holds more abundance than you imagine.', category: 'abundance', title: '🍀 Abundance'),
    FortuneEntry(message: 'Luck is quietly walking beside you today.', category: 'abundance', title: '🍀 Luck'),
    FortuneEntry(message: 'Expect an encouraging conversation soon.', category: 'abundance', title: '🍀 Conversation'),
    FortuneEntry(message: 'Prosperity finds those who welcome possibility.', category: 'abundance', title: '🍀 Prosperity'),
    FortuneEntry(message: 'A fortunate discovery is waiting to be made.', category: 'abundance', title: '🍀 Discovery'),
    FortuneEntry(message: 'Good news may arrive sooner than expected.', category: 'abundance', title: '🍀 News'),
    FortuneEntry(message: 'Your next decision may lead to wonderful things.', category: 'abundance', title: '🍀 Decision'),
    FortuneEntry(message: 'Today is filled with lucky possibilities.', category: 'abundance', title: '🍀 Luck'),
    FortuneEntry(message: 'Success is already moving in your direction.', category: 'abundance', title: '🍀 Success'),
    FortuneEntry(message: 'Your future is brighter than you imagine.', category: 'abundance', title: '🍀 Future'),
    FortuneEntry(message: 'Something you\'ve wished for is gently finding its way to you.', category: 'abundance', title: '🍀 Wish'),

    // ── Love, Family & Friendship Fortunes ──
    FortuneEntry(message: 'Love flows through every action you take today.', category: 'love', title: '💖 Love'),
    FortuneEntry(message: 'A heartfelt connection will deepen today.', category: 'love', title: '💖 Connection'),
    FortuneEntry(message: 'Your presence is a gift to those around you.', category: 'love', title: '💖 Presence'),
    FortuneEntry(message: 'The bonds you nurture today will flourish for years.', category: 'love', title: '💖 Bonds'),
    FortuneEntry(message: 'An act of kindness will return to you in unexpected ways.', category: 'love', title: '💖 Kindness'),
    FortuneEntry(message: 'Your gentle spirit attracts beautiful relationships.', category: 'love', title: '💖 Spirit'),
    FortuneEntry(message: 'Today, choose understanding over being right.', category: 'love', title: '💖 Understanding'),
    FortuneEntry(message: 'A warm memory will inspire a joyful decision.', category: 'love', title: '💖 Memory'),
    FortuneEntry(message: 'The love you give freely comes back to you multiplied.', category: 'love', title: '💖 Love'),
    FortuneEntry(message: 'A meaningful conversation will deepen a connection.', category: 'love', title: '💖 Conversation'),
    FortuneEntry(message: 'Your heart is opening to new possibilities.', category: 'love', title: '💖 Heart'),
    FortuneEntry(message: 'A small gesture of appreciation will mean more than you know.', category: 'love', title: '💖 Appreciation'),
    FortuneEntry(message: 'The relationships you invest in today will sustain you tomorrow.', category: 'love', title: '💖 Relationships'),
    FortuneEntry(message: 'Forgiveness lightens your heart and opens new doors.', category: 'love', title: '💖 Forgiveness'),
    FortuneEntry(message: 'A shared laugh will strengthen a precious bond.', category: 'love', title: '💖 Laughter'),
    FortuneEntry(message: 'Your capacity for love is your greatest strength.', category: 'love', title: '💖 Strength'),
    FortuneEntry(message: 'A loving message will arrive just when you need it.', category: 'love', title: '💖 Message'),
    FortuneEntry(message: 'The beauty you see in others reflects the beauty within you.', category: 'love', title: '💖 Beauty'),
    FortuneEntry(message: 'Today, let someone know how much they mean to you.', category: 'love', title: '💖 Gratitude'),
    FortuneEntry(message: 'A connection from the past will bring unexpected warmth.', category: 'love', title: '💖 Reconnection'),

    // ── Golden Fortunes (Rare) ──
    FortuneEntry(
      message: 'A golden light surrounds you today. Something truly wonderful is approaching.',
      category: 'golden', title: '🌟 Golden Fortune',
      luckyNumbers: [7, 21, 33, 45, 88],
      luckyColor: 'Gold',
    ),
    FortuneEntry(
      message: 'The universe is preparing a gift of unexpected beauty for you.',
      category: 'golden', title: '🌟 Golden Fortune',
      luckyNumbers: [11, 24, 36, 42, 77],
      luckyColor: 'Gold',
    ),
    FortuneEntry(
      message: 'A rare moment of grace will touch your heart today.',
      category: 'golden', title: '🌟 Golden Fortune',
      luckyNumbers: [3, 17, 29, 55, 99],
      luckyColor: 'Warm Gold',
    ),
    FortuneEntry(
      message: 'Golden energy surrounds you. Something extraordinary is finding its way to you.',
      category: 'golden', title: '🌟 Golden Fortune',
      luckyNumbers: [8, 19, 44, 66, 100],
      luckyColor: 'Gold',
    ),
    FortuneEntry(
      message: 'The stars are aligning to bring you a rare and beautiful blessing.',
      category: 'golden', title: '🌟 Golden Fortune',
      luckyNumbers: [5, 14, 28, 39, 72],
      luckyColor: 'Golden Yellow',
    ),

    // ── Lotus Fortunes (Very Rare) ──
    FortuneEntry(
      message: 'Like the lotus, you rise from stillness into radiant beauty. Something sacred is awakening within you.',
      category: 'lotus', title: '🌸 Lotus Fortune',
      luckyNumbers: [6, 13, 27, 44, 68, 99],
      luckyColor: 'Soft Pink',
    ),
    FortuneEntry(
      message: 'A profound peace is settling around you. Trust the stillness and let it guide you.',
      category: 'lotus', title: '🌸 Lotus Fortune',
      luckyNumbers: [2, 16, 31, 49, 73, 88],
      luckyColor: 'Lotus Pink',
    ),
    FortuneEntry(
      message: 'The lotus blooms in muddy waters. Your past struggles are transforming into your greatest beauty.',
      category: 'lotus', title: '🌸 Lotus Fortune',
      luckyNumbers: [9, 22, 38, 56, 81, 100],
      luckyColor: 'Rose Gold',
    ),

    // ── Dragon Fortunes (Ultra Rare) ──
    FortuneEntry(
      message: 'The dragon awakens within you. Unprecedented power and fortune are flowing into your life.',
      category: 'dragon', title: '🐉 Dragon Fortune',
      luckyNumbers: [1, 12, 28, 44, 77, 99, 111],
      luckyColor: 'Dragon Red',
    ),
    FortuneEntry(
      message: 'You are being called to rise. The dragon's courage fills your heart. Greatness awaits.',
      category: 'dragon', title: '🐉 Dragon Fortune',
      luckyNumbers: [7, 19, 33, 55, 88, 104, 222],
      luckyColor: 'Imperial Red',
    ),

    // ── Rainbow Fortunes (Extremely Rare) ──
    FortuneEntry(
      message: 'A rainbow of blessings stretches across your path. Every color of joy is entering your life at once. This is a truly magical moment.',
      category: 'rainbow', title: '🌈 Rainbow Fortune',
      luckyNumbers: [3, 7, 15, 28, 44, 66, 88, 100],
      luckyColor: 'Rainbow',
    ),
    FortuneEntry(
      message: 'The universe is painting a masterpiece in your life. Every color of happiness, every shade of joy. You are witnessing something deeply magical.',
      category: 'rainbow', title: '🌈 Rainbow Fortune',
      luckyNumbers: [5, 13, 24, 39, 57, 72, 96, 108],
      luckyColor: 'Rainbow',
    ),

    // ── Seasonal & Holiday Fortunes ──
    FortuneEntry(message: 'The energy of spring renewal fills your heart. Bloom beautifully today.', category: 'seasonal', title: '🌸 Spring'),
    FortuneEntry(message: 'Summer's warmth invites you to shine. Let your light radiate.', category: 'seasonal', title: '☀️ Summer'),
    FortuneEntry(message: 'Autumn's golden wisdom surrounds you. Harvest the beauty of your journey.', category: 'seasonal', title: '🍂 Autumn'),
    FortuneEntry(message: 'Winter's quiet stillness brings inner peace. Rest and prepare for new beginnings.', category: 'seasonal', title: '❄️ Winter'),
    FortuneEntry(message: 'A new year brings infinite possibilities. The universe is ready for your dreams.', category: 'seasonal', title: '🎆 New Year'),
    FortuneEntry(message: 'The season of love is upon you. Open your heart to the beauty around you.', category: 'seasonal', title: '💝 Love'),
    FortuneEntry(message: 'A season of gratitude and abundance. Count your blessings and watch them grow.', category: 'seasonal', title: '🦃 Gratitude'),
    FortuneEntry(message: 'The magic of the season fills the air. Joy and peace are finding their way to you.', category: 'seasonal', title: '🎄 Holiday'),
  ];

  /// Get the fortune for a specific day of the year (1-based, 1–366).
  static FortuneEntry getFortuneForDay(int dayOfYear) {
    // Ensure we wrap around safely
    final index = (dayOfYear - 1).clamp(0, allFortunes.length - 1);
    return allFortunes[index];
  }
}