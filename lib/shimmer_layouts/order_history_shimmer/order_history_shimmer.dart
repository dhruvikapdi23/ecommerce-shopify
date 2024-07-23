import '../../config.dart';

class OrderHistoryShimmer extends StatelessWidget {
  const OrderHistoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Shimmer.fromColors(
        baseColor: appCtrl.appTheme.greyLight25,
        highlightColor: appCtrl.appTheme.gray,
        child: Column(
          children: <Widget>[
            for (int i = 0; i < 2; i++)
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const CommonTitleText(),
                const Space(0, 10),
                for (int j = 0; j < 2; j++)
                  Column(
                    children: [
                      Row(
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
                                          color: appCtrl.appTheme.lightGray
                                              .withOpacity(.3),
                                          borderColor: appCtrl
                                              .appTheme.lightGray
                                              .withOpacity(.3))
                                      .paddingSymmetric(
                                          vertical:
                                              AppScreenUtil().screenHeight(10),
                                          horizontal:
                                              AppScreenUtil().screenWidth(10)),
                                  const DealsTextLayout()
                                ]),
                            const Icon(Icons.circle)
                          ]),
                      CommonShimmer(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          borderRadius: 2,
                          color: appCtrl.appTheme.lightGray.withOpacity(.3),
                          borderColor:
                              appCtrl.appTheme.lightGray.withOpacity(.3))
                    ],
                  ).marginSymmetric(
                      horizontal: AppScreenUtil().screenWidth(15),
                      vertical: AppScreenUtil().screenHeight(5)),
                const Space(0, 15),
                const BorderLineLayout(),
                const Space(0, 15)
              ])
          ],
        ),
      );
    });
  }
}
