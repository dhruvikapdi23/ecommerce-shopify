
import '../../../../config.dart';

class HelpWidget{

  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  //image layout
  Widget imageLayout(image) =>ClipRRect(
      borderRadius:
      BorderRadius.circular(AppScreenUtil().borderRadius(5)),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        width: MediaQuery.of(Get.context!).size.width,
        height: AppScreenUtil().screenHeight(180),
        alignment: Alignment.center,
      ));

  //help center text
  Widget helpText(text)=> LatoFontStyle(
    text: text,
    fontSize: FontSizes.f15,
    fontWeight: FontWeight.w700,
    color: appCtrl.appTheme.blackColor,
  );

  //help desc text
  Widget helpDec(text)=> LatoFontStyle(
    text: text,
    fontSize: FontSizes.f14,
    overflow: TextOverflow.clip,
    color: appCtrl.appTheme.contentColor,
  );
}