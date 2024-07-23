import 'package:flutter/cupertino.dart';

import '../../../../config.dart';

class RecentSearchCard extends StatelessWidget {
  final dynamic data;
  const RecentSearchCard({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return InkWell(
        onTap: () => appCtrl.goToProductDetail(data),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(svgAssets.clock),
                const Space(10, 0),
                LatoFontStyle(
                  text: data['title'],
                  fontSize: FontSizes.f14,
                  color: appCtrl.appTheme.contentColor,
                ),
              ],
            ),
            Icon(
              CupertinoIcons.multiply,
              size: AppScreenUtil().size(18),
              color: appCtrl.appTheme.contentColor,
            )
          ],
        ).marginSymmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(5)),
      );
    });
  }
}
