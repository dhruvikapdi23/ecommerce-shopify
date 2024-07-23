import 'package:multikart/shopify/models/address.dart';

import '../../config.dart';

class AddressLayout extends StatelessWidget {
  final Address? addressList;
  final int? index;
  final int? selectRadio;
  final GestureTapCallback? onTap;
  const AddressLayout(
      {Key? key, this.selectRadio, this.onTap, this.index, this.addressList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeliveryDetailWidgets()
        .deliveryAddressLayout(
            child: AddressListCard(
              addressList: addressList,
              index: index,
              selectRadio: selectRadio,
              onTap: onTap,
            ),
            index: index,
            selectRadio: selectRadio)
        .gestures(onTap: onTap);
  }
}
