import '../../config.dart';

class CommonAccountText extends StatelessWidget {
  final String? text1;
  final String? text2;
  final Color? textColor;
  final FontWeight? fontWeight;
  final GestureTapCallback? onTap;
  final bool isCenter;
  const CommonAccountText({Key? key,this.text1,this.text2,this.textColor,this.fontWeight,this.onTap,this.isCenter = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Row(
        mainAxisAlignment: isCenter?  MainAxisAlignment.center: MainAxisAlignment.start,
        children: [
          OnBoardWidget().textLayout(
              text: text1,
              fontSize: 14,
              fontWeight: fontWeight,
              color: appCtrl.appTheme.contentColor,
              textDecoration: TextDecoration.none),
          const Space(5, 0),
          LatoFontStyle(
              text: text2,
              fontSize: 14,
              fontWeight: fontWeight!,
              color: textColor,
              onTap:onTap ,
              textDecoration: TextDecoration.underline)
        ],
      );
    });
  }
}
