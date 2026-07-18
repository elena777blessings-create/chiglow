import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:flutter/material.dart';
import '../services/revenuecat_service.dart';

/// Provider that manages the user's purchase/subscription state.
/// Wraps RevenueCat's CustomerInfo and exposes a simple isPremium check.
class PurchaseProvider extends ChangeNotifier {
  final RevenueCatService _revenueCat = RevenueCatService();

  bool _initialized = false;
  bool _isPremium = false;
  CustomerInfo? _customerInfo;
  List<Offering> _offerings = [];
  bool _isLoading = false;
  String? _error;

  bool get isInitialized => _initialized;
  bool get isPremium => _isPremium;
  CustomerInfo? get customerInfo => _customerInfo;
  List<Offering> get offerings => _offerings;
  bool get isLoading => _isLoading;
  String? get error => _error;

  /// Initialize the provider. Call once at app startup.
  Future<void> initialize() async {
    if (_initialized) return;
    _isLoading = true;
    notifyListeners();

    try {
      await _revenueCat.initialize();
      await _refreshCustomerInfo();
      _initialized = true;
    } catch (e) {
      _error = 'Failed to initialize purchases: $e';
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Refresh customer info and check entitlements.
  Future<void> _refreshCustomerInfo() async {
    try {
      _customerInfo = await _revenueCat.getCustomerInfo();
      _checkEntitlement();
    } catch (e) {
      _error = 'Failed to refresh purchases: $e';
    }
  }

  /// Check the single "ChiGlow Pro" entitlement.
  void _checkEntitlement() {
    if (_customerInfo == null) return;

    final entitlement =
        _customerInfo!.entitlements.all[RevenueCatService.entitlementChiGlowPro];
    _isPremium = entitlement?.isActive == true;
  }

  /// Fetch available offerings from RevenueCat.
  Future<void> fetchOfferings() async {
    _isLoading = true;
    notifyListeners();

    try {
      _offerings = await _revenueCat.getOfferings();
      _error = null;
    } catch (e) {
      _error = 'Failed to fetch offerings: $e';
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Purchase a package for the given tier index.
  Future<bool> purchaseTier(int tierIndex) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final productId = RevenueCatService.productIdForTier(tierIndex);
      Package? targetPackage;

      for (final offering in _offerings) {
        for (final package in offering.availablePackages) {
          if (package.identifier == productId) {
            targetPackage = package;
            break;
          }
        }
        if (targetPackage != null) break;
      }

      if (targetPackage == null) {
        _error = 'No package found for this tier';
        _isLoading = false;
        notifyListeners();
        return false;
      }

      await _revenueCat.purchasePackage(targetPackage);
      await _refreshCustomerInfo();
      _isLoading = false;
      notifyListeners();
      return _isPremium;
    } catch (e) {
      _error = 'Purchase failed: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  /// Restore previously purchased subscriptions.
  Future<bool> restorePurchases() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _revenueCat.restorePurchases();
      await _refreshCustomerInfo();
      _isLoading = false;
      notifyListeners();
      return _isPremium;
    } catch (e) {
      _error = 'Restore failed: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  /// Present the RevenueCat built-in Paywall as a modal.
  /// Returns true if the user completed a purchase.
  Future<bool> presentPaywall(BuildContext context) async {
    try {
      final result = await RevenueCatUI.presentPaywall(
        context: context,
        onDismissed: () {
          // Called when the paywall is dismissed without purchase
        },
      );
      // Refresh after paywall interaction
      await _refreshCustomerInfo();
      return _isPremium;
    } catch (e) {
      _error = 'Paywall failed: $e';
      notifyListeners();
      return false;
    }
  }

  /// Present the RevenueCat Customer Center for managing subscriptions.
  Future<void> presentCustomerCenter(BuildContext context) async {
    try {
      await RevenueCatUI.presentCustomerCenter(context: context);
      await _refreshCustomerInfo();
    } catch (e) {
      _error = 'Customer Center failed: $e';
      notifyListeners();
    }
  }

  /// Clear any errors.
  void clearError() {
    _error = null;
    notifyListeners();
  }
}