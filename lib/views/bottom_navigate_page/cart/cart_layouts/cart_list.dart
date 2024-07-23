import 'package:multikart/config.dart';
import 'dart:developer';
import 'package:multikart/models/product_shopify_model.dart' as product_model;
import 'package:multikart/views/bottom_navigate_page/cart/cart_layouts/cart_card_layout.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartCtrl) {
      cartCtrl.totalCartLength = 0;
      return cartCtrl.productsInCart.isNotEmpty
          ? Column(
              children: [
                ...cartCtrl.productsInCart.keys.map((e) {
                  log("cc : $e");
                  cartCtrl.totalCartLength++;
                  var productId = product_model.Product.cleanProductID(e);
                  var product = cartCtrl.getProductById(productId);
                  log("product : ${product!.attributes}");
                  return CartCardLayout(product: product,keyVal: e).inkWell(onTap:()=> cartCtrl.appCtrl.goToProductDetail(product));
                })
              ]
          )
          : Container();
    });
  }
}
