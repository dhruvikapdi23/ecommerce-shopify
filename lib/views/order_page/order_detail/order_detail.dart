import 'package:multikart/config.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  final orderDetailCtrl = Get.put(OrderDetailController());


  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(builder: (_) {
      return Directionality(
        textDirection: orderDetailCtrl.appCtrl.isRTL ||
                orderDetailCtrl.appCtrl.languageVal == "ar"
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          body: orderDetailCtrl.orderHistoryList != null? NestedSilverCustomAppBar(
            bodyLayout: SingleChildScrollView(
                child: OrderDetailBody(
                  order: orderDetailCtrl.orderHistoryList,
            )),
          ): Container(),
        ),
      );
    });
  }
}
