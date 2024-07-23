import 'package:multikart/config.dart';

class DeliveryDetailWidgets {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  //delivery address container
  Widget deliveryAddressLayout({Widget? child, int? index, int? selectRadio}) {
    return Container(
        margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(25)),
        padding: EdgeInsets.symmetric(
            vertical: AppScreenUtil().screenHeight(10),
            horizontal: AppScreenUtil().screenWidth(10)),
        decoration: BoxDecoration(
            border: Border.all(
              color: index == selectRadio
                  ? appCtrl.appTheme.primary
                  : appCtrl.appTheme.greyLight25.withOpacity(.6),
            ),
            color: index == selectRadio
                ? appCtrl.appTheme.primaryLight
                : appCtrl.appTheme.greyLight25.withOpacity(.6),
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(5))),
        child: child);
  }

  //address common text layout
  Widget addressCommonText(text) {
    return LatoFontStyle(
        text: text,
        fontWeight: FontWeight.normal,
        overflow: TextOverflow.clip,
        fontSize: FontSizes.f13,
        color: appCtrl.appTheme.contentColor);
  }

  //phone common text layout
  Widget phoneCommonText(text) {
    return LatoFontStyle(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: FontSizes.f13,
        color: appCtrl.appTheme.blackColor);
  }
}
