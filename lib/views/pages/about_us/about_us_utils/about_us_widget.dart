
import '../../../../config.dart';

class AboutUsWidget{
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  //common title text
  Widget commonText(text,fontWeight,fontSize)=>LatoFontStyle(
    text: text,
    fontSize: fontSize,
    color: appCtrl.appTheme.blackColor,
    overflow: TextOverflow.clip,
    fontWeight: fontWeight,
  );

  //common text
  Widget commonDescText(text) =>LatoFontStyle(
    text: text,
    fontSize: FontSizes.f14,
    color: appCtrl.appTheme.contentColor,
    overflow: TextOverflow.clip,
    letterSpacing: .2,
    fontWeight: FontWeight.w500,
  );

  //image layout
  Widget imageLayout(image)=> ClipRRect(
      borderRadius: BorderRadius.circular(
          AppScreenUtil().borderRadius(5)),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        height: AppScreenUtil().screenHeight(180),
        alignment: Alignment.center,
      ));
}