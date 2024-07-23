import '../../../../config.dart';
import '../../../../shopify/models/order/order.dart';

class OrderSummary extends StatelessWidget {
  final Order? order;
  const OrderSummary({Key? key,this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LatoFontStyle(
                  text: OrderSuccessFont().orderSummary,
                  fontSize: FontSizes.f16,
                  color: appCtrl.appTheme.blackColor,
                  fontWeight: FontWeight.w700)
              .paddingSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
          const Space(0, 20),

          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LatoFontStyle(
                    text: CartFont().bagTotal.tr,
                    fontSize: FontSizes.f14,
                    color: appCtrl.appTheme.contentColor),
                LatoFontStyle(
                    text:  "${appCtrl.priceSymbol}${(order!.total! * appCtrl.rateValue).toStringAsFixed(2)}",
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
                    text: "${appCtrl.priceSymbol}${(order!.totalTax! * appCtrl.rateValue).toStringAsFixed(2)}",
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
                  "${appCtrl.priceSymbol}${(order!.subtotal! * appCtrl.rateValue).toStringAsFixed(2)}",
                  fontSize: FontSizes.f14,
                  color: appCtrl.appTheme.blackColor,
                  fontWeight: FontWeight.w600)
            ]).marginOnly(bottom: AppScreenUtil().screenHeight(10)),
          ]).marginSymmetric(
              horizontal: AppScreenUtil().screenWidth(15)),
          Divider(color: appCtrl.appTheme.greyLight25),

          const Space(0, 50),
        ],
      )
          .width(MediaQuery.of(context).size.width)
          .marginSymmetric(vertical: AppScreenUtil().screenHeight(20));
    });
  }
}
