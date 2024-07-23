
import '../../../../config.dart';

class OrderSuccessBottom extends StatelessWidget {
  const OrderSuccessBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return BottomLayout(
          firstButtonText: OrderSuccessFont().trackOrder,
          firstTap: () => Get.offNamed(routeName.orderDetail),
          secondTap: () async {

            Get.offAllNamed(routeName.dashboard);
            appCtrl.storage.remove(Session.cart);

            final cartCtrl = Get.isRegistered<CartController>() ? Get.find<CartController>() :Get.put(CartController());
            cartCtrl.onReady();
            appCtrl.goToHome();
            appCtrl.isShimmer = true;
            await Future.delayed(DurationClass.s1);
            appCtrl.isShimmer = false;

            Get.forceAppUpdate();
          },
          secondButtonText: OrderSuccessFont().continueShopping);
    });
  }
}
