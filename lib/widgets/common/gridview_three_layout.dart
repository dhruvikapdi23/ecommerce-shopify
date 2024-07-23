import '../../config.dart';

class GridviewThreeLayout extends StatelessWidget {
  final dynamic data;
  final int? index;
  final int? selectIndex;
  final GestureTapCallback? onTap;
  const GridviewThreeLayout(
      {Key? key, this.onTap, this.data, this.index, this.selectIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(builder: (filterCtrl) {
      return GetBuilder<AppController>(builder: (appCtrl) {
        return Container(
          width: AppScreenUtil().screenWidth(180),
          alignment: Alignment.center,
          height: AppScreenUtil().screenHeight(60),
          padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
          ),
          margin: EdgeInsets.only(
            left: AppScreenUtil()
                .screenWidth(appCtrl.isRTL || appCtrl.languageVal == "ar"
                    ? index == 2
                        ? 15
                        : 0
                    : 15),
            right: AppScreenUtil()
                .screenWidth(appCtrl.isRTL || appCtrl.languageVal == "ar"
                    ? 15
                    : index == 2
                        ? 15
                        : 0),
            top: AppScreenUtil().screenHeight(10),
          ),
          decoration: BoxDecoration(
            color: filterCtrl.selectSize.contains(data)
                ? appCtrl.appTheme.primary
                : appCtrl.appTheme.greyLight25,
            borderRadius: BorderRadius.circular(
                AppScreenUtil().borderRadius(AppScreenUtil().borderRadius(5))),
          ),
          child: LatoFontStyle(
            text:  data,
            fontSize: 14,
            color: filterCtrl.selectSize.contains(data)
                ? appCtrl.appTheme.white
                : appCtrl.appTheme.blackColor,
          ),
        ).gestures(onTap: onTap);
      });
    });
  }
}
