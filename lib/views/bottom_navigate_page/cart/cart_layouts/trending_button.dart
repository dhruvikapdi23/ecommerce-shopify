import '../../../../config.dart';

class TrendingButton extends StatelessWidget {
  const TrendingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Container(
          width: AppScreenUtil().screenWidth(45),
          alignment: Alignment.center,
          height: AppScreenUtil().screenHeight(18),
          margin: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(10),
            vertical: AppScreenUtil().screenHeight(8),
          ),
          decoration: BoxDecoration(
            color: appCtrl.appTheme.primary,
            borderRadius: BorderRadius.circular(
                AppScreenUtil().borderRadius(3)),
          ),
          child: LatoFontStyle(
            text: "TRENDING".tr,
            fontSize: FontSizes.f7,
            color: appCtrl.appTheme.white,
            fontWeight: FontWeight.w600,
          ),
        );
      }
    );
  }
}
