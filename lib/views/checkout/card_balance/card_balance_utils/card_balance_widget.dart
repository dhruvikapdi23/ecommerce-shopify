import 'package:multikart/config.dart';

class CardBalanceWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  // card type and bank name
  Widget cardTypeBanKName(cardType, bankName) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CardBalanceWidget().commonFontText(cardType),
      CardBalanceWidget().commonFontText(bankName)
    ]);
  }

  // card no layout
  Widget cardNoLayout(cardType, bankName) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CardBalanceWidget().commonFontText(cardType),
      CardBalanceWidget().commonFontText(bankName)
    ]);
  }

  //common font text
  Widget commonFontText(text, {double fontSize = FontSizes.f14}) {
    return LatoFontStyle(
        text: text,
        color: appCtrl.appTheme.white,
        fontWeight: FontWeight.w700,
        fontSize: fontSize);
  }

  //button layout
  Widget buttonLayout(text, {isMargin = false}) {
    return CustomButton(
        title: text,
        fontWeight: FontWeight.normal,
        fontColor: appCtrl.appTheme.contentColor,
        color: appCtrl.appTheme.greyLight25,
        width: AppScreenUtil().screenWidth(80),
        height: AppScreenUtil().screenHeight(25),
        margin: isMargin ? 15:0,
        radius: 5);
  }

  //delink or link text
  Widget deLinkOrLinkText(isLink){
    return LatoFontStyle(
        text: isLink == true
            ? CommonTextFont().delink
            : CommonTextFont().link,
        color: appCtrl.appTheme.primary,
        fontWeight: FontWeight.w700,
        fontSize: FontSizes.f12);
  }
}
