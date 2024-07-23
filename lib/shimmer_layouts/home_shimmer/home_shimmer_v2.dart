import '../../config.dart';

class Homev2Shimmer extends StatelessWidget {
  const Homev2Shimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Shimmer.fromColors(
        baseColor: appCtrl.appTheme.greyLight25,
        highlightColor: appCtrl.appTheme.gray,
        child: SingleChildScrollView(
          primary: true,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HomeShimmerWidget().bannerShimmer(),
            HomeShimmerWidget().categoryInRowShimmer(),
            HomeShimmerWidget().textShimmer(),
            const GridViewShimmer(crossAxisCount: 3, count: 6),
            const Space(0, 10),
            HomeShimmerWidget().textInSingleColumnShimmer(),
            const Space(0, 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...AppArray().homeKidsCornerList.map((e) {
                    return ProductShimmer(
                            width: MediaQuery.of(context).size.width / 3)
                        .marginOnly(right: AppScreenUtil().screenWidth(10));
                  }).toList()
                ],
              ),
            ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
            const Space(0, 20),
            HomeShimmerWidget().textInSingleColumnShimmer(),
            const Space(0, 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...AppArray().homeKidsCornerList.map((e) {
                    return ProductShimmer(
                            width: MediaQuery.of(context).size.width / 3)
                        .marginOnly(right: AppScreenUtil().screenWidth(10));
                  }).toList()
                ],
              ),
            ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
          ]),
        ),
      );
    });
  }
}
