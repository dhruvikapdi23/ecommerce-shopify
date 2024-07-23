import 'package:get_storage/get_storage.dart';
import 'package:multikart/common/assets/image_assets.dart';
import 'package:multikart/controllers/home_product_controllers/wishlist_controller.dart';
import 'package:multikart/shopify/mixin/shopify_mixin.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;
import 'package:multikart/models/category_shopify_model.dart' as category_model;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../config.dart';
import 'dart:developer';

class HomeVarient2Controller extends GetxController with ShopifyMixin {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final wishlistCtrl = Get.isRegistered<WishlistController>()
      ? Get.find<WishlistController>()
      : Get.put(WishlistController());

  final storage = GetStorage();
  double loginWidth = 40.0;
  double loginHeight = 40.0;

  TextEditingController searchController = TextEditingController();
  List<category_model.Category> homeCategoryList = [];
  List<HomeBannerModel> bannerList = [];
  List<product_model.Product> dealOfTheDayList = [];
  List findStyleCategory = [];
  List biggestDealBrandList = [];
  List offerCornerList = [];
  List<product_model.Product> findStyleCategoryList = [];
  List<product_model.Product> findStyleCategoryCategoryWiseList = [];
  List homeKidsCornerList = [];
  int current = 0;
  int selectedStyleCategory = 0;
  var staticBanner = ImageAssets().staticBanner;
  final CarouselController controller = CarouselController();
  bool selected = false;
  bool lowToHigh = false;
  String categoryId = '', sortBy = "", query = "";

  @override
  void onReady() async {
    getData();
    getBanner();
    super.onReady();
  }

//get data list
  getData() async {
    appCtrl.isShimmer = true;
    appCtrl.update();
    homeCategoryList = await shopifyService.getCategoriesByCursor();
    // homeCategoryList = AppArray().homeVarient2Category;
    // bannerList = AppArray().homeBanner;
    List<product_model.Product> data =
        await shopifyService.getAllProduct() ?? [];
    dealOfTheDayList = data;
    findStyleCategoryList = data;
    findStyleCategory = AppArray().homeFindStyleCategory;
    biggestDealBrandList = AppArray().biggestDealBrandList;
    // homeKidsCornerList = data;
    homeKidsCornerList = data;
    offerCornerList = AppArray().offerCornerList;
    loginWidth = ScreenUtil().screenWidth;
    loginHeight = 500.w;
    update();
    subCategoryList(0);
    update();
    await Future.delayed(DurationClass.s1);
    appCtrl.isShimmer = false;
    appCtrl.update();
    Get.forceAppUpdate();
  }

  //add to wishlist
  Future<bool?> addToWishList(index, val, data) async {
    dealOfTheDayList[index].isFav = !val;
    if (dealOfTheDayList[index].isFav == false) {
      wishlistCtrl.removeToWishlist(data!);
    } else {
      wishlistCtrl.addToWishlist(data!);
    }
    update();
    return dealOfTheDayList[index].isFav;
  }

  //sub category list by category id
  subCategoryList(index) async {
    loginWidth = 40.0;
    loginHeight = 40.0;

    update();
    await Future.delayed(DurationClass.s1);
    selected = !selected;
    findStyleCategoryCategoryWiseList = [];
    selectedStyleCategory = index;
    update();
    for (var i = 0; i < findStyleCategoryList.length; i++) {
      if (index == 0) {
        if (i < 2) {
          findStyleCategoryCategoryWiseList.add(findStyleCategoryList[i]);
        }
      } else if (index == 1) {
        if (i >= 2 && i < 4) {
          findStyleCategoryCategoryWiseList.add(findStyleCategoryList[i]);
        }
      } else if (index == 2) {
        if (i == 4) {
          findStyleCategoryCategoryWiseList.add(findStyleCategoryList[i]);
        }
      } else if (index == 3) {
        if (i > 4 && i <= 7) {
          findStyleCategoryCategoryWiseList.add(findStyleCategoryList[i]);
        }
      } else if (index == 4) {
        if (i > 7) {
          findStyleCategoryCategoryWiseList.add(findStyleCategoryList[i]);
        }
      }
    }
    loginWidth = ScreenUtil().screenWidth;
    loginHeight = 500.w;
    update();
  }

  //get banner from firebase
  getBanner() async {
    await FirebaseFirestore.instance.collection("banner").get().then((value) {
      log("banner : ${value.docs.length}");
      value.docs.asMap().entries.forEach((element) {
        bannerList.add(HomeBannerModel.fromJson(element.value.data()));
      });
    });
    update();
  }

  //on banner tap
  bannerTap(id) async {
    product_model.Product product = await shopifyService.getProduct(id);
    log("pro : $product");
    appCtrl.goToProductDetail(product);
  }
}
