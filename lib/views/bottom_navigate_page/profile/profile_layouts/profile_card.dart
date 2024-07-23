import 'package:multikart/views/bottom_navigate_page/profile/profile_layouts/profile_list.dart';

import '../../../../config.dart';

class ProfileCard extends StatelessWidget {
  final ProfileModel? data;
  final int? index;
  final int? lastIndex;
  final GestureTapCallback? onTap;

  const ProfileCard(
      {Key? key, this.data, this.index, this.lastIndex, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(
        children: [
          ProfileList(
            data: data,
          ),
          if (index == 11)
            Container(
              height: 10,
              color: appCtrl.appTheme.lightGray,
            ),
          if (index != lastIndex && index != 11)
            Divider(
              thickness: 1,
              color: appCtrl.appTheme.greyLight25,
              height: AppScreenUtil().screenHeight(2),
              endIndent: 15,
              indent: 15,
            )
        ],
      ).gestures(onTap: onTap).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
    });
  }
}
