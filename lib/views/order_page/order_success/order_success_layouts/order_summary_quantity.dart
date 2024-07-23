import 'package:multikart/shopify/models/order/order.dart';

import '../../../../config.dart';

class OrderSummarySizeQuantity extends StatelessWidget {
  final Order? orderSummaryModel;
  const OrderSummarySizeQuantity({Key? key, this.orderSummaryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        LatoFontStyle(
            text:
                '${OrderHistoryFont().size} ${orderSummaryModel!.lineItems[0].variants!.split('/')[0]}',
            fontSize: FontSizes.f13,
            color: appCtrl.appTheme.contentColor),
        const Space(5, 0),
        LatoFontStyle(
            text:
                '${OrderHistoryFont().qty} ${orderSummaryModel!.lineItems[0].quantity.toString()}',
            fontSize: FontSizes.f13,
            color: appCtrl.appTheme.contentColor),
      ]);
    });
  }
}
