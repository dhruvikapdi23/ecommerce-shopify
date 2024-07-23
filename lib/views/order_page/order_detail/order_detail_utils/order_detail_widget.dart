import '../../../../config.dart';

class OrderDetailWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  //dot indicator layout
  Widget dotIndicator() => DotIndicator(
        color: appCtrl.appTheme.primary,
        child: const Icon(
          Icons.check,
          color: Colors.white,
          size: 12.0,
        ),
      );

  //common text
  Widget commonText(text) => LatoFontStyle(
        text: text,
        fontSize: FontSizes.f13,
        color: appCtrl.appTheme.contentColor,
      ).marginSymmetric(horizontal: Insets.i15);

  // button layout
  Widget buttonLayout(text, {GestureTapCallback? onTap}) => CustomButton(
      title: text,
      onTap: onTap,
      border: Border.all(color: appCtrl.appTheme.contentColor),
      radius: 5,
      color: appCtrl.appTheme.whiteColor,
      fontSize: FontSizes.f14,
      fontColor: appCtrl.appTheme.contentColor);
}
