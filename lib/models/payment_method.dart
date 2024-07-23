
import 'dart:developer';

bool isNotBlank(String? s) => s != null && s.trim().isNotEmpty;

class PaymentMethod {
  String? id;
  String? title;
  String? description;
  bool? enabled;

  PaymentMethod({
    this.id,
    this.title,
    this.description,
    this.enabled,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'enabled': enabled
    };
  }

  PaymentMethod.fromJson(Map parsedJson) {
    id = parsedJson['id'];
    title = isNotBlank(parsedJson['title'])
        ? parsedJson['title']
        : parsedJson['method_title'];
    description = parsedJson['description'] is String &&
            isNotBlank(parsedJson['description'])
        ? parsedJson['description']
        : null;
    enabled = true;
  }

  PaymentMethod.fromMagentoJson(Map parsedJson) {
    id = parsedJson['code'];
    title = parsedJson['title'];
    description = '';
    enabled = true;
  }

  PaymentMethod.fromOpencartJson(Map parsedJson) {
    id = parsedJson['code'];
    title = parsedJson['title'];
    description = '';
    enabled = true;
  }

  PaymentMethod.fromPrestaJson(Map parsedJson) {
    id = parsedJson['name'];
    title = parsedJson['active'];
    description = '';
    enabled = true;
  }

  static String stripeGooglePay = 'stripe_v2_google_pay';
  static String stripeApplePay = 'stripe_v2_apple_pay';

  bool get isStripeGooglePay => id == stripeGooglePay;

  bool get isStripeApplePay => id == stripeApplePay;

}
