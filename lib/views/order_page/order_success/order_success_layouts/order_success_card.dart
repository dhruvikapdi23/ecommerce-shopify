import 'package:multikart/shopify/models/order/order.dart';

import '../../../../config.dart';

class OrderSuccessCard extends StatelessWidget {
  final Order? orderSummaryModel;
  final int? index;
  final bool isDivider;

  const OrderSuccessCard(
      {Key? key, this.orderSummaryModel, this.index, this.isDivider = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
          padding:
              EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
          child: Column(children: [
            Row(children: [
              OrderSuccessWidget().orderSummaryImage(
                  orderSummaryModel!.lineItems[0].featuredImage),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                LatoFontStyle(
                    text: orderSummaryModel!.lineItems[0].name,
                    fontSize: FontSizes.f13,
                    color: appCtrl.appTheme.blackColor),
                OrderSummarySizeQuantity(orderSummaryModel: orderSummaryModel),
                LatoFontStyle(
                    text:
                        "${appCtrl.priceSymbol}${double.parse(orderSummaryModel!.total.toString())}",
                    fontSize: FontSizes.f13,
                    color: appCtrl.appTheme.blackColor),
              ]).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15))
            ]),
            if (isDivider) const Space(0, 15),
            if (isDivider)
              if (index != orderSummaryArray.length - 1)
                Divider(color: appCtrl.appTheme.blackColor),
            if (isDivider) const Space(0, 15)
          ]));
    });
  }
}
