import '../../config.dart';

class FilterIconLayout extends StatelessWidget {
  const FilterIconLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().size(10),
            vertical: AppScreenUtil().screenHeight(10)),
        height: AppScreenUtil().screenHeight(40),
        width: AppScreenUtil().screenWidth(45),
        margin: EdgeInsets.only(
            right: AppScreenUtil().screenWidth(
                appCtrl.isRTL || appCtrl.languageVal == "ar" ? 0 : 15),
            left: appCtrl.isRTL || appCtrl.languageVal == "ar"
                ? AppScreenUtil().screenWidth(15)
                : 0),
        decoration: BoxDecoration(
          color: appCtrl.appTheme.primary,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
        ),
        child: const FilterIcon(),
      );
    });
  }
}
