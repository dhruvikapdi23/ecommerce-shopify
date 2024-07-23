import 'dart:developer';

import 'package:multikart/views/bottom_navigate_page/cart/cart_layouts/cart_data_layout.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;
import '../../../../config.dart';

class CartCardLayout extends StatelessWidget {
  final product_model.Product? product;
  final String? keyVal;

  const CartCardLayout({Key? key, this.product, this.keyVal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartCtrl) {
      return Column(children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(alignment: Alignment.topRight, children: [
            ClipRRect(
                borderRadius:
                    BorderRadius.circular(AppScreenUtil().borderRadius(3)),
                child: FadeInImageLayout(
                    image: product!.images[0],
                    fit: BoxFit.contain,
                    height: AppScreenUtil().size(110),
                    width: AppScreenUtil().size(110)))
          ]),
          const Space(10, 0),
          CartDataLayout(
              data: product,
              keyVal: keyVal,
              firstActionTap: () {
                cartCtrl.bottomSheetLayout(CommonTextFont().moveToWishList,
                    cartCtrl.totalCartLength - 1, product);
              },
              onChangeQuantity: (val) {

                var message = cartCtrl.updateQuantity(product!, keyVal!, val);
                log("MESSAGE ::$message");
                if (message.isNotEmpty) {
                  final snackBar = SnackBar(
                      content: Text(message),
                      duration: const Duration(seconds: 1));
                  Future.delayed(
                      const Duration(milliseconds: 300),
                      () =>
                          ScaffoldMessenger.of(context).showSnackBar(snackBar));

                }
              },
              secondActionTap: () => cartCtrl.bottomSheetLayout(
                  CommonTextFont().remove,
                  cartCtrl.totalCartLength - 1,
                  product,
                  keyVal: keyVal))
        ]).marginSymmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(15)),
        const BorderLineLayout()
      ]);
    });
  }
}
