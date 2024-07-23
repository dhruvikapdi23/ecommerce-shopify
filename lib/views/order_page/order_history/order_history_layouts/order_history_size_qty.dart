import 'package:intl/intl.dart';
import 'package:multikart/shopify/models/order/order.dart';

import '../../../../config.dart';

class OrderHistorySizeQty extends StatelessWidget {
  final Order? orderHistoryModel;

  const OrderHistorySizeQty({Key? key, this.orderHistoryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        LatoFontStyle(
            text: orderHistoryModel!.lineItems[0].name.toString().tr,
            fontWeight: FontWeight.w600,
            fontSize: FontSizes.f14,
            color: appCtrl.appTheme.blackColor),
        const Space(0, 5),
        Row(children: [
          OrderHistoryWidget().commonText(OrderHistoryFont().size),
          const Space(5, 0),
          OrderHistoryWidget().commonText(
              orderHistoryModel!.lineItems[0].variants!.split("/")[0]),
          const Space(10, 0),
          OrderHistoryWidget().commonText(OrderHistoryFont().qty),
          const Space(5, 0),
          OrderHistoryWidget()
              .commonText(orderHistoryModel!.lineItems[0].quantity.toString()),
        ]),
        const Space(0, 5),
        OrderDateDeliveryStatus(
            title: OrderHistoryFont().ordered,
            value:
                DateFormat('dd-MM-yyyy').format(orderHistoryModel!.createdAt!)),
      ]).marginOnly(
          left: AppScreenUtil().screenWidth(
              appCtrl.isRTL || appCtrl.languageVal == "ar" ? 0 : 15),
          right: AppScreenUtil().screenWidth(
              appCtrl.isRTL || appCtrl.languageVal == "ar" ? 15 : 0));
    });
  }
}
