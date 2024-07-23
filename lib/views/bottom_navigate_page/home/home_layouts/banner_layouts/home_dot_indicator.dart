import '../../../../../config.dart';

class HomeDotIndicator extends StatelessWidget {

 const HomeDotIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: homeCtrl.bannerList.asMap().entries.map((entry) {
            return GestureDetector(
                onTap: () => homeCtrl.controller.animateToPage(entry.key),
                child: Container(
                    height: AppScreenUtil()
                        .screenHeight(homeCtrl.current == entry.key ? 5 : 7),
                    width: AppScreenUtil().screenWidth(
                            homeCtrl.current == entry.key ? 35 : 7),
                    margin:
                        EdgeInsets.only(right: AppScreenUtil().screenWidth(5)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: homeCtrl.appCtrl.appTheme.lightGray)));
          }).toList());
    });
  }
}
