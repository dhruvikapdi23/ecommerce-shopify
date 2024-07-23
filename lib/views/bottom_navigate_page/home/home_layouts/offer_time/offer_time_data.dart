import '../../../../../config.dart';

class OfferTimeData extends StatelessWidget {
  const OfferTimeData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LatoFontStyle(
              text: HomeFont().denimWear,
              fontSize: FontSizes.f12,
              fontWeight: FontWeight.normal,
              color: appCtrl.appTheme.contentColor,
            ),
            LatoFontStyle(
              text: HomeFont().salesStartIn,
              fontSize: FontSizes.f16,
              fontWeight: FontWeight.normal,
              color: appCtrl.appTheme.blackColor,
            ),
            Row(
              children: [
                TimeLayout(
                  title: HomeFont().hours,
                  value: "15",
                ),
                const Space(10, 0),
                TimeLayout(
                  title: HomeFont().minutes,
                  value: "10",
                ),
                const Space(10, 0),
                TimeLayout(
                  title: HomeFont().seconds,
                  value: "35",
                ),
              ],
            ),
            LatoFontStyle(
              text: HomeFont().exploreNow,
              fontSize: FontSizes.f14,
              fontWeight: FontWeight.normal,
              textDecoration: TextDecoration.underline,
              color: appCtrl.appTheme.contentColor,
            ),
          ],
        );
      }
    );
  }
}
