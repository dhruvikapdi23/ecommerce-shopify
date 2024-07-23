import 'package:flutter/cupertino.dart';

import '../../config.dart';

class MenuRoundedIcon extends StatelessWidget {
  final GestureTapCallback? onTap;

  const MenuRoundedIcon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Icon(
        appCtrl.selectedIndex == 0
            ? Icons.menu_rounded
            : appCtrl.isRTL || appCtrl.languageVal == "ar"
                ? CupertinoIcons.arrow_right
                : CupertinoIcons.arrow_left,
        size: AppScreenUtil().size(25),
        color: appCtrl.appTheme.blackColor,
      ).gestures(onTap: onTap);
    });
  }
}
