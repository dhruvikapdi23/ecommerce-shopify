import '../../config.dart';

class DealsTextLayout extends StatelessWidget {
  const DealsTextLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonShimmer(
              height: 8,
              width: 80,
              borderRadius: 2,
              color:
              appCtrl.appTheme.lightGray.withOpacity(.3),
              borderColor:
              appCtrl.appTheme.lightGray.withOpacity(.3),
            ),
            const Space(0, 10),
            CommonShimmer(
              height: 8,
              width: 50,
              borderRadius: 2,
              color:
              appCtrl.appTheme.lightGray.withOpacity(.3),
              borderColor:
              appCtrl.appTheme.lightGray.withOpacity(.3),
            ),
            const Space(0, 10),
            Row(
              children: [
                CommonShimmer(
                  height: 8,
                  width: 50,
                  borderRadius: 2,
                  color: appCtrl.appTheme.lightGray
                      .withOpacity(.3),
                  borderColor: appCtrl.appTheme.lightGray
                      .withOpacity(.3),
                ),
                const Space(10, 0),
                CommonShimmer(
                  height: 8,
                  width: 50,
                  borderRadius: 2,
                  color: appCtrl.appTheme.lightGray
                      .withOpacity(.3),
                  borderColor: appCtrl.appTheme.lightGray
                      .withOpacity(.3),
                ),
                const Space(10, 0),
                CommonShimmer(
                  height: 8,
                  width: 50,
                  borderRadius: 2,
                  color: appCtrl.appTheme.lightGray
                      .withOpacity(.3),
                  borderColor: appCtrl.appTheme.lightGray
                      .withOpacity(.3),
                )
              ],
            )
          ],
        );
      }
    );
  }
}
