import 'dart:developer';
import 'package:multikart/models/product_shopify_model.dart' as product_model;
import 'package:multikart/controllers/home_product_controllers/wishlist_controller.dart';
import '../../config.dart';

class CommonBottomSheet extends StatelessWidget {
  final String? text,keyVal;
  final int? index;
final product_model.Product? product;
  const CommonBottomSheet({Key? key, this.text, this.index,this.product,this.keyVal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              LatoFontStyle(
                  text: "$text :",
                  fontSize: FontSizes.f14,
                  fontWeight: FontWeight.w700,
                  color: appCtrl.appTheme.blackColor),
              const Space(0, 10),
              LatoFontStyle(
                  text: text == CommonTextFont().moveToWishList
                      ? CommonTextFont().moveToWishListDesc
                      : CommonTextFont().removeDesc,
                  fontSize: FontSizes.f14,
                  fontWeight: FontWeight.w600,
                  color: appCtrl.appTheme.contentColor,
                  overflow: TextOverflow.clip)
            ],
          ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
          Container(
              width: MediaQuery.of(Get.context!).size.width,
              padding: EdgeInsets.symmetric(
                  vertical: AppScreenUtil().screenHeight(12),
                  horizontal: AppScreenUtil().screenWidth(15)),
              decoration: BoxDecoration(
                color: appCtrl.appTheme.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: appCtrl.appTheme.lightGray,
                    spreadRadius: 10,
                    blurRadius: 5,
                    offset: const Offset(0, 7), // changes position of shadow
                  )
                ],
              ),
              child: IntrinsicHeight(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: (() async {
                            final wishlistCtrl =
                                Get.isRegistered<WishlistController>()
                                    ? Get.find<WishlistController>()
                                    : Get.put(WishlistController());
                            final productCtrl =
                                Get.isRegistered<ProductDetailController>()
                                    ? Get.find<ProductDetailController>()
                                    : Get.put(ProductDetailController());
                            final cartCtrl = Get.isRegistered<CartController>()
                                ? Get.find<CartController>()
                                : Get.put(CartController());
                            appCtrl.selectedIndex == 2
                                ? {
                                    wishlistCtrl.addToWishlist(
                                        product),
                                    cartCtrl.removeToCart(
                                        product,key: keyVal)
                                  }
                                : {
                                    productCtrl.addProductToCart(
                                      context: context,
                                        data: wishlistCtrl.wishlist[index!]),
                                    wishlistCtrl.removeToWishlist(
                                        wishlistCtrl.wishlist[index!])
                                  };
                            appCtrl.isShimmer = true;
                            appCtrl.goToHome();
                            Get.offAllNamed(routeName.dashboard);
                            await Future.delayed(DurationClass.s1);
                            appCtrl.isShimmer = false;
                            Get.forceAppUpdate();
                          }),
                          child: LatoFontStyle(
                              text: text == CommonTextFont().moveToWishList
                                  ? CommonTextFont()
                                      .moveToWishList
                                      .toUpperCase()
                                  : CommonTextFont().addToCart.toUpperCase(),
                              fontWeight: FontWeight.w600,
                              fontSize: FontSizes.f14)),
                      VerticalDivider(
                        color: appCtrl.appTheme.greyLight25,
                      ),
                      GestureDetector(
                        onTap: () async {
                          log(" appCtrl.selectedIndex == 2 : ${ appCtrl.selectedIndex == 2}");
                          final wishlistCtrl =
                              Get.isRegistered<WishlistController>()
                                  ? Get.find<WishlistController>()
                                  : Get.put(WishlistController());
                          final cartCtrl = Get.isRegistered<CartController>()
                              ? Get.find<CartController>()
                              : Get.put(CartController());
                          appCtrl.selectedIndex == 2
                              ? {
                                  cartCtrl.removeToCart(
                                      product,key: keyVal),
                                }
                              : wishlistCtrl.removeToWishlist(
                                  wishlistCtrl.wishlist[index!]);
                          Get.back();
                          appCtrl.isShimmer = true;
                          await Future.delayed(DurationClass.s1);
                          appCtrl.isShimmer = false;

                          Get.forceAppUpdate();
                        },
                        child: LatoFontStyle(
                            text: CommonTextFont().remove.toUpperCase(),
                            fontWeight: FontWeight.w600,
                            color: appCtrl.appTheme.primary,
                            fontSize: FontSizes.f14),
                      )
                    ]),
              ))
        ],
      ).height(AppScreenUtil().screenHeight(150));
    });
  }
}
