import 'package:flutter/material.dart';
import 'package:multikart/models/cart_model.dart';
import 'package:multikart/models/index.dart';
import 'package:multikart/shopify/mixin/shopify_mixin.dart';
import 'package:multikart/shopify/models/credit_card.dart';
import 'payment_settings_model.dart';

class CreditCardModel extends ChangeNotifier with ShopifyMixin {
  CreditCard? creditCard;
  bool isLoading = true;
  String? message;

  void setCreditCard(
      String cardNumber, String cardHolderName, String expiryDate, String cvv) {
    creditCard!.setCreditCard(cardNumber, cardHolderName, expiryDate, cvv);
  }

  // ignore: missing_return
  Future<String> checkoutWithCreditCard(String? vaultId, CartModel cartModel,
      AddressList address, PaymentSettingsModel paymentSettingsModel) async {
    try {
      var result = await shopifyService.checkoutWithCreditCard(
          vaultId, cartModel, address, paymentSettingsModel);

      isLoading = false;
      message = null;
      notifyListeners();

      return result;
    } catch (err) {
      isLoading = false;
      message =
          'There is an issue with the app during request the data, please contact admin for fixing the issues $err';
      notifyListeners();
      return '';
    }
  }

  CreditCard? getCreditCard() {
    return creditCard;
  }
}
