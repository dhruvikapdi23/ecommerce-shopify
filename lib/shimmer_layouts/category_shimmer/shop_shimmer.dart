import '../../config.dart';

class ShopShimmer extends StatelessWidget {
  const ShopShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Shimmer.fromColors(
            baseColor: appCtrl.appTheme.greyLight25,
            highlightColor: appCtrl.appTheme.gray,
            child: const CommonGridViewList());
      }
    );
  }
}
