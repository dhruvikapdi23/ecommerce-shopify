import '../../../../config.dart';

class DeliveryDetailData extends StatelessWidget {
  final ExpectedDelivery? expectedDelivery;

  const DeliveryDetailData({Key? key, this.expectedDelivery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Row(children: [
        ClipRRect(
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(5)),
            child: FadeInImageLayout(
                image: expectedDelivery!.image,
                height: AppScreenUtil().screenHeight(70),
                width: AppScreenUtil().screenWidth(80),
                fit: BoxFit.cover)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LatoFontStyle(
                text: expectedDelivery!.name.toString().tr,
                fontWeight: FontWeight.w600,
                fontSize: FontSizes.f14,
                color: appCtrl.appTheme.contentColor),
            Row(
              children: [
                LatoFontStyle(
                    text: DeliveryDetailFont().deliveryBy,
                    fontWeight: FontWeight.w700,
                    fontSize: FontSizes.f13,
                    color: appCtrl.appTheme.blackColor),
                const Space(5, 0),
                LatoFontStyle(
                    text: expectedDelivery!.date.toString().tr,
                    fontWeight: FontWeight.w700,
                    fontSize: FontSizes.f13,
                    color: appCtrl.appTheme.greenColor)
              ],
            )
          ],
        ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15))
      ]);
    });
  }
}
