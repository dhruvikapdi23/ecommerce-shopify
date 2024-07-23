import '../../config.dart';

class PagesListShimmer extends StatelessWidget {
  const PagesListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Shimmer.fromColors(
          baseColor: appCtrl.appTheme.greyLight25,
          highlightColor: appCtrl.appTheme.gray,
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              for (var i = 0; i < 2; i++)
                Column(
                  children: [
                    CommonShimmer(
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        borderRadius: 5,
                        color: appCtrl.appTheme.lightGray.withOpacity(.3),
                        borderColor:
                            appCtrl.appTheme.lightGray.withOpacity(.3)),
                    Column(children: [
                      for (var i = 0; i < 6; i++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonShimmer(
                                height: 10,
                                width: 100,
                                borderRadius: 2,
                                color:
                                    appCtrl.appTheme.lightGray.withOpacity(.3),
                                borderColor:
                                    appCtrl.appTheme.lightGray.withOpacity(.3)),
                            Icon(Icons.circle, size: AppScreenUtil().size(14))
                          ],
                        ).marginSymmetric(
                            vertical: AppScreenUtil().screenWidth(10))
                    ]).marginSymmetric(
                        vertical: AppScreenUtil().screenHeight(10))
                  ],
                ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15))
            ]),
          ));
    });
  }
}
