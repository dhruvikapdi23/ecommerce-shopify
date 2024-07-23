import 'package:multikart/shopify/models/order/order.dart';

import '../../../../config.dart';

class OrderProduct extends StatelessWidget {
  final Order? order;

  const OrderProduct({Key? key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHistoryController>(builder: (orderHistoryCtrl) {
      return GetBuilder<AppController>(builder: (appCtrl) {
        return Card(
          elevation: 2,
          color: appCtrl.appTheme.whiteColor,
          child: OrderSuccessCard(
            orderSummaryModel: order,
            index: 0,
            isDivider: false,
          ).marginSymmetric(vertical: AppScreenUtil().screenHeight(15)),
        ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
      });
    });
  }
}
