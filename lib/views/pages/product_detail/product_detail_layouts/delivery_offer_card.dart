import 'package:multikart/config.dart';

class DeliveryOfferCard extends StatelessWidget {
  final List<DeliveryOffer>? deliveryOffer;

  const DeliveryOfferCard({Key? key, this.deliveryOffer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...deliveryOffer!.map((e) {
            return Row(
              children: [
                SizedBox(
                  width: AppScreenUtil().screenWidth(25),
                  child: e.icon!.contains('svg')
                      ? SvgPicture.asset(
                          e.icon.toString(),
                          height: AppScreenUtil().screenHeight(15),
                          fit: BoxFit.contain,
                        )
                      : Image.asset(e.icon.toString(),
                          height: AppScreenUtil().screenHeight(15)),
                ),
                const Space(10, 0),
                LatoFontStyle(
                  text: e.title.toString().tr,
                  fontSize: FontSizes.f14,
                  color: appCtrl.appTheme.contentColor,
                  fontWeight: FontWeight.w600,
                )
              ],
            ).marginOnly(bottom: AppScreenUtil().screenHeight(10));
          }).toList()
        ],
      ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
    });
  }
}
