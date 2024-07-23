
import 'package:multikart/config.dart';
import 'package:multikart/controllers/pages_controller/address_list_controller.dart';
import 'package:multikart/widgets/common/address_layout.dart';

class AddressListLayout extends StatelessWidget {
  const AddressListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressListController>(builder: (deliveryDetailCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...deliveryDetailCtrl.deliveryDetail!.asMap().entries.map((e) {
            return AddressLayout(
              selectRadio: deliveryDetailCtrl.selectRadio,
              onTap: () => deliveryDetailCtrl.selectAddress(e.value, e.key),
              index: e.key,
              addressList: e.value,
            );
          }).toList()
        ],
      ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
    });
  }
}
