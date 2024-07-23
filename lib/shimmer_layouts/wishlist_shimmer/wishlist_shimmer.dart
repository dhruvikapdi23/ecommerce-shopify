import '../../config.dart';

class WishListShimmer extends StatelessWidget {
  const WishListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AppController>(
      builder: (appCtrl) {
        return Shimmer.fromColors(
            baseColor: appCtrl.appTheme.greyLight25,
            highlightColor: appCtrl.appTheme.gray,
            child: SingleChildScrollView(
              child:
              Column(
                children: <Widget>[
                  for (int i = 0; i < 10; i++)
                    Column(
                      children: [
                        const DealCardShimmer().marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
                        const Space(0, 10),
                        const BorderLineLayout()
                      ],
                    ).marginOnly(bottom: AppScreenUtil().screenHeight(10)),
                ],
              ),
            ));
      }
    );
  }
}
