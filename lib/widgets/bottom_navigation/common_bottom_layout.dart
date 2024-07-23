
import 'package:multikart/shopify/mixin/cart_mixin.dart';

import '../../config.dart';

class BottomNavigationWidget with CartMixin {
  final cartCtrl = Get.isRegistered<CartController>()
      ? Get.find<CartController>()
      : Get.put(CartController());

  BottomNavigationBarItem bottomNavigationCard(
      {var color,
      int? selectedIndex,
      String? image,
      var bgColor,
      String? title}) {
    return BottomNavigationBarItem(
      backgroundColor: bgColor,
      icon: Padding(
        padding: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(2)),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            SvgPicture.asset(
              image!,
              color: color,
            ),
            if(selectedIndex !=2)
              if (title == "CART")
                if (cartCtrl.productsInCart.isNotEmpty)
                  Text(
                    cartCtrl.productsInCart.length.toString(),
                    style: AppCss.body4.textColor(appCtrl.appTheme.whiteColor),
                  ).paddingAll(Insets.i3).decorated(
                      color: selectedIndex == 2 ? appCtrl.appTheme.blackColor : appCtrl.appTheme.primary, shape: BoxShape.circle)
          ],
        ),
      ),
      label: title!,
    );
  }
}
