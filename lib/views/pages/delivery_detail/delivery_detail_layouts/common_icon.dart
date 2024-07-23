import 'package:multikart/config.dart';

class CommonIcon extends StatelessWidget {
  final GestureTapCallback? onTap;
  final IconData? icon;

  const CommonIcon({super.key, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(icon,
              color: appCtrl.appTheme.contentColor,
              size: AppScreenUtil().size(14))
          .paddingAll(AppScreenUtil().size(4))
          .decorated(
              border: Border.all(
                  color: appCtrl.appTheme.contentColor.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(AppScreenUtil().size(4))),
    );
  }
}
