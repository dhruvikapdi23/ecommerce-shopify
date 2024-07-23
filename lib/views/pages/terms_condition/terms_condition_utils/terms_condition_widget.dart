import '../../../../config.dart';

class TermsConditionWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  // common text
  Widget commonText(text, fontWeight) => LatoFontStyle(
        text: text,
        fontSize: FontSizes.f14,
        fontWeight: fontWeight,
        color: appCtrl.appTheme.blackColor,
      );

  //common text with same color layout
  Widget commonSubTitle(text) => LatoFontStyle(
        text: text,
        fontSize: FontSizes.f12,
        color: appCtrl.appTheme.contentColor,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.clip,
        letterSpacing: .5,
      ).marginOnly(bottom: AppScreenUtil().screenHeight(15));
}
