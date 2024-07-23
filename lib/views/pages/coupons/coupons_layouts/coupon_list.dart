import 'dart:developer';

import 'package:multikart/config.dart';
import 'package:multikart/models/discount.dart';

class CouponList extends StatelessWidget {
  final List<CouponModel>? couponList;

  const CouponList({Key? key, this.couponList}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<CartController>(builder: (cartCtrl) {
      return GetBuilder<CouponsController>(builder: (couponCtrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...couponList!.asMap().entries.map((e) {
              return CouponCard(
                couponModel: e.value,
                index: e.key,
                lastIndex: couponList!.length - 1,
                onTap: () {

                  couponCtrl.applyCouponList(
                    context,
                    code: e.value.code,
                    coupons: e.value,
                    success: (Discount discount) async {
                      log("DISCOUNT : $discount");
                      log("DISCOUNT : ${discount.coupon}");
                      log("DISCOUNT : ${discount.discountValue}");
                      couponCtrl.isLoading = false;
                      couponCtrl.update();
                      Get.back(result: e.value);
                      /*await cartCtrl.updateDiscount(discount: discount);
>>>>>>> Stashed changes
                        cartCtrl.setLoadedDiscount();*/
                      },
                    );
                  },
                );
              }).toList()
            ],
          );
        });
      }
    );
  }
}
