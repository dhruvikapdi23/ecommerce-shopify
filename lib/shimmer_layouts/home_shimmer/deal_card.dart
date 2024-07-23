import '../../config.dart';

class DealCardShimmer extends StatelessWidget {
  const DealCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return CommonShimmer(
        height: 100,
        width: MediaQuery.of(context).size.width,
        borderRadius: 2,
        color: appCtrl.appTheme.lightGray.withOpacity(.3),
        borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonShimmer(
                  height: 50,
                  width: 55,
                  borderRadius: 5,
                  color: appCtrl.appTheme.lightGray.withOpacity(.3),
                  borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
                ).paddingSymmetric(
                  vertical: AppScreenUtil().screenHeight(10),
                  horizontal: AppScreenUtil().screenWidth(10),
                ),
                const DealsTextLayout()
              ],
            ),
            CommonShimmer(
              height: 20,
              width: 22,
              borderRadius: 50,
              color: appCtrl.appTheme.lightGray.withOpacity(.3),
              borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
            ).paddingSymmetric(
                horizontal: AppScreenUtil().screenHeight(15),
                vertical: AppScreenUtil().screenWidth(10))
          ],
        ),
      );
    });
  }
}
