import '../../../../config.dart';

class CartDetail extends StatelessWidget {
  final OrderDetail? orderDetail;
  final bool? isApplyText;
  final String? val, totalAmount;
  const CartDetail(
      {Key? key,
      this.orderDetail,
      this.isApplyText,
      this.totalAmount,
      this.val})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LatoFontStyle(
              text: orderDetail!.title,
              fontSize: FontSizes.f14,
              color: appCtrl.appTheme.contentColor),
          LatoFontStyle(
                  text: orderDetail!.title == "Coupon Discount" ||
                          orderDetail!.title == "خصم القسيمة" ||
                          orderDetail!.title == "कूपन छूट" ||
                          orderDetail!.title == "쿠폰 할인"
                      ? isApplyText!
                          ? val
                          : "-${appCtrl.priceSymbol}20.0"
                      : val,
                  fontSize: FontSizes.f14,
                  color: orderDetail!.title == "Bag savings"
                      ? appCtrl.appTheme.greenColor
                      : orderDetail!.title == "Coupon Discount" ||
                              orderDetail!.title == "خصم القسيمة" ||
                              orderDetail!.title == "कूपन छूट" ||
                              orderDetail!.title == "쿠폰 할인"
                          ? isApplyText!
                              ? appCtrl.appTheme.primary
                              : appCtrl.appTheme.contentColor
                          : appCtrl.appTheme.contentColor)
              .gestures(onTap: () {
            if (orderDetail!.value == "Apply Coupon") {
              Get.toNamed(routeName.coupons, arguments: totalAmount);
            }
          }),
        ],
      ).marginOnly(bottom: AppScreenUtil().screenHeight(10));
    });
  }
}
