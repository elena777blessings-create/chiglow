/// Asset image path mappings for ChiGlow room illustrations, koi, and lotus images.

class AssetImages {
  /// Room illustrations — maps room type string to image asset path
  static const Map<String, String> roomImages = {
    'Living Room': 'assets/images/room_living.png',
    'Bedroom': 'assets/images/room_bedroom.png',
    'Kitchen': 'assets/images/room_kitchen.png',
    'Dining Room': 'assets/images/room_dining.png',
    'Entryway': 'assets/images/room_entryway.png',
    'Home Office': 'assets/images/room_office.png',
    'Office': 'assets/images/room_office.png',
    'Garden': 'assets/images/room_garden.png',
    'Front Yard': 'assets/images/room_frontyard.png',
    'Backyard': 'assets/images/room_garden.png',
    'Corporate Office': 'assets/images/room_corporate.png',
    'Retail Store': 'assets/images/room_retail.png',
    'Restaurant/Café': 'assets/images/room_restaurant.png',
    'Bathroom': 'assets/images/room_bedroom.png', // fallback
  };

  /// Koi fish images — color → asset path
  static const Map<String, String> koiImages = {
    'gold': 'assets/images/koi_gold.png',
    'pink': 'assets/images/koi_pink.png',
    'green': 'assets/images/koi_green.png',
    'blue': 'assets/images/koi_blue.png',
    'white': 'assets/images/koi_white.png',
  };

  /// Gold lotus decorative image
  static const String lotusGold = 'assets/images/lotus_gold.png';

  /// Splash screen artwork
  static const String splashArt = 'assets/images/splash_artwork.png';

  /// App icon
  static const String appIcon = 'assets/icons/app_icon.png';

  /// Get room image path for a given room type
  static String roomImageFor(String roomType) {
    return roomImages[roomType] ?? 'assets/images/room_living.png';
  }

  /// Get koi image path for a named koi
  static String koiImage(String color) {
    return koiImages[color] ?? 'assets/images/koi_white.png';
  }
}