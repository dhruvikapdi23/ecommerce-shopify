import 'package:flutter/cupertino.dart';

import '../../config.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return  Icon(appCtrl.isRTL ||
            appCtrl.languageVal == "ar" ?CupertinoIcons.arrow_right :CupertinoIcons.arrow_left)
            .gestures(onTap: () => Get.back());
      }
    );
  }
}
