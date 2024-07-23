import '../../config.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Shimmer.fromColors(
            baseColor: appCtrl.appTheme.greyLight25,
            highlightColor: appCtrl.appTheme.gray,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //category list
                  ...AppArray().categoryList.asMap().entries.map((e) {
                    return CommonShimmer(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      borderRadius: 5,
                      color: appCtrl.appTheme.lightGray.withOpacity(.3),
                      borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
                    ).marginOnly(bottom: AppScreenUtil().screenHeight(10));
                  }).toList()
                ],
              ),
            )).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
      }
    );
  }
}
