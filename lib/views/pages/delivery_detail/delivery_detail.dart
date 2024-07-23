
import 'package:multikart/controllers/pages_controller/address_list_controller.dart';

import '../../../config.dart';

class DeliveryDetail extends StatelessWidget {
  final deliveryDetailCtrl = Get.put(AddressListController());

  DeliveryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartCtrl) {
      return GetBuilder<AddressListController>(builder: (_) {
        return Directionality(
          textDirection: deliveryDetailCtrl.appCtrl.isRTL ||
                  deliveryDetailCtrl.appCtrl.languageVal == "ar"
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Scaffold(
            appBar: HomeProductAppBar(
              onTap: () => Get.back(),
              titleChild: CommonAppBarTitle(
                title: DeliveryDetailFont().deliveryDetails,
                desc: DeliveryDetailFont().steps2Of3,
              ),
            ),
            body: deliveryDetailCtrl.appCtrl.isShimmer
                ? const WishListShimmer()
                : Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //address list layout
                            if (deliveryDetailCtrl.deliveryDetail != null)
                              const AddressListLayout(),
                            // //add new address button layout
                            const AddAddressButton(),
                            const Space(0, 30),
                            const BorderLineLayout(),
                            const Space(0, 30),
                          ],
                        ).marginOnly(bottom: AppScreenUtil().screenHeight(80)),
                      ),

                      //proceed to payment and view detail layout
                      if (deliveryDetailCtrl.deliveryDetail != null)
                        CartBottomLayout(
                          desc: CartFont().viewDetail,
                          buttonName: CartFont().review,
                          totalAmount:  cartCtrl.getTotalAmount().toString(),
                          onTap: () {
                            cartCtrl.address = deliveryDetailCtrl.deliveryDetail![
                            deliveryDetailCtrl.selectRadio];
                            cartCtrl.update();
                            Get.toNamed(routeName.payment);
                          },
                        ).alignment(Alignment.bottomCenter)
                    ],
                  ),
          ),
        );
      });
    });
  }
}
