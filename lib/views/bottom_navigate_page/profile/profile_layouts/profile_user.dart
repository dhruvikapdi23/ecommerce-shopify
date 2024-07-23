import 'package:multikart/utilities/storage_utils.dart';

import '../../../../config.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: AppScreenUtil().screenWidth(20)),
          color: appCtrl.appTheme.greyLight25,
          height: AppScreenUtil().screenHeight(110),
          width: MediaQuery.of(context).size.width,
          child: Row(children: [
            Container(
                height: AppScreenUtil().screenHeight(75),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: const UserIcon()),
            const Space(20, 0),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LatoFontStyle(
                      text: getStorage(Session.userInfo)['name'].toString().tr,
                      fontSize: FontSizes.f16,
                      fontWeight: FontWeight.w700,
                      color: appCtrl.appTheme.blackColor),
                  LatoFontStyle(
                      text: getStorage(Session.userInfo)['email'].toString().tr,
                      fontSize: FontSizes.f12,
                      fontWeight: FontWeight.normal,
                      color: appCtrl.appTheme.contentColor),
                  const Space(0, 10),
                  /*  CustomButton(
                      title: CommonTextFont().edit,
                      width: AppScreenUtil().screenWidth(100),
                      fontWeight: FontWeight.w600,
                      fontSize: FontSizes.f14,
                      height: AppScreenUtil().screenHeight(25),
                      margin: 0)*/
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppScreenUtil().screenWidth(5),
                          vertical: AppScreenUtil().screenHeight(2)),
                      decoration: BoxDecoration(
                          color: appCtrl.appTheme.primary,
                          borderRadius: BorderRadius.circular(
                              AppScreenUtil().borderRadius(2))),
                      child: LatoFontStyle(
                          text: CommonTextFont().edit,
                          fontSize: FontSizes.f10,
                          fontWeight: FontWeight.w600,
                          color: appCtrl.appTheme.white))
                ]),
          ]));
    });
  }
}
