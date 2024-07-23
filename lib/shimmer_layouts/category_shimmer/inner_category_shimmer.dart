import '../../config.dart';

class InnerCategoryShimmer extends StatelessWidget {
  const InnerCategoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Shimmer.fromColors(
          baseColor: appCtrl.appTheme.greyLight25,
          highlightColor: appCtrl.appTheme.gray,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    //category list
                    CommonShimmer(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      borderRadius: 5,
                      color: appCtrl.appTheme.lightGray.withOpacity(.3),
                      borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
                    ).marginOnly(bottom: AppScreenUtil().screenHeight(20)),

                    ...AppArray().innerCategoryList.map((e) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonShimmer(
                            height: 10,
                            width: 100,
                            borderRadius: 5,
                            color: appCtrl.appTheme.lightGray.withOpacity(.3),
                            borderColor:
                                appCtrl.appTheme.lightGray.withOpacity(.3),
                          ),
                          Icon(
                            Icons.circle,
                            size: AppScreenUtil().size(14),
                          )
                        ],
                      ).marginOnly(bottom: AppScreenUtil().screenHeight(20));
                    }).toList(),
                    const Space(0, 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...AppArray()
                              .innerCategoryProduct
                              .map((e) => CommonShimmer(
                                    height: 100,
                                    width: 100,
                                    borderRadius: 5,
                                    color: appCtrl.appTheme.lightGray
                                        .withOpacity(.3),
                                    borderColor: appCtrl.appTheme.lightGray
                                        .withOpacity(.3),
                                  ).paddingOnly(
                                      right: AppScreenUtil().screenWidth(15)))
                              .toList()
                        ],
                      ),
                    ),
                    const Space(0, 20)
                  ],
                ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
                const GridViewShimmer(
                  crossAxisCount: 3,
                  count: 6,
                ),
              ],
            ),
          ));
    });
  }
}
