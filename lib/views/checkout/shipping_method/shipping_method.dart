import '../../../config.dart';

class ShippingMethod extends StatelessWidget {
  const ShippingMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(builder: (paymentCtrl) {
      return GetBuilder<CartController>(
        builder: (cartCtrl) {
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
                  desc: PaymentFont().steps4Of4.tr,
                ),
              ),
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LatoFontStyle(
                          text: PaymentFont().shippingMethod.tr,
                          color: appCtrl.appTheme.blackColor),
                      const VSpace(Sizes.s20),
                      ...paymentCtrl.shippingMethod.asMap().entries.map((e) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LatoFontStyle(
                                    text: e.value.title,
                                    fontSize: FontSizes.f14,
                                    color: appCtrl.appTheme.blackText),
                                LatoFontStyle(
                                    text:
                                        "${appCtrl.priceSymbol} ${e.value.cost.toString()}",
                                    fontSize: FontSizes.f14,
                                    color: appCtrl.appTheme.contentColor),
                              ],
                            ),
                            CustomRadio(
                              index: e.key,
                              selectRadio: paymentCtrl.selectRadio,
                              onTap: () => paymentCtrl.selectMethod(e.key),
                            )
                          ],
                        )
                            .paddingSymmetric(
                                horizontal: Insets.i24, vertical: Insets.i20)
                            .decorated(
                                color: paymentCtrl.selectRadio == e.key
                                    ? appCtrl.appTheme.lightGray
                                    : appCtrl.appTheme.whiteColor).inkWell(onTap: () => paymentCtrl.selectMethod(e.key));
                      }).toList()
                    ],
                  ).marginSymmetric(horizontal: Insets.i15, vertical: Insets.i10),
                  //view detail and pay now layout
                  CartBottomLayout(
                      desc: CartFont().viewDetail,
                      buttonName: PaymentFont().payNow.tr,
                      totalAmount:   paymentCtrl.cartCtrl.getTotalAmount().toString(),
                      onTap: () async{
                        final selectedShippingMethod =
                        paymentCtrl.shippingMethod[paymentCtrl.selectRadio];

                        paymentCtrl.selectedShippingMethod = selectedShippingMethod;

                        Get.toNamed(routeName.paymentMethod);
                      })
                ],
              ),
            ),
          );
        }
      );
    });
  }
}
