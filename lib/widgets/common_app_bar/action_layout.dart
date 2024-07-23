import 'dart:developer';
import '../../config.dart';
import '../../Api/services.dart';

class AppBarActionLayout extends StatefulWidget {
  final String? productId;
  final String? categoryId;

  const AppBarActionLayout({
    Key? key,
    this.productId,
    this.categoryId,
  }) : super(key: key);

  @override
  State<AppBarActionLayout> createState() => _AppBarActionLayoutState();
}

class _AppBarActionLayoutState extends State<AppBarActionLayout> {
  final cartCtrl = Get.isRegistered<CartController>()
      ? Get.find<CartController>()
      : Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (appCtrl.isShare)
          const ShareIcon()
              .inkWell(
                  onTap: () async => {
                        widget.productId != null
                            ? {
                                log(environment['serverConfig']['domain'] +
                                    'product/' +
                                    widget.productId),
                                Services().firebase.shareDynamicLinkProduct(
                                    itemUrl: environment['serverConfig']
                                            ['domain'] +
                                        'product/' +
                                        widget.productId!.substring(
                                            widget.productId!.lastIndexOf('/') +
                                                1))
                              }
                            : {
                                log(environment['serverConfig']['domain'] +
                                    'category/' +
                                    widget.categoryId!),
                                Services().firebase.shareDynamicLinkProduct(
                                    itemUrl: environment['serverConfig']
                                            ['domain'] +
                                        'category/' +
                                        widget.categoryId!)
                              }
                      })
              .paddingSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
        if (appCtrl.isSearch)
          const SearchIcon().paddingSymmetric(
              horizontal: AppScreenUtil().screenWidth(appCtrl.isSearch
                  ? appCtrl.isNotification
                      ? 0
                      : 10
                  : 10)),
        if (appCtrl.isNotification)
          const NotificationIcon()
              .paddingSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
        if (appCtrl.isHeart)
          HeartIcon(
            color: appCtrl.appTheme.blackColor,
          ).gestures(onTap: () async {
            appCtrl.isShimmer = true;
            appCtrl.selectedIndex = 3;
            appCtrl.isHeart = false;
            appCtrl.isCart = true;
            appCtrl.isShare = false;
            appCtrl.isSearch = false;
            appCtrl.isNotification = false;
            appCtrl.update();
            Get.offAllNamed(routeName.dashboard);
            await Future.delayed(DurationClass.s1);
            appCtrl.isShimmer = false;
            Get.forceAppUpdate();
          }).paddingSymmetric(
              horizontal: AppScreenUtil()
                  .screenWidth(appCtrl.isHeart && appCtrl.isCart ? 0 : 10)),
        if (appCtrl.isCart)
          const BuyIcon().paddingSymmetric(
              horizontal: AppScreenUtil().screenWidth(15),
              vertical: AppScreenUtil().screenHeight(15)),
      ],
    );
  }
}
