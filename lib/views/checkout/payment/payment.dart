import 'package:multikart/shopify/models/address.dart';
import 'package:multikart/views/checkout/payment/payment_layouts/review_item_list.dart';

import '../../../config.dart';

class Payment extends StatelessWidget {
  final paymentCtrl = Get.put(PaymentController());

  Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(builder: (_) {
      return Directionality(
        textDirection:
            paymentCtrl.appCtrl.isRTL || paymentCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: Scaffold(
          appBar: HomeProductAppBar(
            onTap: () => Get.back(),
            titleChild: CommonAppBarTitle(
              title: PaymentFont().paymentDetails,
              desc: PaymentFont().steps3Of3,
            ),
          ),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const ReviewItemList(),
                  const  Space(0, 20),
                  CartOrderDetailLayout(
                       isDeliveryShow: false,address:paymentCtrl.address),
                ],
              ),
              //view detail and pay now layout
              CartBottomLayout(
                  desc: CartFont().viewDetail,
                  buttonName: PaymentFont().shippingMethod.tr,
                  totalAmount:   paymentCtrl.cartCtrl.getTotalAmount().toString(),
                  onTap: () {
                    paymentCtrl.callShippingMethod(paymentCtrl.address);
                  })
            ],
          ),
        ),
      );
    });
  }
}
