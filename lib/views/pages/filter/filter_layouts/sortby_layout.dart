import '../../../../config.dart';

class SortByLayout extends StatelessWidget {
  const SortByLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: appCtrl.appTheme.greyLight25,
          //background color of dropdown button
          border: Border.all(color: appCtrl.appTheme.borderColor, width: .5),
          //border of dropdown button
          borderRadius: BorderRadius.circular(AppScreenUtil()
              .borderRadius(5)), //border raiuds of dropdown button
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(25)),
            child: const SortByDropDown()),
      ).marginOnly(bottom: AppScreenUtil().screenHeight(20));
    });
  }
}
