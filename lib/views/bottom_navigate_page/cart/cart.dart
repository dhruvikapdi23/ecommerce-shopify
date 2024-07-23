import 'package:multikart/utilities/storage_utils.dart';

import '../../../config.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartCtrl = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (_) {
      return Directionality(
        textDirection:
            cartCtrl.appCtrl.isRTL || cartCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: Scaffold(
            body: cartCtrl.appCtrl.isShimmer
                ? const CartShimmer()
                : cartCtrl.productsInCart.isNotEmpty
                    ? Stack(children: [
                        const SingleChildScrollView(child: CartBody()),
                        if (cartCtrl.productsInCart.isNotEmpty)
                          CartBottomLayout(
                              desc: CartFont().totalAmount,
                              buttonName: CartFont().checkout,
                              totalAmount: cartCtrl.getTotalAmount().toString(),
                              onTap: () {
                                getStorage(Session.userInfo) != null
                                    ? {
                                        cartCtrl.appCtrl.isHeart = false,
                                        cartCtrl.update(),
                                        Get.toNamed(routeName.deliveryDetail,
                                            arguments: cartCtrl.getSubTotal())
                                      }
                                    : Get.toNamed(routeName.login);
                              }).alignment(Alignment.bottomCenter)
                      ])
                    : const EmptyCart()),
      );
    });
  }
}
