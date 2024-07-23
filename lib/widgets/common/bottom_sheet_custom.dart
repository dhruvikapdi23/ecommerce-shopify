

import '../../config.dart';

class BottomSheetLayout{
  Future bottomSheet({child}) => Get.bottomSheet(
    child,
    backgroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
          topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
    ),
  );


  //popup detail layout
  Widget bottomSheetLayout({Widget? child,var primaryColor}){
    return Container(
      height: AppScreenUtil().screenHeight(150),
      padding: EdgeInsets.only(
          top: AppScreenUtil().screenHeight(25),
          left: AppScreenUtil().screenWidth(20),
          right: AppScreenUtil().screenWidth(20)),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
            topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
      ),
      child: child,
    );
  }
}
