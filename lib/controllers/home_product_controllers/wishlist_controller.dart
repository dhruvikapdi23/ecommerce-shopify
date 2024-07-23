import 'package:get_storage/get_storage.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;
import 'package:multikart/utilities/storage_utils.dart';
import '../../config.dart';

class WishlistController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final storage = GetStorage();
  CartModel? cartModelList;
  List<product_model.Product?> wishlist = [];

  @override
  void onReady() {
    // TODO: implement onReady
    wishlist = [];
    getLocalWishlist();
    update();
    super.onReady();
  }

  //add to wish list
  void addToWishlist(product_model.Product? product) {
    final isExist =
        wishlist.indexWhere((item) => item!.id == product!.id) != -1;
    if (!isExist) {
      wishlist.add(product);
      saveWishlist(wishlist);
      update();
    }
  }

  //remove from wish list
  void removeToWishlist(product_model.Product? product) {
    final isExist =
        wishlist.indexWhere((item) => item!.id == product!.id) != -1;
    if (isExist) {
      wishlist = wishlist.where((item) => item!.id != product!.id).toList();
      saveWishlist(wishlist);
      update();
    }
  }

  //save wishlist in local
  Future<void> saveWishlist(List<product_model.Product?> products) async {
    try {
      writeStorage(Session.wishList, products);
    } catch (_) {}
  }

  //get wish list from local
  Future<void> getLocalWishlist() async {
    try {
      final json = await getStorage(Session.wishList);
      if (json != null) {
        var list = <product_model.Product>[];
        for (var item in json) {
          list.add(product_model.Product?.fromLocalJson(item));
        }
        wishlist = list;
      }
    } catch (_) {}
  }

  //common bottom sheet
  bottomSheetLayout(text, index) {
    Get.bottomSheet(
      CommonBottomSheet(
        text: text,
        index: index,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
    );
  }
}
