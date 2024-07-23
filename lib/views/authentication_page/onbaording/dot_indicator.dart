import '../../../config.dart';

class OnBoardDotIndicator extends StatelessWidget {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  OnBoardDotIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(builder: (onBoardingCtrl) {
         return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            onBoardingCtrl.imgList.asMap().entries.map((entry) {
              return GestureDetector(
                  onTap: () => onBoardingCtrl.controller
                      .animateToPage(entry.key),
                  child: Container(
                      padding: EdgeInsets.only(
                          top: AppScreenUtil().screenHeight(10)),
                      height: AppScreenUtil().screenHeight(onBoardingCtrl.current == entry.key
                          ? 6
                          : 8),
                      width: onBoardingCtrl.current == entry.key
                          ? AppScreenUtil().screenWidth(40)
                          : AppScreenUtil().screenHeight(onBoardingCtrl.current == entry.key
                          ? 6
                          : 8),
                      margin: EdgeInsets.only(
                          right: AppScreenUtil().screenWidth(5)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: onBoardingCtrl.appCtrl.appTheme.lightGray)));
            }).toList());

    });
  }
}
