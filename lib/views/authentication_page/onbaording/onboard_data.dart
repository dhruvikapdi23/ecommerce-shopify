import 'package:multikart/views/authentication_page/onbaording/dot_indicator.dart';

import '../../../config.dart';

class OnBoardData extends StatelessWidget {
  String? title = "";
  String? description = "";

  OnBoardData({Key? key, this.title, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(builder: (onBoardingCtrl) {
      return onBoardingCtrl.imgList.isNotEmpty
          ? Padding(
              padding: EdgeInsets.only(top: AppScreenUtil().screenHeight(12)),
              child: Column(
                children: [
                  OnBoardWidget().textLayout(
                      text: title ??
                          onBoardingCtrl.imgList[onBoardingCtrl.current].title
                              .toString()
                              .tr,
                      fontSize: FontSizes.f14,
                      fontWeight: FontWeight.w700,
                      color: onBoardingCtrl.appCtrl.appTheme.blackColor,
                      textDecoration: TextDecoration.none),
                  const Space(0, 10),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppScreenUtil().screenWidth(15)),
                    child: OnBoardWidget().textLayout(
                        text: description ??
                            onBoardingCtrl
                                .imgList[onBoardingCtrl.current].description
                                .toString()
                                .tr,
                        fontSize: FontSizes.f12,
                        fontWeight: FontWeight.normal,
                        color: onBoardingCtrl.appCtrl.appTheme.contentColor,
                        textDecoration: TextDecoration.none),
                  ),
                  const Space(0, 25),
                  OnBoardDotIndicator()
                ],
              ),
            )
          : Container();
    });
  }
}
