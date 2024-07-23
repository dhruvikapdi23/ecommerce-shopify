import 'dart:developer';

import 'package:multikart/shopify/mixin/shopify_mixin.dart';
import 'package:multikart/shopify/mixin/variant_mixin.dart';
import 'package:multikart/shopify/models/product_attribute.dart';
import 'package:multikart/shopify/models/product_variation.dart';

import '../../config.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;

class ProductDetailController extends GetxController
    with ShopifyMixin, VariantMixin {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  TextEditingController controller = TextEditingController();
  product_model.Product? product;
  TextEditingController txtQuantity = TextEditingController();
  List<Images> imagesList = [];
  int current = 0;
  List reviewList = [];
  int currentLast = 0;
  bool isNotData = false;
  int selectedColor = 0;
  int selectedSize = 0;
  bool isCartPage = false;
  final CarouselController sliderController = CarouselController();
  List<product_model.Product> similarList = [];
  int colorSelected = 1;
  String? id;
  bool isLoading = true;
  ProductVariation? selectedVariation;
  Map<String?, String?>? mapAttribute;
  dynamic regularPrice;
  bool onSale = false;
  ProductVariation? productVariation;
  int sale = 100;
  dynamic price;
  String? dateOnSaleTo;

  @override
  void onInit() async {
    // TODO: implement onInit
    txtQuantity.text = "1";
    super.onInit();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    if (Get.arguments != null) {
      if (Get.arguments.runtimeType.toString() == "Product") {
        product = Get.arguments;
        id = product!.id;
      } else {
        product = await shopifyService.getProduct(Get.arguments);
        id = Get.arguments;
      }
      await loadProductVariations(product);
    } else {
      isLoading = false;
      Get.back();
    }
    update();
    super.onReady();
  }

  //get product variants
  Future<void> loadProductVariations(product) async {
    try {
      await getProductVariations(
          context: Get.context,
          product: product,
          onLoad: ({
            product_model.Product? productInfo,
            List<ProductVariation>? variations,
            Map<String?, String?>? mapAttribute,
            ProductVariation? variation,
          }) {
            if (productInfo != null) {
              this.product = productInfo;
            }
            this.mapAttribute = mapAttribute ?? {};
            selectedVariation = variation;
            getProductPrice();
          });
    } on Exception catch (e) {
      isLoading = false;
      log("errr : $e");
      Get.back();
    }
  }

  //on tap product variants
  void onSelectProductVariantClick({
    ProductAttribute? attr,
    String? val,
    List<ProductVariation>? variations,
    Map<String?, String?>? mapAttribute,
    Function? onFinish,
  }) {
    onSelectProductVariant(
      attr: attr!,
      val: val,
      variations: variations!,
      mapAttribute: mapAttribute!,
      onFinish:
          (Map<String?, String?> mapAttribute, ProductVariation? variation) {
        mapAttribute = mapAttribute;

        update();
        productVariation = variation;
        selectedVariation = variation;
      },
    );
  }

//get price according to product and variants
  getProductPrice() async {
    try {
      regularPrice = selectedVariation != null
          ? selectedVariation!.regularPrice
          : product!.regularPrice;
      onSale = selectedVariation != null
          ? selectedVariation!.onSale ?? false
          : product!.onSale ?? false;
      price = selectedVariation != null &&
              (selectedVariation?.price?.isNotEmpty ?? false)
          ? selectedVariation!.price
          : isNotBlank(product!.price)
              ? product!.price
              : product!.regularPrice;

      /// update the Sale price
      if (onSale) {
        price = selectedVariation != null
            ? selectedVariation!.salePrice
            : isNotBlank(product!.salePrice)
                ? product!.salePrice
                : product!.price;
        dateOnSaleTo = selectedVariation != null
            ? selectedVariation!.dateOnSaleTo
            : product!.dateOnSaleTo;
      }
      if (onSale && regularPrice.isNotEmpty && double.parse(regularPrice) > 0) {
        sale = (100 - (double.parse(price!) / double.parse(regularPrice)) * 100)
            .toInt();
      }
      isLoading = false;
      List<product_model.Product> data =
          await shopifyService.getAllProduct() ?? [];
      similarList = data;
      // similarList = [];
      // // final isExist = data.indexWhere((item) => item!.id == product!.id) != -1;
      // for (var attr in data)
      //   for (var item in attr.attributes!) {
      //     item.name == 'Color' ? log("COLOR${item.name}") : log("ERROR");
      //   }
      update();
    } catch (e, trace) {
      log("trace : $trace");
    }
  }

  //on quantity increase
  quantityIncrease() {
    int quantity = int.parse(txtQuantity.text);
    quantity++;
    txtQuantity.text = quantity.toString();
    update();
  }

// ITEM ADDED IN CART
  void addProductToCart(
      {product_model.Product? data, newQuantity, context}) async {
    checkAddedItemToCart(data, newQuantity: newQuantity, context: context);
  }

// CHECK ADDED AND ITEM AND ADD ITEM IN CART
  checkAddedItemToCart(data, {newQuantity, context}) async {
    final cartCtrl = Get.isRegistered<CartController>()
        ? Get.find<CartController>()
        : Get.put(CartController());
    if (data != null) {
      await loadProductVariations(data);
    }
    cartCtrl.addToCard(
      context: context,
      product: data ?? product,
      variation: selectedVariation,
      quantity: newQuantity ??
          int.parse(txtQuantity.text.isNotEmpty ? txtQuantity.text : '1'),
      isSaveLocal: true,
      mapAttribute: mapAttribute,
    );
    update();
  }

  //on quantity decrease
  quantityDecrease() {
    int quantity = int.parse(txtQuantity.text);
    if (quantity > 1) {
      quantity--;
      txtQuantity.text = quantity.toString();
    }
    update();
  }
}
