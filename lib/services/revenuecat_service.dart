import 'package:purchases_flutter/purchases_flutter.dart';

/// RevenueCat service for managing in-app purchases and subscriptions.
/// Single "ChiGlow Pro" entitlement with Monthly, Yearly, and Lifetime products.
class RevenueCatService {
  /// RevenueCat public SDK key
  static const String apiKey = 'test_impbnfOqauoVmMtryhXHkjbcPgX';

  /// Single premium entitlement (configured in RevenueCat dashboard)
  static const String entitlementChiGlowPro = 'ChiGlow Pro';

  /// Product identifiers (must match RevenueCat dashboard products)
  static const String productMonthly = 'monthly';
  static const String productYearly = 'yearly';
  static const String productLifetime = 'lifetime';

  static RevenueCatService? _instance;
  factory RevenueCatService() => _instance ??= RevenueCatService._();
  RevenueCatService._();

  bool _initialized = false;

  /// Initialize RevenueCat SDK. Call once at app startup.
  Future<void> initialize() async {
    if (_initialized) return;
    await Purchases.setLogLevel(LogLevel.debug);
    await Purchases.configure(PurchasesConfiguration(apiKey));
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

  /// Get the current offering (the one marked as "current" in RevenueCat).
  Future<Offering?> getCurrentOffering() async {
    final offerings = await Purchases.getOfferings();
    return offerings.current;
  }

  /// Purchase a given package.
  Future<CustomerInfo> purchasePackage(Package package) async {
    final result = await Purchases.purchasePackage(package);
    return result.customerInfo;
  }

  /// Check if the user has an active "ChiGlow Pro" entitlement.
  Future<bool> hasChiGlowPro() async {
    final customerInfo = await Purchases.getCustomerInfo();
    final entitlement = customerInfo.entitlements.all[entitlementChiGlowPro];
    return entitlement?.isActive == true;
  }

  /// Get current customer info.
  Future<CustomerInfo> getCustomerInfo() async {
    return await Purchases.getCustomerInfo();
  }

  /// Restore purchases (Apple / Google).
  Future<CustomerInfo> restorePurchases() async {
    return await Purchases.restorePurchases();
  }

  /// Map tier index to package identifier (matches RevenueCat products).
  static String productIdForTier(int tierIndex) {
    switch (tierIndex) {
      case 0:
        return productYearly;
      case 1:
        return productMonthly;
      case 2:
        return productLifetime;
      default:
        return productYearly;
    }
  }
}