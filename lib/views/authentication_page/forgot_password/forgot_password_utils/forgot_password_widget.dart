import '../../../../config.dart';

class ForgotPasswordWidget {


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

}
