import '../../../config.dart';

class NotificationShimmer extends StatelessWidget {
  const NotificationShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Shimmer.fromColors(
        baseColor: appCtrl.appTheme.greyLight25,
        highlightColor: appCtrl.appTheme.gray,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CommonBoxTextShimmer(),
              const Space(0, 20),
              Column(
                children: <Widget>[
                  for (int i = 0; i < 9; i++)
                    CommonShimmer(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      borderRadius: 5,
                      color: appCtrl.appTheme.lightGray.withOpacity(.1),
                      borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
                      child: Row(children: [
                        CommonShimmer(
                          height: 80,
                          width: 80,
                          borderRadius: 2,
                          color: appCtrl.appTheme.lightGray.withOpacity(.7),
                          borderColor:
                              appCtrl.appTheme.lightGray.withOpacity(.2),
                        ).paddingSymmetric(
                            horizontal: AppScreenUtil().screenWidth(10),
                            vertical: AppScreenUtil().screenHeight(10)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CommonTitleText(width: 180),
                            Space(0, 5),
                            CommonTitleText(width: 150),
                            Space(0, 5),
                            CommonTitleText()
                          ],
                        ).paddingSymmetric(
                            vertical: AppScreenUtil().screenHeight(10))
                      ]),
                    )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
