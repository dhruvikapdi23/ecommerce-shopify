import 'package:multikart/config.dart';
import 'package:multikart/shopify/models/address.dart';
import 'package:multikart/shopify/models/coupon.dart';

class CartOrderDetailLayout extends StatelessWidget {
  final bool isDeliveryShow, isApplyText;
  final Address? address;

  const CartOrderDetailLayout(
      {Key? key,
      this.isDeliveryShow = true,
      this.isApplyText = true,
      this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartCtrl) {
      return GetBuilder<PaymentController>(builder: (paymentCtrl) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LatoFontStyle(
                  text: CartFont().bagTotal.tr,
                  fontSize: FontSizes.f14,
                  color: appCtrl.appTheme.contentColor),
              LatoFontStyle(
                  text:
                      "${appCtrl.priceSymbol}${(cartCtrl.getSubPriceTotal()! * appCtrl.rateValue).toStringAsFixed(2)}",
                  fontSize: FontSizes.f14,
                  color: appCtrl.appTheme.greenColor)
            ],
          ).marginOnly(bottom: AppScreenUtil().screenHeight(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LatoFontStyle(
                  text: CartFont().bagSavings.tr,
                  fontSize: FontSizes.f14,
                  color: appCtrl.appTheme.contentColor),
              LatoFontStyle(
                  text:
                      "- ${appCtrl.priceSymbol}${(cartCtrl.getSubSaleTotal()! * appCtrl.rateValue).toStringAsFixed(2)}",
                  fontSize: FontSizes.f14,
                  color: appCtrl.appTheme.primary)
            ],
          ).marginOnly(bottom: AppScreenUtil().screenHeight(10)),
          if (cartCtrl.coupon != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LatoFontStyle(
                    text: CartFont().applyCoupons.tr,
                    fontSize: FontSizes.f14,
                    color: appCtrl.appTheme.primary),
                LatoFontStyle(
                    text:
                        "- ${cartCtrl.coupon!.discountType == CouponType.percentage ? "${cartCtrl.coupon!.amount} %" : "${appCtrl.priceSymbol} ${cartCtrl.coupon!.amount}"}",
                    fontSize: FontSizes.f14,
                    color: appCtrl.appTheme.primary)
              ],
            ).marginOnly(bottom: AppScreenUtil().screenHeight(10)),
          Divider(color: appCtrl.appTheme.greyLight25),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            LatoFontStyle(
                text: CartFont().totalAmount.tr,
                fontSize: FontSizes.f14,
                color: appCtrl.appTheme.blackColor,
                fontWeight: FontWeight.w600),
            LatoFontStyle(
                text:
        cartCtrl.coupon != null?  "${appCtrl.priceSymbol} ${cartCtrl.checkout!.subtotalPrice.toString()}" :cartCtrl.getTotalAmount().toString(),
                fontSize: FontSizes.f14,
                color: appCtrl.appTheme.blackColor,
                fontWeight: FontWeight.w600)
          ]).marginOnly(bottom: AppScreenUtil().screenHeight(10)),
        ]).marginSymmetric(
          horizontal: AppScreenUtil().screenWidth(15),
        );
      });
    });
  }
}
