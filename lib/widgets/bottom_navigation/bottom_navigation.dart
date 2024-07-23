import '../../config.dart';

class CommonBottomNavigation extends StatelessWidget {
  final ValueChanged<int>? onTap;

  const CommonBottomNavigation({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: appCtrl.appTheme.blackColor,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        backgroundColor: appCtrl.appTheme.whiteColor,
        selectedItemColor: appCtrl.appTheme.primary,
        items: [
          ...appCtrl.bottomList.asMap().entries.map((e) {
            return BottomNavigationWidget().bottomNavigationCard(
                color: appCtrl.selectedIndex == e.key
                    ? appCtrl.appTheme.primary
                    : appCtrl.appTheme.blackColor,
                selectedIndex: appCtrl.selectedIndex,
                bgColor: appCtrl.appTheme.whiteColor,
                image: appCtrl.selectedIndex == e.key
                    ? e.value['selectedIcon']
                    : e.value['unSelectedIcon'],
                title: e.value['title'].toString().tr.toUpperCase());
          }).toList()
        ],
        currentIndex: appCtrl.selectedIndex,
        onTap: onTap,
      );
    });
  }
}
