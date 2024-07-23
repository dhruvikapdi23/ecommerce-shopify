import '../../../../config.dart';

class MobileNumberLayout extends StatelessWidget {
  const MobileNumberLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Row(
          children: [
            LatoFontStyle(
              text: '+981 215 1545',
              fontWeight: FontWeight.normal,
              color: appCtrl.appTheme.contentColor,
              fontSize: FontSizes.f16,
            ),
            const Space(15, 0),
            Image.asset(
              iconAssets.edit,
              height: AppScreenUtil().screenHeight(16),
            )
          ],
        );
      }
    );
  }
}
