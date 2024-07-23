import '../../config.dart';

class BuyIcon extends StatelessWidget {
  final Color? color;
  final bool isIconShow;

  const BuyIcon({Key? key, this.color, this.isIconShow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Stack(
        alignment: Alignment.topRight,
        children: [
          SvgPicture.asset(
            svgAssets.buy,
            color: color ?? appCtrl.appTheme.blackColor,
          ),
          if (isIconShow)
            GetBuilder<CartController>(builder: (cartCtrl) {
              return cartCtrl.productsInCart.isNotEmpty
                  ? Text(
                      cartCtrl.productsInCart.length.toString(),
                      style:
                          AppCss.body4.textColor(appCtrl.appTheme.whiteColor),
                    ).paddingAll(Insets.i3).decorated(
                      color: appCtrl.appTheme.primary, shape: BoxShape.circle)
                  : Container();
            })
        ],
      ).gestures(onTap: () async {
        appCtrl.selectedIndex = 2;
        appCtrl.isHeart = true;
        appCtrl.isCart = false;
        appCtrl.isShare = false;
        appCtrl.isSearch = false;
        appCtrl.isNotification = false;
        appCtrl.update();
        appCtrl.isShimmer = true;
        Get.offAndToNamed(routeName.dashboard);
        await Future.delayed(DurationClass.s1);
        appCtrl.isShimmer = false;
        appCtrl.update();
        Get.forceAppUpdate();
      });
    });
  }
}
