import '../../../../../config.dart';

class TimeLayout extends StatelessWidget {
  final String? title, value;

  const TimeLayout({Key? key, this.value, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(8)),
        padding:
            EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(4)),
        decoration: BoxDecoration(
            color: appCtrl.appTheme.primary,
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(5))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(5),
              ),
              child: LatoFontStyle(
                text: title,
                textAlign: TextAlign.start,
                fontSize: FontSizes.f8,
                fontWeight: FontWeight.normal,
                color: appCtrl.appTheme.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(12),
              ),
              child: LatoFontStyle(
                text: value,
                fontSize: FontSizes.f20,
                fontWeight: FontWeight.w700,
                color: appCtrl.appTheme.white,
              ),
            ),
          ],
        ),
      );
    });
  }
}
