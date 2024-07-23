import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:multikart/shopify/models/variable_attribute.dart';

import 'product_attribute.dart';

class ProductVariation {
  String? id;
  String? productId;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  String? dateOnSaleFrom;
  String? dateOnSaleTo;
  String? stockStatus;
  String? description;
  bool manageStock = false;
  bool? onSale;
  bool? inStock;
  int? stockQuantity;
  bool? backordersAllowed = false;
  String? imageFeature;
  List<Attribute> attributes = [];
  Map<String?, Attribute> attributeMap = {};
  bool isActive = true;

  List<VariableAttribute>? attributeList;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProductVariation && listEquals(other.attributeList, attributeList);
  }

  @override
  int get hashCode {
    return attributeList.hashCode;
  }

  ProductVariation copyWith({
    String? id,
    String? productId,
    String? stockStatus,
    int? stockQuantity,
    bool? backordersAllowed,
    List<VariableAttribute>? attributeList,
    String? price,
    String? salePrice,
    String? imageFeature,
    String? regularPrice,
  }) {
    return ProductVariation(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      stockStatus: stockStatus ?? this.stockStatus,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      backordersAllowed: backordersAllowed ?? this.backordersAllowed,
      attributeList: attributeList ?? this.attributeList,
      price: price ?? this.price,
      regularPrice: regularPrice ?? this.regularPrice,
      salePrice: salePrice ?? this.salePrice,
      imageFeature: imageFeature ?? this.imageFeature,
    );
  }

  ProductVariation({
    this.id,
    this.productId,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.dateOnSaleFrom,
    this.dateOnSaleTo,
    this.onSale,
    this.inStock,
    this.stockQuantity,
    this.backordersAllowed = false,
    this.imageFeature,
    this.attributeList,
    this.stockStatus,
  });

  ProductVariation.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'].toString();
    productId = parsedJson['product_id'].toString();
    price = parsedJson['price'].toString();
    regularPrice = parsedJson['regular_price'].toString();
    salePrice = parsedJson['sale_price'].toString();
    dateOnSaleFrom = parsedJson['date_on_sale_from'];
    dateOnSaleTo = parsedJson['date_on_sale_to'];
    onSale = parsedJson['on_sale'] ?? false;
    sku = parsedJson['sku'];
    description = parsedJson['description'] is String ? parsedJson['description'] : '';
    inStock = parsedJson['in_stock'] ?? parsedJson['stock_status'] == 'instock';
    if (parsedJson['manage_stock'] != null) {
      if (parsedJson['manage_stock'] == 'parent') {
        manageStock = inStock ?? false;
      } else {
        manageStock = parsedJson['manage_stock'];
      }
    }

    if (inStock == true) {
      /// parsedJson['manage_stock'] can be true, false, "parent".
      if (manageStock) {
        inStock = parsedJson['stock_quantity'] > 0;
      }
    }
    inStock! ? stockQuantity = parsedJson['stock_quantity'] : stockQuantity = 0;
    backordersAllowed = (parsedJson['backorders_allowed'] ?? false) || ((parsedJson['backorders'] ?? 'no') != 'no');

    /// In case manage stock is disabled,
    /// customers can still purchase if stockstatus is backordered;
    if (!manageStock && !(backordersAllowed ?? false)) {
      backordersAllowed = parsedJson['backordered'] ?? false;
    }

    if (parsedJson['feature_image'] != null) {
      imageFeature = parsedJson['feature_image'];
    } else if (parsedJson['image'] != null) {
      imageFeature = parsedJson['image']['src'];
    }

    stockStatus = parsedJson['stock_status'];
    stockQuantity = parsedJson['stock_quantity'];

    var list = <Attribute>[];
    parsedJson['attributes']?.forEach((item) {
      final attribute = Attribute.fromJson(item);
      list.add(attribute);
      attributeMap[attribute.name] = attribute;
    });
    attributes = list;

    if (parsedJson['attributes_arr'] != null) {
      attributeList = List<VariableAttribute>.from(List<Map<String, dynamic>>.from(parsedJson['attributes_arr']).map(VariableAttribute.fromMap));
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sku': sku,
      'price': price,
      'regularPrice': regularPrice,
      'sale_price': salePrice,
      'date_on_sale_from': dateOnSaleFrom,
      'date_on_sale_to': dateOnSaleTo,
      'on_sale': onSale,
      'in_stock': inStock,
      'stock_quantity': stockQuantity,
      'image': {'src': imageFeature},
      'attributes': attributes.map((item) {
        return item.toJson();
      }).toList()
    };
  }

  ProductVariation.fromLocalJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      sku = json['sku'];
      price = json['price'];
      regularPrice = json['regularPrice'];
      onSale = json['onSale'] ?? false;
      salePrice = json['salePrice'];
      dateOnSaleFrom = json['date_on_sale_from'];
      dateOnSaleTo = json['date_on_sale_to'];
      inStock = json['in_stock'];
      inStock! ? stockQuantity = json['stock_quantity'] : stockQuantity = 0;
      imageFeature = json['image']['src'];
      var attributeList = <Attribute>[];

      if (json['attributes'] != null) {
        for (var item in json['attributes']) {
          final attribute = Attribute.fromLocalJson(item);
          attributeList.add(attribute);
          attributeMap[attribute.name] = attribute;
        }
      }

      attributes = attributeList;
    } catch (e) {
      log(e.toString());
    }
  }

  ProductVariation.fromShopifyJson(Map<String, dynamic> parsedJson) {
    var priceV2 = parsedJson['priceV2'];
    var compareAtPriceV2 = parsedJson['compareAtPriceV2'];
    var compareAtPrice = compareAtPriceV2 != null ? compareAtPriceV2['amount'] : null;

    id = parsedJson['id'];
    price = priceV2 != null ? priceV2['amount'] : null;
    regularPrice = compareAtPrice ?? price;
    onSale = compareAtPrice != null && compareAtPrice != price;
    inStock = parsedJson['availableForSale'];
    salePrice = price;
    stockQuantity = parsedJson['quantityAvailable'];
    if (stockQuantity == null || stockQuantity! <= 0) {
      stockQuantity = 0;
      inStock = false;
    }
    imageFeature = parsedJson['image']['src'];

    var attributeList = <Attribute>[];
    parsedJson['selectedOptions']?.forEach((item) {
      final attribute = Attribute.fromShopifyJson(item);
      attributeList.add(attribute);
      attributeMap[attribute.name] = attribute;
    });
    attributes = attributeList;
  }

  /// Get product ID from mix String productID-ProductVariantID
  static String? cleanProductVariantID(productString) {
    return productString.contains('-') ? productString.split('-')[1] : null;
  }

  /// Return true if [attributeMap] includes [attributes]
  bool hasSameAttributes(Map<String?, String?> attributes) {
    var isSame = true;
    final keys = attributes.keys.toList(growable: false);
    final values = attributes.values.toList(growable: false);
    for (var i = 0; i < attributes.length; i++) {
      if (attributeMap[keys[i]] == null || values[i] == null) {
        /// In case this attribute can be any option, don't need to check.
        continue;
      }
      if (attributeMap[keys[i]]!.option != values[i]) {
        return false;
      }
    }
    return isSame;
  }
}
