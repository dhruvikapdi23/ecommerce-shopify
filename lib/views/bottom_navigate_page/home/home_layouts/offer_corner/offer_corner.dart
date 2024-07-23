import 'package:multikart/config.dart';

class OfferCorner extends StatelessWidget {
  const OfferCorner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LatoFontStyle(
            text: HomeFont().offerCorner,
            fontSize: FontSizes.f14,
            fontWeight: FontWeight.w700,
            color: homeCtrl.appCtrl.appTheme.blackColor,
          ),
          const Space(0, 10),
          const OfferCornerLayout()
        ],
      ).paddingSymmetric(
          vertical: AppScreenUtil().screenHeight(10),
          horizontal: AppScreenUtil().screenWidth(15));
    });
  }
}
