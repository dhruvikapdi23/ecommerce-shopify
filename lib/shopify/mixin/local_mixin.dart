import 'dart:developer';

import 'package:multikart/common/config.dart';
import 'package:multikart/shopify/models/product_variation.dart';

import '../../utilities/storage_utils.dart';
import 'cart_mixin.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;

mixin LocalMixin on CartMixin {
  Future<void> saveCartToLocal({
    product_model.Product? product,
    int? quantity = 1,
    ProductVariation? variation,
    Map<String?, dynamic>? options,
  }) async {
    try {
      List items = await getStorage(Session.cart) ?? [];
      if (items.isNotEmpty) {
        items.add({
          'product': product!.toJson(),
          'quantity': quantity,
          'variation': variation != null ? variation.toJson() : 'null',
          'options': options,
        });
      } else {
        items = [
          {
            'product': product!.toJson(),
            'quantity': quantity,
            'variation': variation != null ? variation.toJson() : 'null',
            'options': options,
          }
        ];
      }
      log("storage items ; ${items.length}");
      await writeStorage(Session.cart, items);
    } catch (err) {
      log('[saveCartToLocal] failed: $err');
    }
  }

  String addProductToCart({
    required product_model.Product product,
    int? quantity = 1,
    ProductVariation? variation,
    Map<String, dynamic>? options,
    required Function notify,
    isSaveLocal = true,
  }) {
    var message = '';

    var key = product.id.toString();
    if (variation != null) {
      if (variation.id != null) {
        key += '-${variation.id}';
      }
      if (options != null) {
        for (var option in options.keys) {
          key += '-$option${options[option]}';
        }
      }
    }

    //Check product's quantity before adding to cart
    var total = !productsInCart.containsKey(key)
        ? quantity
        : (productsInCart[key]! + quantity!);
    var stockQuantity =
        variation == null ? product.stockQuantity : variation.stockQuantity;
    //    log(message)('stock is here');
    //    log(message)(product.manageStock);

    if (!product.manageStock) {
      productsInCart[key] = total;
    } else if (total! <= stockQuantity!) {
      if (product.minQuantity == null && product.maxQuantity == null) {
        productsInCart[key] = total;
      } else if (product.minQuantity != null && product.maxQuantity == null) {
        total < product.minQuantity!
            ? message = 'Minimum quantity is ${product.minQuantity}'
            : productsInCart[key] = total;
      } else if (product.minQuantity == null && product.maxQuantity != null) {
        total > product.maxQuantity!
            ? message =
                'You can only purchase ${product.maxQuantity} for this product'
            : productsInCart[key] = total;
      } else if (product.minQuantity != null && product.maxQuantity != null) {
        if (total >= product.minQuantity! && total <= product.maxQuantity!) {
          productsInCart[key] = total;
        } else {
          if (total < product.minQuantity!) {
            message = 'Minimum quantity is ${product.minQuantity}';
          }
          if (total > product.maxQuantity!) {
            message =
                'You can only purchase ${product.maxQuantity} for this product';
          }
        }
      }
    } else {
      message = 'Currently we only have $stockQuantity of this product';
    }

    if (message.isEmpty) {
      item[product.id] = product;
      productVariationInCart[key] = variation;
      productsMetaDataInCart[key] = options;

      if (isSaveLocal) {
        saveCartToLocal(
          product: product,
          quantity: quantity,
          variation: variation,
          options: options,
        );
      }
    }

    log(
        ":::: add to local product : ${product.name}, Varient : ${variation!.price}");

    notify();
    return message;
  }

  Future<void> removeProductLocal(String key) async {
    try {
      List? items = await getStorage(Session.cart);
      if (items != null && items.isNotEmpty) {
        final ids = key.split('-');
        var newItems = [];
        for (var item in items) {
          if (product_model.Product.fromLocalJson(item['product']).id !=
              ids[0]) {
            newItems.add(item);
          }
        }
        await writeStorage(Session.cart, newItems);
      }
    } catch (err) {
      log(err.toString());
    }
  }

  Future<void> updateQuantityCartLocal({String? key, int quantity = 1}) async {
    try {
      List? items = await getStorage(Session.cart);
      var results = [];
      if (items != null && items.isNotEmpty) {
        for (var item in items) {
          final product = product_model.Product.fromLocalJson(item['product']);
          final ids = key!.split('-');
          var variant = '${item['variation']}' != 'null'
              ? ProductVariation.fromLocalJson(item['variation'])
              : null;
          log("product.id : ${product.id}");
          log("ids[0] : ${ids[0]}");
          if ((product.id == ids[0].toString() && ids.length == 1) ||
              (variant != null &&
                  product.id == ids[0].toString() &&
                  // ignore: unrelated_type_equality_checks
                  variant.id == ids[1])) {
            results.add(
              {
                'product': product.toJson(),
                'quantity': quantity,
                'variation': variant,
                'options': item['options']
              },
            );
          } else {
            results.add(item);
          }
        }
      }
      await writeStorage(Session.cart, results);

    } catch (err) {
      log(err.toString());
    }
  }

  Future<void> clearCartLocal() async {
    try {
      await removeSpecificKeyStorage(Session.cart);

    } catch (err) {
      log(err.toString());
    }
  }
}
