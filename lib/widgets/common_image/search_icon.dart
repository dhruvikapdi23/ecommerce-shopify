import '../../config.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return SvgPicture.asset(
          svgAssets.search,
          color: appCtrl.appTheme.blackColor,
        ).gestures(onTap: (){
          appCtrl.selectedIndex = 1;
          appCtrl.update();
          Get.forceAppUpdate();
          Get.toNamed(routeName.search)!.then((value) {
            appCtrl.selectedIndex = 0;
            appCtrl.update();
            Get.forceAppUpdate();
          });
        });
      }
    );
  }
}
