import '../../config.dart';

class CommonBoxTextShimmer extends StatelessWidget {
  const CommonBoxTextShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...AppArray().homeCategory.map((e) {
                return CommonShimmer(
                  height: 40,
                  width: 100,
                  borderRadius: 5,
                  color: appCtrl.appTheme.lightGray.withOpacity(.1),
                  borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
                  child: CommonShimmer(
                    height: 10,
                    width: 50,
                    borderRadius: 2,
                    color: appCtrl.appTheme.lightGray.withOpacity(.7),
                    borderColor:
                    appCtrl.appTheme.lightGray.withOpacity(.2),
                  ).paddingSymmetric(
                      horizontal: AppScreenUtil().screenWidth(10),
                      vertical: AppScreenUtil().screenHeight(10)),
                ).paddingOnly(
                  bottom: AppScreenUtil().screenHeight(10),
                  top: AppScreenUtil().screenHeight(10),
                  right: AppScreenUtil().screenWidth(10),
                );
              }).toList()
            ],
          ),
        ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
      }
    );
  }
}
