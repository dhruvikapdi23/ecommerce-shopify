import '../../config.dart';

class CartShimmer extends StatelessWidget {
  const CartShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Shimmer.fromColors(
          baseColor: appCtrl.appTheme.greyLight25,
          highlightColor: appCtrl.appTheme.gray,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoopShimmer(),
                const BorderLineLayout(),
                const Space(0, 20),
                const CommonTitleText(),
                const Space(0, 20),
                const RowListShimmer(),
                const Space(0, 20),
                const BorderLineLayout(),
                const Space(0, 20),
                const CommonTitleText(),
                const Space(0, 20),
                CommonShimmer(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  borderRadius: 2,
                  color: appCtrl.appTheme.lightGray.withOpacity(.3),
                  borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
                ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
                const Space(0, 20),
                const BorderLineLayout(),
                const Space(0, 20),
                const CommonTitleText(),
                const Space(0, 20),
                HomeShimmerWidget().textInRowShimmer(),
                const Space(0, 20),
                HomeShimmerWidget().textInRowShimmer(),
                const Space(0, 20),
                HomeShimmerWidget().textInRowShimmer(),
                const Space(0, 20),
                HomeShimmerWidget().textInRowShimmer(),
                const Space(0, 20),
                const BorderLineLayout(),
                const Space(0, 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      CommonCircle(),
                      CommonCircle(),
                      CommonCircle()
                    ]),
                const Space(0, 50)
              ],
            ),
          ));
    });
  }
}
