import '../../../../config.dart';

class CouponTitle extends StatelessWidget {
  final String? title;

  const CouponTitle({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        height: AppScreenUtil().screenHeight(30),
        margin:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(10)),
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenHeight(10),
            vertical: AppScreenUtil().screenHeight(6)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: appCtrl.appTheme.greyLight25,
            borderRadius: BorderRadius.circular(2)),
        child: LatoFontStyle(
          text: title,
          color: appCtrl.appTheme.contentColor,
          fontSize: FontSizes.f12,
        ),
      );
    });
  }
}
