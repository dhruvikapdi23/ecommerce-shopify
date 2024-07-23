import 'package:multikart/config.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;

class ReviewItemList extends StatelessWidget {
  const ReviewItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartCtrl) {
      return cartCtrl.productsInCart.isNotEmpty
          ? InkWell(
              child: Column(
                children: [
                  ...cartCtrl.productsInCart.keys.map((e) {
                    var productId = product_model.Product.cleanProductID(e);
                    var product = cartCtrl.getProductById(productId);
                    return Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      AppScreenUtil().borderRadius(3)),
                                  child: FadeInImageLayout(
                                      image: product!.images[0],
                                      fit: BoxFit.contain,
                                      height: AppScreenUtil().size(110),
                                      width: AppScreenUtil().size(110))),
                              const Space(10, 0),
                              PaymentMethodCard(
                                  data: product,
                                  isVariantsShow: false,
                                  isActionShow: false,
                                  firstActionTap: () {
                                    cartCtrl.bottomSheetLayout(
                                        CommonTextFont().moveToWishList,
                                        cartCtrl.totalCartLength,product);
                                  },
                                  secondActionTap: () =>
                                      cartCtrl.bottomSheetLayout(
                                          CommonTextFont().remove, cartCtrl.totalCartLength,product))
                                  .alignment(Alignment.center)
                            ]).marginSymmetric(
                            horizontal: AppScreenUtil().screenWidth(15),
                            vertical: AppScreenUtil().screenHeight(15)),
                        const BorderLineLayout()
                      ],
                    );
                  }),
                ],
              ),
            )
          : Container();
    });
  }
}
