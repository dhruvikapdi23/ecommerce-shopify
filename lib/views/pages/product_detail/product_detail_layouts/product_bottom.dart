import 'package:multikart/controllers/home_product_controllers/wishlist_controller.dart';
import '../../../../config.dart';

class ProductBottom extends StatelessWidget {
  final ProductDetailController? productCtrl;

  const ProductBottom({Key? key, this.productCtrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishlistController>(builder: (wishlistCtrl) {
      return GetBuilder<AppController>(builder: (appCtrl) {
        return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
                vertical: AppScreenUtil().screenHeight(12),
                horizontal: AppScreenUtil().screenWidth(15)),
            decoration:
                BoxDecoration(color: appCtrl.appTheme.whiteColor, boxShadow: [
              BoxShadow(
                  color: appCtrl.appTheme.lightGray,
                  spreadRadius: 10,
                  blurRadius: 5,
                  offset: const Offset(0, 7) // changes position of shadow
                  )
            ]),
            child: productCtrl!.product != null
                ? IntrinsicHeight(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        InkWell(
                            onTap: () async {
                              productCtrl!.product!.isFav = true;
                              wishlistCtrl.addToWishlist(productCtrl!.product);
                              snackBar(ProductDetailFont().itemAdded.tr);
                            },
                            child: Row(children: [
                              productCtrl!.product!.isFav
                                  ? const HeartColor()
                                  : HeartIcon(
                                      color: appCtrl.appTheme.blackColor),
                              const Space(10, 0),
                              LatoFontStyle(
                                  text: ProductDetailFont().wishList,
                                  fontWeight: FontWeight.w600,
                                  fontSize: FontSizes.f14)
                            ])),
                        VerticalDivider(color: appCtrl.appTheme.greyLight25),
                        InkWell(
                            onTap: () async {
                              productCtrl!.addProductToCart(
                                  data: productCtrl!.product, context: context);
                              Get.forceAppUpdate();
                            },
                            child: Row(children: [
                              productCtrl!.product!.inStock!
                                  ? BuyIcon(
                                      color: appCtrl.appTheme.primary,
                                      isIconShow: false,
                                    )
                                  : Container(),
                              const Space(10, 0),
                              LatoFontStyle(
                                  text: productCtrl!.product!.inStock!
                                      ? ProductDetailFont().addToBag
                                      : HomeFont().outStock.toUpperCase(),
                                  fontWeight: FontWeight.w600,
                                  color: appCtrl.appTheme.primary,
                                  fontSize: FontSizes.f14)
                            ]))
                      ]))
                : Container());
      });
    });
  }
}
