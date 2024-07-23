import 'package:multikart/config.dart';

class HomeShimmerWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  //text shimmer
  Widget textShimmer() => CommonShimmer(
        height: 150,
        width: MediaQuery.of(Get.context!).size.width,
        borderRadius: 5,
        color: appCtrl.appTheme.lightGray.withOpacity(.3),
        borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
      )
          .paddingSymmetric(vertical: AppScreenUtil().screenHeight(10))
          .marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));

  //text shimmer
  Widget bannerShimmer() => CommonShimmer(
        height: 250,
        width: MediaQuery.of(Get.context!).size.width,
        borderRadius: 5,
        color: appCtrl.appTheme.lightGray.withOpacity(.3),
        borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
      )
          .paddingSymmetric(vertical: AppScreenUtil().screenHeight(10))
          .marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));

  //text in row
  Widget categoryInRowShimmer() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonShimmer(
            height: 120,
            width: 160,
            borderRadius: 2,
            color: appCtrl.appTheme.lightGray.withOpacity(.3),
            borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
          ),
          CommonShimmer(
            height: 120,
            width: 160,
            borderRadius: 2,
            color: appCtrl.appTheme.lightGray.withOpacity(.3),
            borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
          )
        ],
      ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));

  //text in row
  Widget textInRowShimmer() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonShimmer(
            height: 10,
            width: 110,
            borderRadius: 2,
            color: appCtrl.appTheme.lightGray.withOpacity(.3),
            borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
          ),
          CommonShimmer(
            height: 10,
            width: 50,
            borderRadius: 2,
            color: appCtrl.appTheme.lightGray.withOpacity(.3),
            borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
          )
        ],
      ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));

  //text in column
  Widget textInColumnShimmer() => Column(
        children: [
          CommonShimmer(
            height: 10,
            width: 110,
            borderRadius: 2,
            color: appCtrl.appTheme.lightGray.withOpacity(.3),
            borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
          ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
          const Space(0, 10),
          CommonShimmer(
            height: 10,
            width: 50,
            borderRadius: 2,
            color: appCtrl.appTheme.lightGray.withOpacity(.3),
            borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
          ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15))
        ],
      );

  //text in column
  Widget textInSingleColumnShimmer() => CommonShimmer(
        height: 10,
        width: 110,
        borderRadius: 2,
        color: appCtrl.appTheme.lightGray.withOpacity(.3),
        borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
      ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
}
