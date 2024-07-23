import '../../../../config.dart';

class DrawerContainer extends StatelessWidget {
  final Widget? child;
  const DrawerContainer({Key? key,this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Container(
          margin: EdgeInsets.only(
              bottom: AppScreenUtil().screenHeight(8.0),
              top: AppScreenUtil().screenHeight(10)),
          padding: EdgeInsets.symmetric(
              vertical: AppScreenUtil().screenHeight(10),
              horizontal: AppScreenUtil().screenWidth(appCtrl.isRTL ||
                  appCtrl.languageVal == "ar"
                  ? 7:10)),
          decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(AppScreenUtil().borderRadius(10))),
          child: child,
        );
      }
    );
  }
}
