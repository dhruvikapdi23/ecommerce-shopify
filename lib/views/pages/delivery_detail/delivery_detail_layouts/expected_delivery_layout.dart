import '../../../../config.dart';

class ExpectedDeliveryLayout extends StatelessWidget {
  const ExpectedDeliveryLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryDetailController>(builder: (deliveryDetailCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LatoFontStyle(
            text: DeliveryDetailFont().expectedDelivery,
            fontSize: FontSizes.f16,
            fontWeight: FontWeight.w600,
            color: deliveryDetailCtrl.appCtrl.appTheme.blackColor,
          ),
          const Space(0, 20),
          if (deliveryDetailCtrl.deliveryDetail != null)
            DeliveryData(
              expectedDelivery:
                  deliveryDetailCtrl.deliveryDetail!.expectedDelivery,
            )
        ],
      ).marginSymmetric(
        horizontal: AppScreenUtil().screenWidth(15),
      );
    });
  }
}
