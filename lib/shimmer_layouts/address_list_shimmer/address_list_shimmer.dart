import 'package:multikart/shimmer_layouts/address_list_shimmer/address_card_shimmer.dart';

import '../../config.dart';

class AddressListShimmer extends StatelessWidget {
  const AddressListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Shimmer.fromColors(
        baseColor: appCtrl.appTheme.greyLight25,
        highlightColor: appCtrl.appTheme.gray,
        child: Column(
          children: <Widget>[
            for (int i = 0; i < 3; i++) const AddressCardShimmer()
          ],
        ),
      );
    });
  }
}
