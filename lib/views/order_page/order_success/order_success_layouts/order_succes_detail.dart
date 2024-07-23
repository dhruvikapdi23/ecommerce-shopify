
import 'package:multikart/shopify/models/order/order.dart';

import '../../../../config.dart';

class OrderSuccessDetail extends StatelessWidget {
  final Order? order;

  const OrderSuccessDetail({Key? key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LatoFontStyle(
              text: OrderSuccessFont().orderDetail,
              fontSize: FontSizes.f16,
              color: appCtrl.appTheme.blackColor,
              fontWeight: FontWeight.w700),
          const Space(0, 20),
          OrderSuccessWidget().commonDetailText(
              OrderSuccessFont().yourOrder(order!.number),
              OrderSuccessFont().orderInfo),
          const Space(0, 20),
          OrderSuccessWidget().commonDetailText(OrderSuccessFont().orderShipped,
              "${order!.billing!.street}, ${order!.billing!.block}, ${order!.billing!.city}, ${order!.billing!.state}, ${order!.billing!.country}, ${order!.billing!.zipCode}"),
          const Space(0, 20),
          OrderSuccessWidget().commonDetailText(
              OrderSuccessFont().paymentMethod, order!.shippingMethodTitle),
        ],
      )
          .width(MediaQuery.of(context).size.width)
          .marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
    });
  }
}
