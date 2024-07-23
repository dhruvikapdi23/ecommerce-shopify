import '../../../../config.dart';

class CommonIncDecButton extends StatelessWidget {
  final IconData? icon;
  final GestureTapCallback? onTap;
  const CommonIncDecButton({Key? key,this.onTap,this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Container(
            alignment: Alignment.center,
            height: AppScreenUtil().screenHeight(22),
            width: AppScreenUtil().screenWidth(22),
            decoration: BoxDecoration(
                border: Border.all(
                  color: appCtrl.appTheme.blackColor,
                ),
                borderRadius: BorderRadius.circular(
                    AppScreenUtil().borderRadius(3))),
            child: Icon(icon,
                size: AppScreenUtil().size(14))).gestures(onTap:onTap);
      }
    );
  }
}
