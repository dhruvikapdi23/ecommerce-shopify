

import 'package:multikart/shopify/models/coupon.dart';

class Discount {
  Coupon? coupon;
  double? discountValue;

  Discount({this.coupon, this.discountValue});

  Discount.fromJson(Map json) {
    coupon = json['coupon'] != null ? Coupon.fromJson(json['coupon']) : null;
    discountValue = double.parse('${(json['discount'] ?? 0.0)}');
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (coupon != null) {
      data['coupon'] = coupon!.toJson();
    }
    data['discount'] = discountValue;
    return data;
  }
}