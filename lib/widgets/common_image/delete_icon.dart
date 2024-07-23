import '../../config.dart';

class DeleteIcon extends StatelessWidget {
  const DeleteIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgAssets.delete,
      height: AppScreenUtil().screenHeight(18),
      color: appCtrl.isTheme ? appCtrl.appTheme.blackColor : appCtrl.appTheme.whiteColor,
    );
  }
}
