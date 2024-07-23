import '../../../../../config.dart';
import 'dart:math' as math;

class OfferTimeLayout extends StatelessWidget {
  const OfferTimeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return Container(
        color: homeCtrl.appCtrl.appTheme.whiteColor,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment:
              homeCtrl.appCtrl.isRTL || homeCtrl.appCtrl.languageVal == "ar"
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: AppScreenUtil().screenHeight(10),
                  bottom: AppScreenUtil().screenHeight(20)),
              height: AppScreenUtil().size(155),
              padding: EdgeInsets.only(
                  left: AppScreenUtil().screenWidth(18),
                  right: homeCtrl.appCtrl.isRTL ||
                          homeCtrl.appCtrl.languageVal == "ar"
                      ? AppScreenUtil().screenWidth(18)
                      : 0),
              alignment: Alignment.centerLeft,
              color: homeCtrl.appCtrl.appTheme.lightGray,
              width: MediaQuery.of(context).size.width,
              child: const OfferTimeData(),
            ),
            homeCtrl.appCtrl.isRTL || homeCtrl.appCtrl.languageVal == "ar"
                ? Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: Image.asset(
                      imageAssets.girl,
                      fit: BoxFit.cover,
                      height: AppScreenUtil().size(180),
                    ))
                : Image.asset(
                    imageAssets.girl,
                    fit: BoxFit.cover,
                    height: AppScreenUtil().size(180),
                  )
          ],
        ),
      );
    });
  }
}
