import 'package:multikart/utilities/storage_utils.dart';

import '../../../config.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  double animationDuration = 0.0;
  int totalItems = 9;

  @override
  void initState() {
    super.initState();
    const int totalDuration = 1000;
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: totalDuration));
    animationDuration = totalDuration / (150 * (totalDuration / (totalItems)));
    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<DashboardController>(builder: (dashboardCtrl) {
        return Drawer(
          backgroundColor: appCtrl.appTheme.bgColor,surfaceTintColor: appCtrl.appTheme.bgColor,
          child: ListView(
            children: [
              const DrawerUserLayout(),
              const Space(0, 15),
              ...dashboardCtrl.drawerList.asMap().entries.map((e) {
                return DrawerDataListLayout(
                  data: e.value,
                  animationController: _animationController,
                  duration: animationDuration,
                  index: e.key,
                  lastIndex: dashboardCtrl.drawerList.length - 1,
                  onTap: () => getStorage(Session.userInfo) == null
                      ? Get.toNamed(routeName.login)
                      : dashboardCtrl.drawerCtrl.goToPage(e.key),
                );
              }).toList(),
              //logout button layout
              getStorage(Session.authToken) != null
                  ? const LogoutButton()
                  : Container()
            ],
          ),
        );
      });
    });
  }
}
