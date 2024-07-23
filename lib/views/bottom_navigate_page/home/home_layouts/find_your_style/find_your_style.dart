import '../../../../../config.dart';

class FindYourStyle extends StatelessWidget {
  const FindYourStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LatoFontStyle(
                  text: HomeFont().findYourStyle,
                  fontSize: FontSizes.f14,
                  fontWeight: FontWeight.w700,
                  color: homeCtrl.appCtrl.appTheme.blackColor,
                ),
                LatoFontStyle(
                  text: HomeFont().superSummerSale,
                  fontSize: FontSizes.f14,
                  fontWeight: FontWeight.w400,
                  color: homeCtrl.appCtrl.appTheme.contentColor,
                ),
                const FindYourStyleCategory(),
                const Space(0, 5),
                const FindStyleSubCategory()
              ],
            )
          ],
        ),
      );
    });
  }
}
