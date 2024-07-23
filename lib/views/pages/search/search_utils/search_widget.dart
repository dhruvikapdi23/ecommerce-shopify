import 'package:multikart/config.dart';

class SearchWidget {

  //suffix icon
  Widget suffixIcon(){
    return const CameraIcon().paddingDirectional(
        start: AppScreenUtil().size(5),
        end: AppScreenUtil().size(10),
        top: AppScreenUtil().size(4));
  }

  //prefix icon
  Widget prefixIcon(){
    return  const SearchTextIcon().paddingDirectional(
        start: AppScreenUtil().size(10),
        end: AppScreenUtil().size(10),
        bottom: AppScreenUtil().size(5));
  }

  // search and back arrow
  Widget searchAndBackArrow(controller,{ShopController? shopController}) {
    return Row(
      children: [
        const Icon(Icons.arrow_back_rounded).gestures(onTap: () => Get.back()),
         Expanded(child: SearchTextBox(controller: controller,suffixIcon: SearchWidget().suffixIcon(),prefixIcon: SearchWidget().prefixIcon(),shopCtrl: shopController,))
      ],
    ).marginOnly(
        left: AppScreenUtil().screenWidth(15),
        right: AppScreenUtil().screenWidth(15),
        top: AppScreenUtil().screenHeight(40),
        bottom: AppScreenUtil().screenHeight(20));
  }



  //common text
  Widget commonText(text){
    return  LatoFontStyle(
      text: text,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ).marginOnly(
        left: AppScreenUtil().screenWidth(15),
        right: AppScreenUtil().screenWidth(15),
        bottom: AppScreenUtil().screenHeight(10));
  }
}
