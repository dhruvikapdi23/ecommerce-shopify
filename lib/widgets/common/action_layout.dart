import '../../config.dart';

class ActionLayout extends StatelessWidget {
  final String? firstActionName, secondAction;
  final Widget? firstActionIcon;
  final GestureTapCallback? firstActionTap;
  final GestureTapCallback? secondActionTap;
  const ActionLayout(
      {Key? key,
      this.firstActionName,
      this.secondAction,
      this.firstActionIcon,
      this.firstActionTap,
      this.secondActionTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              firstActionIcon!,
              const Space(5, 0),
              LatoFontStyle(
                text: firstActionName,
                fontSize: FontSizes.f12,
                fontWeight: FontWeight.w600,
                color: appCtrl.appTheme.blackColor,
              )
            ],
          ).gestures(onTap: firstActionTap),
          const LatoFontStyle(
            text: "|",
          ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(10)),
          Row(
            children: [
              const DeleteIcon(),
              const Space(5, 0),
              LatoFontStyle(
                text: secondAction,
                fontSize: FontSizes.f12,
                fontWeight: FontWeight.w600,
                color: appCtrl.appTheme.blackColor,
              )
            ],
          ).gestures(onTap: secondActionTap)
        ],
      ).marginOnly(bottom: AppScreenUtil().screenHeight(5));
    });
  }
}
