import '../../../../config.dart';

class PaymentWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  //offer and promotion card
  Widget offerPromotionCard(text) {
    return Container(
        height: AppScreenUtil().screenHeight(60),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(color: appCtrl.appTheme.greyLight25,borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
        margin: const EdgeInsets.only(bottom: Insets.i15),
        padding: const EdgeInsets.symmetric(
            horizontal: Insets.i20, vertical: Insets.i10),
        child: LatoFontStyle(
            text: text, fontSize: FontSizes.f12, overflow: TextOverflow.clip));
  }
}
