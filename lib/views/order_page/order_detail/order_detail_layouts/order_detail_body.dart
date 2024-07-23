import 'package:multikart/shopify/models/order/order.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../config.dart';

class OrderDetailBody extends StatelessWidget {
  final Order? order;
  const OrderDetailBody({Key? key, this.order}) : super(key: key);

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHistoryController>(builder: (orderHistoryCtrl) {
      return GetBuilder<AppController>(builder: (appCtrl) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //product detail layout
          StatusLayout(
                  title: order!.status!.name.capitalize!.tr)
              .marginOnly(right: 30.0)
              .alignment(Alignment.centerRight),
          OrderProduct(order: order),
          const Space(0, 30),
          const BorderLineLayout(),
          const Space(0, 10),
          //shipping detail text layout
          const Space(0, 10),
          OrderDetailWidget().commonText(OrderDetailFont().shippingDetail),
          const Space(0, 5),
          Divider(color: appCtrl.appTheme.gray, indent: 15, endIndent: 15),
          const Space(0, 5),

          //address layout
          AddressDetail(
            addressList: order!.billing,
            index: 0,
            selectRadio: 0,
            isShow: false,
          ).marginSymmetric(horizontal: Insets.i15),
          const Space(0, 20),
          const BorderLineLayout(),

          // price detail text layout
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            LatoFontStyle(
                text: CartFont().totalAmount.tr,
                fontSize: FontSizes.f14,
                color: appCtrl.appTheme.blackColor,
                fontWeight: FontWeight.w600),
            LatoFontStyle(
                text:
                    "${appCtrl.priceSymbol}${(order!.total! * appCtrl.rateValue).toStringAsFixed(2)}",
                fontSize: FontSizes.f14,
                color: appCtrl.appTheme.blackColor,
                fontWeight: FontWeight.w600)
          ]).marginAll(AppScreenUtil().screenHeight(15)),
          //download invoice
          OrderDetailWidget().buttonLayout(
              onTap: () => _launchUrl(Uri.parse(
                  order!.statusUrl!)),
              OrderDetailFont().downloadInvoice),
          const Space(0, 50),
        ]);
      });
    });
  }
}
