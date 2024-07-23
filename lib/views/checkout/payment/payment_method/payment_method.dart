import 'dart:developer';
import 'dart:io';

import 'package:pay/pay.dart';
import '../../../../config.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(builder: (paymentCtrl) {
      return Directionality(
        textDirection:
            paymentCtrl.appCtrl.isRTL || paymentCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: Scaffold(
          appBar: HomeProductAppBar(
            onTap: () => Get.back(),
            titleChild: CommonAppBarTitle(
              title: PaymentFont().paymentMethod,
              desc: PaymentFont().steps5Of5.tr,
            ),
          ),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LatoFontStyle(
                      text: PaymentFont().paymentMethod.tr,
                      color: appCtrl.appTheme.blackColor),
                  const VSpace(Sizes.s20),

                    FutureBuilder<PaymentConfiguration>(
                        future: paymentCtrl.googlePayConfigFuture,
                        builder: (context, snapshot) => snapshot.hasData
                            ? GooglePayButton(
                          width: MediaQuery.of(context).size.width,
                                paymentConfiguration: snapshot.data!,
                                paymentItems: [
                                  PaymentItem(
                                    label: 'Total',
                                    amount:
                                        '${double.parse(paymentCtrl.totalAmount) * paymentCtrl.appCtrl.rateValue}',
                                    status: PaymentItemStatus.final_price,
                                  )
                                ],
                                type: GooglePayButtonType.buy,
                                margin: const EdgeInsets.only(top: 15.0),
                                onPaymentResult: paymentCtrl.onGooglePayResult,
                                loadingIndicator: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : const SizedBox.shrink()),
                  ApplePayButton(
                    width: MediaQuery.of(context).size.width,

                    paymentConfiguration: PaymentConfiguration.fromJsonString(
                        paymentCtrl.applePayConfig),
                    paymentItems: [
                      PaymentItem(
                        label: 'Total',
                        amount:
                        paymentCtrl.cartCtrl.getTotalAmount().toString(),
                        status: PaymentItemStatus.final_price,
                      )
                    ],
                    style: ApplePayButtonStyle.black,
                    type: ApplePayButtonType.buy,
                    margin: const EdgeInsets.only(top: 15.0),
                    height: Sizes.s40,
                    onPaymentResult:(result)=>  paymentCtrl.onApplePayResult(result),
                    onError: (error) => log("ERROR : $error"),
                    loadingIndicator: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ).marginSymmetric(horizontal: Insets.i15, vertical: Insets.i10),
              //view detail and pay now layout
              CartBottomLayout(
                  desc: CartFont().viewDetail,
                  buttonName: CartFont().placeOrder.tr,
                  totalAmount: paymentCtrl.cartCtrl.getTotalAmount().toString(),
                  onTap: () {
paymentCtrl.placeOrder();
                  })
            ],
          ),
        ),
      );
    });
  }
}
