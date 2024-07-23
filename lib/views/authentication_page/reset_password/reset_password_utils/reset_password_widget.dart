import '../../../../config.dart';

class ResetPasswordWidget {
  //focus change
  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  //layout layout
  Widget layout({Widget? child, context}) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: child,
      ),
    );
  }

}
