import 'package:flutter/material.dart';
import 'package:multikart/shopify/mixin/shopify_mixin.dart';

import 'package:multikart/shopify/models/payment_settings.dart';

class PaymentSettingsModel extends ChangeNotifier with ShopifyMixin {
  late PaymentSettings paymentSettings;
  bool isLoading = true;
  String? message;
  String? cardVaultUrl;

  Future<void> getPaymentSettings() async {
    try {
      paymentSettings = await shopifyService.getPaymentSettings()!;

      isLoading = false;
      message = null;
      notifyListeners();
    } catch (err) {
      isLoading = false;
      message =
          'There is an issue with the app during request the data, please contact admin for fixing the issues $err';
      notifyListeners();
    }
  }


  String? getCardVaultUrl() {
    return paymentSettings.cardVaultUrl;
  }
}
