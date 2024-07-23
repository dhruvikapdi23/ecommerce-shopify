import 'package:multikart/controllers/home_product_controllers/wishlist_controller.dart';
import 'package:multikart/views/bottom_navigate_page/wishlist/widget_layouts/wish_list_card.dart';

import '../../../config.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final wishListCtrl = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<WishlistController>(builder: (_) {
        return wishListCtrl.appCtrl.isShimmer
            ? const WishListShimmer()
            : wishListCtrl.wishlist.isNotEmpty
                ? ListView.builder(
                    itemCount: wishListCtrl.wishlist.length,
                    itemBuilder: (context, index) {
                      return WishListCard(
                        homeDealOfTheDayModel: wishListCtrl.wishlist[index],
                        index: index,
                        lastIndex: wishListCtrl.wishlist.length - 1,
                        firstActionTap: () => wishListCtrl.bottomSheetLayout(
                            CommonTextFont().addToCart, index),
                        secondActionTap: () => wishListCtrl.bottomSheetLayout(
                            CommonTextFont().remove, index),
                      );
                    },
                  )
                : const EmptyCart();
      }),
    );
  }
}
