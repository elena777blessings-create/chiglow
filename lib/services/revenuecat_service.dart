import 'package:purchases_flutter/purchases_flutter.dart';

/// RevenueCat service for managing in-app purchases and subscriptions.
/// Uses placeholder API keys — replace with real keys before production.
class RevenueCatService {
  static const String _apiKeyIOS = 'appl_placeholder_revenuecat_key';
  static const String _apiKeyAndroid = 'goog_placeholder_revenuecat_key';

  // Entitlement identifiers (must match RevenueCat dashboard)
  static const String entitlementYearly = 'premium_yearly';
  static const String entitlementMonthly = 'premium_monthly';
  static const String entitlementFounder = 'founders_edition';

  static RevenueCatService? _instance;
  factory RevenueCatService() => _instance ??= RevenueCatService._();
  RevenueCatService._();

  bool _initialized = false;

  /// Initialize RevenueCat SDK. Call once at app startup.
  Future<void> initialize() async {
    if (_initialized) return;
    await Purchases.setLogLevel(LogLevel.debug);
    await Purchases.configure(PurchasesConfiguration(
      _apiKeyIOS,
      // For Android, use the separate API key parameter if needed.
      // Purchases.configure expects a single API key that works for both platforms.
    ));
    _initialized = true;
  }

  /// Set the user ID (e.g., from your auth system). Optional.
  Future<void> setUserId(String userId) async {
    await Purchases.logIn(userId);
  }

  /// Clear the user ID on logout.
  Future<void> clearUserId() async {
    await Purchases.logOut();
  }

  /// Fetch available offerings (the pricing tiers configured in RevenueCat).
  Future<List<Offering>> getOfferings() async {
    final offerings = await Purchases.getOfferings();
    return offerings.all.values.toList();
  }

  /// Purchase a given package (tier).
  Future<CustomerInfo> purchasePackage(Package package) async {
    final result = await Purchases.purchasePackage(package);
    return result.customerInfo;
  }

  /// Check if the current user has an active entitlement.
  Future<bool> hasActiveEntitlement(String entitlementId) async {
    final customerInfo = await Purchases.getCustomerInfo();
    final entitlement = customerInfo.entitlements.all[entitlementId];
    return entitlement?.isActive == true;
  }

  /// Get current customer info (for restore purchases, etc.).
  Future<CustomerInfo> getCustomerInfo() async {
    return await Purchases.getCustomerInfo();
  }

  /// Restore purchases (Apple / Google).
  Future<CustomerInfo> restorePurchases() async {
    return await Purchases.restorePurchases();
  }

  /// Map tier index to entitlement identifier.
  static String entitlementForTier(int tierIndex) {
    switch (tierIndex) {
      case 0:
        return entitlementYearly;
      case 1:
        return entitlementMonthly;
      case 2:
        return entitlementFounder;
      default:
        return entitlementYearly;
    }
  }
}