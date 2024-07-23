import 'dart:collection';
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:multikart/shopify/models/product_addons.dart';

import '../models/product_attribute.dart';
import '../models/product_variation.dart';
import '../services/shopify_service.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;

mixin VariantMixin {
  ProductVariation? updateVariation(
    List<ProductVariation> variations,
    Map<String?, String?> mapAttribute,
  ) {
    final templateVariation =
        variations.isNotEmpty ? variations.first.attributes : null;
    final listAttributes = variations.map((e) => e.attributes);

    ProductVariation productVariation;
    var attributeString = '';

    /// Flat attribute
    /// Example attribute = { "color": "RED", "SIZE" : "S", "Height": "Short" }
    /// => "colorRedsizeSHeightShort"
    templateVariation?.forEach((element) {
      final key = element.name;
      final value = mapAttribute[key];
      log("key : $key");
      log("element : $element");
      log("mapAttribute : $mapAttribute");
      log("value : $value");
      attributeString += value != null ? '$key$value' : '';
    });

    /// Find attributeS contain attribute selected
    final validAttribute = listAttributes.lastWhereOrNull(
      (attributes) {
        log("message : $attributes");
        return attributes
            .map((e) => e.toString())
            .join()
            .contains(attributeString);
      },
    );

    if (validAttribute == null) return null;

    /// Find ProductVariation contain attribute selected
    /// Compare address because use reference
    productVariation =
        variations.lastWhere((element) => element.attributes == validAttribute);

    for (var element in productVariation.attributes) {
      if (!mapAttribute.containsKey(element.name)) {
        mapAttribute[element.name!] = element.option!;
      }
    }
    return productVariation;
  }

  Future<void> getProductVariations({
    BuildContext? context,
    product_model.Product? product,
    void Function({
      product_model.Product? productInfo,
      List<ProductVariation>? variations,
      Map<String?, String?> mapAttribute,
      ProductVariation? variation,
    })?
        onLoad,
  }) async {
    if (product!.attributes!.isEmpty) {
      return;
    }

    Map<String?, String?> mapAttribute = HashMap();
    List<ProductVariation>? variations = <ProductVariation>[];
    product_model.Product? productInfo;

    variations = await ShopifyService().getProductVariations(product);

    if (variations!.isEmpty) {
      for (var attr in product.attributes!) {
        mapAttribute.update(attr.name, (value) => attr.options![0],
            ifAbsent: () => attr.options![0]);
      }
    } else {
      for (var variant in variations) {
        if (variant.price == product.price) {
          for (var attribute in variant.attributes) {
            for (var attr in product.attributes!) {
              mapAttribute.update(attr.name, (value) => attr.options![0],
                  ifAbsent: () => attr.options![0]);
            }
            mapAttribute.update(attribute.name, (value) => attribute.option,
                ifAbsent: () => attribute.option);
          }
          break;
        }
        if (mapAttribute.isEmpty) {
          for (var attribute in product.attributes!) {
            mapAttribute.update(attribute.name, (value) => value, ifAbsent: () {
              return attribute.options![0]['value'];
            });
          }
        }
      }
    }

    final productVariation = updateVariation(variations, mapAttribute);

    onLoad!(
      productInfo: productInfo,
      variations: variations,
      mapAttribute: mapAttribute,
      variation: productVariation,
    );

    return;
  }

  Future<void> getProductAddons({
    required BuildContext? context,
    required product_model.Product product,
    required Function(
            {product_model.Product? productInfo,
            required Map<String, Map<String, AddonsOption>> selectedOptions})
        onLoad,
    required Map<String, Map<String, AddonsOption>> selectedOptions,
  }) async {}

  void onSelectProductVariant({
    required ProductAttribute attr,
    String? val,
    required List<ProductVariation> variations,
    required Map<String?, String?> mapAttribute,
    required Function onFinish,
  }) {
    try {
      mapAttribute.update(attr.name, (value) => val.toString(),
          ifAbsent: () => val.toString());

      if (!isValidProductVariation(variations, mapAttribute)) {
        /// Reset other choices
        mapAttribute.clear();
        mapAttribute[attr.name] = val.toString();
      }

      final productVariation = updateVariation(variations, mapAttribute);

      onFinish(mapAttribute, productVariation);
    } catch (e, trace) {
      log("trace : $trace");
    }
  }

  bool isValidProductVariation(
      List<ProductVariation> variations, Map<String?, String?> mapAttribute) {
    for (var variation in variations) {
      if (variation.hasSameAttributes(mapAttribute)) {
        /// Hide out of stock variation
        if (!variation.inStock!) {
          return false;
        }
        return true;
      }
    }
    return false;
  }
}
