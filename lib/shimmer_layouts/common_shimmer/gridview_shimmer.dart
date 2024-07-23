import '../../config.dart';

class GridViewShimmer extends StatelessWidget {
  final int? count;
  final int? crossAxisCount;
  const GridViewShimmer({Key? key, this.count, this.crossAxisCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: count,
        itemBuilder: (context, index) {
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
              borderColor: appCtrl.appTheme.lightGray.withOpacity(.2),
            ).paddingSymmetric(
                horizontal: AppScreenUtil().screenWidth(10),
                vertical: AppScreenUtil().screenHeight(10)),
          ).paddingOnly(
            bottom: AppScreenUtil().screenHeight(2),
            top: AppScreenUtil().screenHeight(10),
            right: AppScreenUtil().screenWidth(10),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount!,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / (4)),
        ),
      ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
    });
  }
}
