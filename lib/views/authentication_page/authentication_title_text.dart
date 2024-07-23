import '../../../../config.dart';

class AuthenticationTitleText extends StatelessWidget {
  final bool? isTextShow;
  final String? text1;
  final String? text2;
  const AuthenticationTitleText({Key? key,this.isTextShow,this.text2,this.text1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LatoFontStyle(
              text: text1,
              fontWeight: FontWeight.w700,
              fontSize: FontSizes.f24,
              color: appCtrl.appTheme.blackColor),
          if(isTextShow!)
          LatoFontStyle(
              text: text2,
              fontWeight: FontWeight.w700,
              fontSize: FontSizes.f24,
              color: appCtrl.appTheme.blackColor),
        ],
      );
    });
  }
}
