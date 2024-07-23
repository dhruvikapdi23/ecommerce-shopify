import '../../../../config.dart';

class OrderSuccessWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());


  //common detail text
  Widget commonDetailText(title, val) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LatoFontStyle(
            text: title,
            fontSize: FontSizes.f14,
            color: appCtrl.appTheme.blackColor,
            fontWeight: FontWeight.w700),
        const Space(0, 5),
        LatoFontStyle(
          text: val,
          fontSize: FontSizes.f14,
          color: appCtrl.appTheme.contentColor,
          overflow: TextOverflow.clip,
        )
      ],
    );
  }

  //order summary image
  Widget orderSummaryImage(image) => ClipRRect(
      borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
      child: Container(
        color: appCtrl.appTheme.lightGray,
        child: FadeInImageLayout(
            image: image,
            height: AppScreenUtil().screenHeight(100),
            width: AppScreenUtil().screenWidth(100),
            fit: BoxFit.contain),
      ));
}
