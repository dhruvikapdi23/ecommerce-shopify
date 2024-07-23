
import 'package:multikart/controllers/pages_controller/address_list_controller.dart';
import 'package:multikart/shopify/models/address.dart';
import 'package:multikart/views/pages/delivery_detail/delivery_detail_layouts/common_icon.dart';

import '../../../../config.dart';

class AddressListCard extends StatelessWidget {
  final Address? addressList;
  final int? index;
  final int? selectRadio;
  final GestureTapCallback? onTap;

  const AddressListCard(
      {Key? key, this.addressList, this.index, this.selectRadio, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressListController>(builder: (addressListCtrl) {
      return GetBuilder<AppController>(builder: (appCtrl) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRadio(
                          index: index, selectRadio: selectRadio, onTap: onTap),
                      const Space(10, 0),
                      AddressDetail(
                          addressList: addressList!,
                          index: index,
                          selectRadio: selectRadio)
                    ],
                  ),
                ),
                Row(
                  children: [
                    CommonIcon(
                            icon: Icons.edit_sharp,
                            onTap: () => Get.toNamed(routeName.addAddress,
                                arguments:
                                    addressListCtrl.deliveryDetail![index!]))
                        .marginOnly(right: AppScreenUtil().size(4)),
                    CommonIcon(
                      icon: Icons.delete,
                      onTap: (() => addressListCtrl.deleteAddressApi(index)),
                    )
                  ],
                ),
              ],
            ),
          ],
        );
      });
    });
  }
}
