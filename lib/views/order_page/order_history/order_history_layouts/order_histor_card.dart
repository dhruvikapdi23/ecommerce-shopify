
import 'package:multikart/shopify/models/order/order.dart';

import '../../../../config.dart';

class OrderHistoryCard extends StatelessWidget {
  final Order? orderHistoryModel;
  final int? index, lastIndex;
  final GestureTapCallback? onTap;
  const OrderHistoryCard(
      {Key? key,
      this.orderHistoryModel,
      this.index,
      this.lastIndex,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        decoration: BoxDecoration(
          color: appCtrl.appTheme.lightGray,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(8)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            OrderHistoryWidget()
                .imageLayout(orderHistoryModel!.lineItems[0].featuredImage)
                .marginOnly(left: AppScreenUtil().screenWidth(20)),
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: OrderHistorySizeQty(
                      orderHistoryModel: orderHistoryModel)),
              StatusLayout(
                  title: orderHistoryModel!.status!.getTranslation(context).tr)
            ]),
          ]),
        ]).paddingSymmetric(vertical: AppScreenUtil().screenWidth(10)),
      ).marginSymmetric(
          vertical: AppScreenUtil().screenWidth(5),
          horizontal: AppScreenUtil().screenWidth(10));
    });
  }
}
