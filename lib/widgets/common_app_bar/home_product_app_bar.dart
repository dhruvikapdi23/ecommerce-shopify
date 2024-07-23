import '../../config.dart';

class HomeProductAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GestureTapCallback? onTap;
  final Widget? titleChild;
  final String? categoryId;

  const HomeProductAppBar({Key? key, this.onTap,this.titleChild,this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return AppBar(
        surfaceTintColor: appCtrl.appTheme.bgColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: MenuRoundedIcon(
          onTap: onTap,
        ),
        centerTitle: false,
        backgroundColor: appCtrl.appTheme.whiteColor,
        titleSpacing: 0,
        title: titleChild,
        actions:[
          AppBarActionLayout(categoryId: categoryId),
        ],
      );
    });
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
