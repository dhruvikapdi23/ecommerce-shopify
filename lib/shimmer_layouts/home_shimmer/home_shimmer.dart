import '../../config.dart';

class HomerShimmer extends StatelessWidget {
  const HomerShimmer({Key? key}) : super(key: key);

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
            //home category shimmer
            const HomeCategoryShimmer(),
            HomeShimmerWidget().textShimmer(),
            HomeShimmerWidget().textInRowShimmer(),

            const Space(0, 10),
            const DealOfTheDayShimmer(),
            const Space(0, 10),
            const BorderLineLayout(),
            const Space(0, 10),
            HomeShimmerWidget().textInColumnShimmer(),
            const Space(0, 10),
            const CommonBoxTextShimmer(),
            const CommonGridViewList(),
            const Space(0, 20),
            HomeShimmerWidget().textInColumnShimmer(),
            const CommonBoxTextShimmer(),
            const Space(0, 10),
            const BorderLineLayout(),
            const Space(0, 10),
            HomeShimmerWidget().textInColumnShimmer(),

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
            const Space(0, 30),
            CommonShimmer(
                    height: 10,
                    width: 100,
                    borderRadius: 2,
                    color: appCtrl.appTheme.lightGray.withOpacity(.3),
                    borderColor: appCtrl.appTheme.lightGray.withOpacity(.3))
                .marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
            const Space(0, 30),
            const GridViewShimmer(crossAxisCount: 2, count: 4)
          ]),
        ),
      );
    });
  }
}
