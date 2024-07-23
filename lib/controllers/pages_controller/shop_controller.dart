import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:multikart/shopify/mixin/shopify_mixin.dart';
import 'package:multikart/utilities/storage_utils.dart';

import '../../config.dart';
import '../../views/pages/filter/filter.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;

class ShopController extends GetxController with ShopifyMixin {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final filterCtrl = Get.isRegistered<FilterController>()
      ? Get.find<FilterController>()
      : Get.put(FilterController());

  TextEditingController controller = TextEditingController();
  List<product_model.Product> homeShopPageList = [];
  List<CategoryModel> categoryList = [];
  CategoryModel? categoryModel;
  final dashboardCtrl = Get.isRegistered<DashboardController>()
      ? Get.find<DashboardController>()
      : Get.put(DashboardController());
  String name = "";
  final storage = GetStorage();
  String categoryId = '', sortBy = "", query = "";
  bool lowToHigh = false;
  bool atoZ = true;
  static const _pageSize = 20;
  String options = "", size = "";
  double start = 10;
  double end = 50000;
  List selectColor = [];
  List selectSize = [];
  List selectBrand = [];
  var sortList = [
    {"title": "A - Z"},
    {"title": "Z - A"},
    {"title": "Low to High"},
    {"title": "High to Low"},
    {"title": "Latest Date"},
    {"title": "Oldest Date"},
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    appCtrl.isShimmer = true;
    super.onInit();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    name = Get.arguments.runtimeType.toString() == "Category"
        ? Get.arguments.name ?? "All".tr
        : "";
    categoryList = AppArray().categoryList;
    appCtrl.isNotification = true;
    appCtrl.isShimmer = false;
    List<product_model.Product> data =
        await shopifyService.fetchProductsByCategory(
                categoryId: Get.arguments.runtimeType.toString() == "Category"
                    ? Get.arguments.id
                    : Get.arguments,
                page: 1) ??
            [];
    homeShopPageList = data;
    filterCtrl.sizeList = [];
    filterCtrl.colorList = [];

    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < data[i].variations!.length; j++) {
        for (int a = 0; a < data[i].variations![j].attributes.length; a++) {
          if (data[i].variations![j].attributes[a].name == "Color") {
            if (!filterCtrl.colorList
                .contains(data[i].variations![j].attributes[a].option)) {
              filterCtrl.colorList
                  .add(data[i].variations![j].attributes[a].option);
            }
          }
          if (data[i].variations![j].attributes[a].name == "Size") {
            if (!filterCtrl.sizeList
                .contains(data[i].variations![j].attributes[a].option)) {
              filterCtrl.sizeList
                  .add(data[i].variations![j].attributes[a].option);
            }
          }
        }
      }
    }

    appCtrl.update();
    update();
    super.onReady();
  }

  //sorting bottom sheet
  sortSheet() {
    Get.bottomSheet(
      GetBuilder<ShopController>(builder: (shopCtrl) {
        return Wrap(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: AppScreenUtil().screenActualWidth(),
                color: appCtrl.appTheme.primary,
                child: LatoFontStyle(
                  text: "Sort By : ".tr,
                  fontSize: FontSizes.f18,
                  fontWeight: FontWeight.w600,
                  color: appCtrl.appTheme.white,
                ),
              ),
              //Sorting list
              Container(
                margin: const EdgeInsets.only(bottom: Insets.i5),
                padding: const EdgeInsets.fromLTRB(
                    Insets.i10, Insets.i10, Insets.i10, Insets.i10),
                child: GridView.builder(
                  padding: const EdgeInsets.all(Insets.i2),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: sortList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: appCtrl.appTheme.lightGray,
                        borderRadius: BorderRadius.circular(Insets.i10),
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppScreenUtil().screenHeight(5),
                            vertical: AppScreenUtil().screenHeight(5)),
                        child: InkWell(
                          onTap: () => sortListTap(sortList[index]["title"]),
                          child: LatoFontStyle(
                            text: sortList[index]["title"].toString(),
                            fontSize: FontSizes.f14,
                            fontWeight: FontWeight.bold,
                            color: appCtrl.appTheme.darkGray,
                          ),
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: (8 / 3),
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                ),
              )
            ],
          )
        ]);
      }),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  //sort list tap
  sortListTap(data) async {
    if (data == "Latest Date" || data == "Oldest Date") {
      sortBy = "UPDATED_AT";
      if (data == "Latest Date") {
        lowToHigh = false;
      } else {
        lowToHigh = true;
      }
    } else if (data == "Low to High" || data == "High to Low") {
      sortBy = "PRICE";
      if (data == "Low to High") {
        lowToHigh = false;
      } else {
        lowToHigh = true;
      }
    } else {
      sortBy = "TITLE";
      if (data == "A - Z") {
        lowToHigh = false;
      } else {
        lowToHigh = true;
      }
    }
    update();
    await getProduct(0, "", textEditingController: controller);
  }

  //reset
  resetFilter() {
    categoryId = '';
    sortBy = "";
    query = "";
    lowToHigh = false;
    atoZ = true;
    options = "";
    size = "";
    start = 10;
    end = 50000;
    selectColor = [];
    selectSize = [];
    selectBrand = [];
    filterDoneTap();
    update();
  }

  //get product
  getProduct(int pageKey, categoryId,
      {TextEditingController? textEditingController}) async {
    try {
      List<product_model.Product> data = [];
      if (controller.text != "") {
        data = await shopifyService.getAllProduct(
                categoryId: "",
                page: (pageKey / _pageSize).round() + 1,
                search: controller.text,
                sortKey: sortBy,
                query: "title:${controller.text}",
                reverse: lowToHigh,
                limit: _pageSize) ??
            [];
      } else {
        data = await shopifyService.getAllProduct(
                categoryId: "",
                page: (pageKey / _pageSize).round() + 1,
                search: controller.text,
                sortKey: sortBy,
                query: query,
                reverse: lowToHigh,
                limit: _pageSize) ??
            [];
      }
      homeShopPageList = data;
      update();
      appCtrl.update();
    } on Exception catch (e) {
      log("err : $e");
    }
  }

  //filter page route
  Route createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Filter(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  //bottom change
  bottomNavigationChange(val, context) async {
    Get.back();
    dashboardCtrl.bottomNavigationChange(val, context);
  }

  //go back to home page
  goToHomePage() async {
    if (storage.read(Session.selectedIndex) == 1) {
      appCtrl.isNotification = false;
      await storage.write(Session.selectedIndex, 1);
      appCtrl.selectedIndex = 1;
    } else {
      if (name == "All".tr) {
        appCtrl.goToHome();
        await storage.write(Session.selectedIndex, 0);
        appCtrl.selectedIndex = 0;
      } else {
        appCtrl.isNotification = false;
        await storage.write(Session.selectedIndex, 0);
        appCtrl.selectedIndex = 0;
      }
    }
    update();
    appCtrl.update();
    Get.forceAppUpdate();
    Get.back();
  }

  //select color tap
  selectColorTap(selectedColor) {
    if (filterCtrl.selectedColor.isNotEmpty) {
      if (selectColor.contains(selectedColor)) {
        selectColor.removeWhere((element) => element == selectedColor);
        if (selectColor.isEmpty) {
          options = "";
        } else {
          options = options.replaceAll(" OR ${selectedColor.toString()}", "");
        }
      } else {
        selectColor.add(selectedColor);
      }
      if (selectColor.length > 1) {
        options = "$options OR $selectedColor";
      } else if (options != "") {
        options = options;
      } else {
        options = selectedColor;
      }
    } else {
      options = "";
    }
    filterDoneTap();
    update();
  }

  //select size
  selectSizeTap(selectedSize) async {
    if (filterCtrl.selectSize.isNotEmpty) {
      if (selectSize.contains(selectedSize)) {
        selectSize.removeWhere((element) => element == selectedSize);
        if (selectSize.isEmpty) {
          size = "";
        } else {
          size = size.replaceFirst(" OR $selectedSize", "");
        }
      } else {
        selectSize.add(selectedSize);
      }
      if (selectSize.length > 1) {
        size = "$size OR $selectedSize";
      } else if (size != "") {
        size = size;
      } else {
        size = selectedSize;
      }
    } else {
      size = "";
    }
    filterDoneTap();
    update();
  }

  //filter tap
  filterDoneTap() {
    update();
    if (options != "" && size != "" && (start != 10 && end != 50000)) {
      query =
          "variants:{options2:$options} AND variants:{options1:$size} AND variants.price:>${start.ceil().toString()} AND variants.price:<${end.ceil().toString()}";
    } else if (options != "" && (start != 10 || end != 50000)) {
      query =
          "variants:{options2:$options} AND variants.price:>${start.ceil().toString()} AND variants.price:<${end.ceil().toString()}";
    } else if (size != "" && (start != 10 || end != 50000)) {
      query =
          "variants:{options1:$size} AND variants.price:>${start.ceil().toString()} AND variants.price:<${end.ceil().toString()}";
    } else if (options != "" && size != "") {
      query = "variants:{options2:$options} AND variants:{options1:$size}";
    } else if (options != "") {
      query = "variants:{options2:$options}";
      query = "variants:{options2:$options}";
    } else if (size != "") {
      query = "variants:{options1:$size}";
    } else if (start != 10 || end != 50000) {
      query =
          "variants.price:>${start.ceil().toString()} AND variants.price:<${end.ceil().toString()}";
    } else {
      query = "";
    }

    if (options != "" || size != "" || (start != 10 && end != 50000)) {
      getProduct(0, "", textEditingController: controller);
    } else {
      getProduct(0, "", textEditingController: controller);
    }
  }
}
