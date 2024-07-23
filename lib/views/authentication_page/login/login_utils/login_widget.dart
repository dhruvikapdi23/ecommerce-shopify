import '../../../../config.dart';

class LoginWidget {
  //focus change
  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  //login layout
  Widget loginLayout({Widget? child, context}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: child,
      ),
    );
  }

  //forgot password  Layout
  Widget forgotPasswordLayout({var color,String? text,GestureTapCallback? onTap}) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
      alignment: Alignment.centerRight,
      child: LatoFontStyle(
        text: text,
        onTap: onTap,
        fontSize: FontSizes.f14,
        color: color,
      ),
    );
  }
}
