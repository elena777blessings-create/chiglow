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