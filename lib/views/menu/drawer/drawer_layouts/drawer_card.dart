import '../../../../config.dart';

class DrawerCard extends StatelessWidget {
  final dynamic data;
  final int? index;
  final int? lastIndex;
  final GestureTapCallback? onTap;

  const DrawerCard(
      {Key? key, this.data, this.index, this.lastIndex, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(
        children: [
          DrawerLeadingTitle(
            data: data,
            index: index,
          ),
          if (index == 10)
            Container(
              height: 10,
              color: appCtrl.appTheme.lightGray,
            ),
          if (index != lastIndex && index != 10)
            Divider(
              thickness: 1,
              color: appCtrl.appTheme.greyLight25,
              height: AppScreenUtil().screenHeight(2),
              endIndent: 15,
              indent: 15,
            )
        ],
      ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(8)).gestures(onTap: onTap);
    });
  }
}
