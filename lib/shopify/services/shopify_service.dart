import 'dart:developer';
import 'package:graphql/client.dart';
import 'package:intl/intl.dart';
import 'package:multikart/config.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;
import 'package:multikart/models/category_shopify_model.dart' as category_model;
import 'package:multikart/shopify/models/address.dart';
import 'package:multikart/shopify/models/checkout_cart.dart';
import 'package:multikart/shopify/models/order/order.dart';
import 'package:multikart/shopify/models/payment_settings.dart';
import 'package:multikart/shopify/models/payment_settings_model.dart';
import 'package:multikart/shopify/models/product_variation.dart';
import 'package:multikart/shopify/models/user.dart';
import 'package:multikart/utilities/storage_utils.dart';

import '../../models/shipping_method.dart';
import '../../views/pages/coupons/coupons.dart';
import 'shopify_query.dart';
import 'shopify_storage.dart';

class ShopifyService {
  ShopifyService() : super() {
    client = getClient();
  }

  late GraphQLClient client;

  ShopifyStorage shopifyStorage = ShopifyStorage();

  getRestIdFromGid(gid) {
    return gid.split("/")[gid.split("/").length - 1];
  }

  GraphQLClient getClient() {
    final httpLink =
        HttpLink('${environment["serverConfig"]["domain"]}/api/graphql');
    final authLink = AuthLink(
      headerKey: 'X-Shopify-Storefront-Access-Token',
      getToken: () async => environment["serverConfig"]["accessToken"],
    );
    return GraphQLClient(
      cache: GraphQLCache(),
      link: authLink.concat(httpLink),
    );
  }

  Future<User?> getUserInfo(cookie) async {
    try {
      log('::::request getUserInfo');

      const nRepositories = 50;
      final options = QueryOptions(
          document: gql(ShopifyQuery.getCustomerInfo),
          fetchPolicy: FetchPolicy.networkOnly,
          variables: <String, dynamic>{
            'nRepositories': nRepositories,
            'accessToken': cookie
          });

      final result = await client.query(options);

      log('result ${result.data?['customer']['addresses']}');

      if (result.hasException) {
        log(result.exception.toString());
        throw Exception(result.exception.toString());
      }

      var user = User.fromShopifyJson(result.data?['customer'] ?? {}, cookie);
      if (user.cookie == null) return null;
      return user;
    } catch (e) {
      log('::::getUserInfo shopify error');
      log(e.toString());
      rethrow;
    }
  }

  Future<User?> login({username, password}) async {
    String? accessToken = "";
    try {
      log('::::request login');
      User? userInfo;
      accessToken =
          await createAccessToken(username: username, password: password);
      if (accessToken != "") {
        userInfo = await getUserInfo(accessToken);
        writeStorage(Session.authToken, accessToken);
        log('login $userInfo');
        log('login $accessToken');
      }

      return userInfo;
    } catch (e) {
      log('::::login shopify error');
      log(e.toString());
      Get.snackbar(
        "Alert",
        "Please check your username or password and try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: appCtrl.appTheme.primary,
        borderRadius: 0,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      throw Exception(
          'Please check your username or password and try again. If the problem persists, please contact support!');
    }
  }

  Future<User> createUser({
    String? firstName,
    String? email,
    String? password,
  }) async {
    try {
      log('::::request createUser');

      const nRepositories = 50;
      final options = QueryOptions(
          document: gql(ShopifyQuery.createCustomer),
          variables: <String, dynamic>{
            'nRepositories': nRepositories,
            'input': {
              'firstName': firstName,
              'email': email,
              'password': password,
            }
          });

      final result = await client.query(options);
      if (result.hasException) {
        log(result.exception.toString());
        throw Exception(result.exception.toString());
      }

      final listError =
          List.from(result.data?['customerCreate']?['userErrors'] ?? []);
      if (listError.isNotEmpty) {
        final message = listError.map((e) => e['message']).join(', ');
        throw Exception('$message!');
      }

      log('createUser ${result.data}');

      var userInfo = result.data!['customerCreate']['customer'];
      final token =
          await createAccessToken(username: email, password: password);
      var user = User.fromShopifyJson(userInfo, token);

      return user;
    } catch (e) {
      log('::::createUser shopify error');
      log(e.toString());
      rethrow;
    }
  }

  Future<String?> createAccessToken({username, password}) async {
    try {
      const nRepositories = 50;
      final options = QueryOptions(
          document: gql(ShopifyQuery.createCustomerToken),
          variables: <String, dynamic>{
            'nRepositories': nRepositories,
            'input': {'email': username, 'password': password},
          });

      final result = await client.query(options);

      if (result.hasException) {
        log(result.exception.toString());
        throw Exception(result.exception.toString());
      }
      var json =
          result.data!['customerAccessTokenCreate']['customerAccessToken'];
      log("json['accessToken'] $json");
      return json != null ? json['accessToken'] : "";
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<String> submitForgotPassword(
      {String? forgotPwLink, Map<String, dynamic>? data}) async {
    final options = MutationOptions(
      document: gql(ShopifyQuery.resetPassword),
      variables: {
        'email': data!['email'],
      },
    );
    final result = await client.mutate(options);
    log('result ${result.data}');
    if (result.hasException) {
      log(result.exception.toString());
      throw Exception(result.exception.toString());
    }

    final List? errors = result.data!['customerRecover']['customerUserErrors'];
    const errorCode = 'UNIDENTIFIED_CUSTOMER';
    if (errors?.isNotEmpty ?? false) {
      if (errors!.any((element) => element['code'] == errorCode)) {
        var errorMessage = errors[0]['message'];
        Get.snackbar(
          "Alert",
          errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: appCtrl.appTheme.primary,
          borderRadius: 0,
          margin: const EdgeInsets.all(15),
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
        throw Exception(errorCode);
      }
    } else {
      Get.snackbar(
        "Reset Password",
        "Reset Link has been sent to your register mail",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: appCtrl.appTheme.primary,
        borderRadius: 0,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }

    return '';
  }

  Future<List<category_model.Category>> getCategoriesByCursor(
      {List<category_model.Category>? categories, String? cursor}) async {
    try {
      const nRepositories = 50;
      var variables = <String, dynamic>{'nRepositories': nRepositories};

      log(":::: getCategoriesByCursor cursor : $cursor");

      if (cursor != null) {
        variables['cursor'] = cursor;
      }
      final options = QueryOptions(
        document: gql(ShopifyQuery.readCollections),
        variables: variables,
      );
      final result = await client.query(options);

      if (result.hasException) {
        log(result.exception.toString());
      }

      var list = categories ?? <category_model.Category>[];
      log("message ${result.data!['collections']}");
      for (var item in result.data!['collections']['edges']) {
        var category = item['node'];

        list.add(category_model.Category.fromJsonShopify(category));
      }
      if (result.data?['collections']?['pageInfo']?['hasNextPage'] ?? false) {
        var lastCategory = result.data!['collections']['edges'].last;
        String? cursor = lastCategory['cursor'];
        if (cursor != null) {
          log('::::getCategories shopify by cursor $cursor');
          return await getCategoriesByCursor(categories: list, cursor: cursor);
        }
      }
      return list;
    } catch (e) {
      return categories ?? [];
    }
  }

  Future<List<product_model.Product>?> getAllProduct({
    categoryId,
    tagId,
    page = 1,
    minPrice,
    maxPrice,
    orderBy,
    lang,
    order,
    attribute,
    attributeTerm,
    featured,
    onSale,
    listingLocation,
    userId,
    nextCursor,
    String? include,
    String? search,
    limit,
    sortKey,
    reverse,
    color,
    query,
  }) async {
    log('::::request fetchProductsByCategory with category id $categoryId search:$search');
    log('::::request fetchProductsByCategory with cursor ${shopifyStorage.cursor}');

    /// change category id
    if (page == 1) {
      shopifyStorage.cursor = '';
      shopifyStorage.hasNextPage = true;
    }

    log('fetchProductsByCategory with shopifyStorage ${shopifyStorage.toJson()}');

    try {
      var list = <product_model.Product>[];

      if (!shopifyStorage.hasNextPage!) {
        return list;
      }

      var currentCursor = shopifyStorage.cursor;

      final options = QueryOptions(
        document: gql(ShopifyQuery.getProducts),
        fetchPolicy: FetchPolicy.networkOnly,
        variables: <String, dynamic>{
          'pageSize': limit ?? 20,
          'color': color,
          if (sortKey != "" && sortKey != null) 'sortKey': sortKey ?? "",
          'reverse': reverse,
          'query': query,
          'cursor': currentCursor != '' ? currentCursor : null
        },
      );
      final result = await client.query(options);

      if (result.hasException) {
        log(result.exception.toString());
      }

      var node = result.data?['products'];

      if (node != null) {
        var productResp = node;
        var pageInfo = productResp['pageInfo'];
        var hasNextPage = pageInfo['hasNextPage'];
        var edges = productResp['edges'];

        if (edges.length != 0) {
          var lastItem = edges.last;
          var cursor = lastItem['cursor'];

          // set next cursor
          shopifyStorage.setShopifyStorage(cursor, categoryId, hasNextPage);
        }

        for (var item in edges) {
          var product = item['node'];
          product['categoryId'] = categoryId;

          /// Hide out of stock.
          // if ((hideOutOfStock) && product['availableForSale'] == false) {
          //   continue;
          // }
          list.add(product_model.Product.fromShopify(product));
          //  list.add(product.Product.from);
        }
      }

      return list;
    } catch (e) {
      log('::::fetchProductsByCategory shopify error $e');
      log(e.toString());
      rethrow;
    }
  }

  Future<product_model.Product> getProduct(id, {lang, cursor}) async {
    /// Private id is id has been encrypted by Shopify, which is get via api
    final isPrivateId = int.tryParse(id) == null;
    if (isPrivateId) {
      return getProductByPrivateId(id);
    }
    log('::::request getProduct $id');

    /// Normal id is id the user can see on the admin site, which is not encrypt
    const nRepositories = 50;
    final options = QueryOptions(
      document: gql(ShopifyQuery.getProductById),
      variables: <String, dynamic>{'nRepositories': nRepositories, 'id': id},
    );
    final result = await client.query(options);

    if (result.hasException) {
      log(result.exception.toString());
    }
    List? listData = result.data?['products']?['edges'];
    if (listData != null && listData.isNotEmpty) {
      final productData = listData.first['node'];
      return product_model.Product.fromShopify(productData);
    }
    return product_model.Product();
  }

  Future<product_model.Product> getProductByPrivateId(id) async {
    log('::::request getProductByPrivateId $id');

    const nRepositories = 50;
    final options = QueryOptions(
      document: gql(ShopifyQuery.getProductByPrivateId),
      variables: <String, dynamic>{'nRepositories': nRepositories, 'id': id},
    );
    final result = await client.query(options);

    if (result.hasException) {
      log(result.exception.toString());
    }
    return product_model.Product.fromShopify(result.data!['node']);
  }

  Future<List<product_model.Product>?> fetchProductsByCategory({
    categoryId,
    tagId,
    page = 1,
    minPrice,
    maxPrice,
    orderBy,
    lang,
    order,
    attribute,
    attributeTerm,
    featured,
    onSale,
    listingLocation,
    userId,
    nextCursor,
    String? include,
    String? search,
    limit,
    reverse,
    sortKey,
  }) async {
    log('::::request fetchProductsByCategory with category id $categoryId search:$search');
    log('::::request fetchProductsByCategory with cursor ${shopifyStorage.cursor}');

    /// change category id
    if (page == 1) {
      shopifyStorage.cursor = '';
      shopifyStorage.hasNextPage = true;
    }

    try {
      var list = <product_model.Product>[];

      if (!shopifyStorage.hasNextPage!) {
        return list;
      }

      var currentCursor = shopifyStorage.cursor;

      log(":::: fetchProductsByCategory cursor : $currentCursor");

      const nRepositories = 50;
      final options = QueryOptions(
        document: gql(ShopifyQuery.getProductByCollection),
        fetchPolicy: FetchPolicy.networkOnly,
        variables: <String, dynamic>{
          'nRepositories': nRepositories,
          'categoryId': categoryId,
          'pageSize': limit ?? 20,
          'query': '',
          'sortKey': sortKey,
          'reverse': reverse,
          'cursor': currentCursor != '' ? currentCursor : null
        },
      );
      final result = await client.query(options);

      if (result.hasException) {
        log(result.exception.toString());
      }

      var node = result.data?['node'];

      if (node != null) {
        var productResp = node['products'];
        var pageInfo = productResp['pageInfo'];
        var hasNextPage = pageInfo['hasNextPage'];
        var edges = productResp['edges'];

        if (edges.length != 0) {
          var lastItem = edges.last;
          var cursor = lastItem['cursor'];

          // set next cursor
          shopifyStorage.setShopifyStorage(cursor, categoryId, hasNextPage);
        }

        for (var item in result.data!['node']['products']['edges']) {
          var product = item['node'];
          product['categoryId'] = categoryId;

          /// Hide out of stock.
          if ((hideOutOfStock) && product['availableForSale'] == false) {
            continue;
          }
          list.add(product_model.Product.fromShopify(product));
        }
      }
      return list;
    } catch (e) {
      log('::::fetchProductsByCategory shopify error $e');
      log(e.toString());
      rethrow;
    }
  }

  Future<List<Address>?> customerAddress() async {
    try {
      log('::::request getUserInfo');
      User user = User.fromJson(getStorage(Session.userInfo));
      const nRepositories = 50;
      final options = QueryOptions(
          document: gql(ShopifyQuery.customerAddress),
          fetchPolicy: FetchPolicy.networkOnly,
          variables: <String, dynamic>{
            'nRepositories': nRepositories,
            'customerAccessToken': user.cookie,
          });

      final result = await client.query(options);

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      List<Address> addressList = <Address>[];
      for (var item in result.data!["customer"]["addresses"]["edges"]) {
        var category = item['node'];
        category['id'] = getRestIdFromGid(category['id']);
        addressList.add(Address.fromShopifyJson(category));
      }
      return addressList;
    } catch (e) {
      log('::::getUserInfo shopify error');
      log(e.toString());
      rethrow;
    }
  }

  Future<dynamic> customerAddressCreate(Map<String, dynamic> json) async {
    try {
      log('::::request createUser');
      User user = User.fromJson(getStorage(Session.userInfo));
      const nRepositories = 50;
      final options = QueryOptions(
          document: gql(ShopifyQuery.customerAddressCreate),
          variables: <String, dynamic>{
            'nRepositories': nRepositories,
            "address": json,
            'customerAccessToken': user.cookie
          });

      final result = await client.query(options);

      if (result.hasException) {
        log(result.exception.toString());
        throw Exception(result.exception.toString());
      }

      final listError =
          List.from(result.data?['customerAddressCreate']?['userErrors'] ?? []);
      if (listError.isNotEmpty) {
        final message = listError.map((e) => e['message']).join(', ');
        throw Exception('$message!');
      }

      return result.data;
    } catch (e) {
      log('::::createUser shopify error');
      log(e.toString());
      rethrow;
    }
  }

  Future<List<ProductVariation>?> getProductVariations(
      product_model.Product product,
      {String? lang = 'en'}) async {
    try {
      return product.variations;
    } catch (e) {
      log('::::getProductVariations shopify error');
      rethrow;
    }
  }

  Future? checkoutWithCreditCard(String? vaultId, CartModel cartModel,
      AddressList address, PaymentSettingsModel paymentSettingsModel) {
    return null;
  }

  Future<PaymentSettings>? getPaymentSettings() {
    return null;
  }

  Future updateItemsToCart(CartController cartModel, cookie, address) async {
    try {
      if (cookie != null) {
        var lineItems = [];
        var checkoutId = cartModel.checkout!.id;

        for (var productId in cartModel.productVariationInCart.keys) {
          var variant = cartModel.productVariationInCart[productId]!;
          var productCart = cartModel.productsInCart[productId];

          lineItems.add({'variantId': variant.id, 'quantity': productCart});
        }

        final options = MutationOptions(
          document: gql(ShopifyQuery.updateCheckout),
          variables: <String, dynamic>{
            'lineItems': lineItems,
            'checkoutId': checkoutId,
            'countryCode': null,
          },
        );

        final result = await client.mutate(options);
        print('RESULT : ${result}');

        if (result.hasException) {
          log(result.exception.toString());
          throw Exception(result.exception.toString());
        }

        var checkout = result.data!['checkoutLineItemsReplace']['checkout'];

        /// That case happen when user close and open app again
        if (checkout == null) {
          return await addItemsToCart(cartModel, address);
        }

        final checkoutCart = CheckoutCart.fromJsonShopify(checkout);

        if (checkoutCart.email == null) {
          // start link checkout with user
          //
          final newCheckout = await (checkoutLinkUser(checkout['id'], cookie));
          return CheckoutCart.fromJsonShopify(newCheckout ?? {});
        }

        return checkoutCart;
      } else {
        throw "youNeedToLoginCheckout";
      }
    } catch (err) {
      log('::::updateItemsToCart shopify error');
      log(err.toString());
      rethrow;
    }
  }

  Future addItemsToCart(CartController cartModel, Address? address) async {
    final cookie = getStorage(Session.authToken);
    final userInfo = getStorage(Session.userInfo);
    try {
      if (cookie != null) {
        var lineItems = [];

        for (var productId in cartModel.productVariationInCart.keys) {
          var variant = cartModel.productVariationInCart[productId]!;
          var productCart = cartModel.productsInCart[productId];

          lineItems.add({'variantId': variant.id, 'quantity': productCart});
        }

        final options = MutationOptions(
          document: gql(ShopifyQuery.createCheckout),
          variables: {
            'input': {
              'lineItems': lineItems,
              if (userInfo != null) ...{
                'email': userInfo['email'],
              }
            },
            'langCode': appCtrl.languageVal.toUpperCase(),
            'countryCode': null,
          },
        );

        final result = await client.mutate(options);
        print("RESULT ${result}");

        if (result.hasException) {
          log(result.exception.toString());
          throw Exception(result.exception.toString());
        }

        final checkout = result.data!['checkoutCreate']['checkout'];

        // log("RESULT ${CheckoutCart.fromJsonShopify(checkout)}");

        // start link checkout with user
        // final cookie = userModel.user?.cookie;
        // if (cookie != null) {
        //   final newCheckout = await (checkoutLinkUser(checkout['id'], cookie));
        //   return CheckoutCart.fromJsonShopify(newCheckout ?? {});
        // }

        print("CODE : ${CheckoutCart.fromJsonShopify(checkout)}");

        return CheckoutCart.fromJsonShopify(checkout);

        // String webURL =
        //     await getShippingMethods(address: address, checkoutId: checkoutId);

        // return webURL;
      } else {
        throw ('You need to login to checkout');
      }
    } catch (e) {
      log('::::addItemsToCart shopify error');
      log(e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> checkoutLinkUser(
      String? checkoutId, String? token) async {
    log("token: $token");
    final options = MutationOptions(
      document: gql(ShopifyQuery.checkoutLinkUser),
      variables: {'checkoutId': checkoutId, 'customerAccessToken': token},
    );

    final result = await client.mutate(options);

    if (result.hasException) {
      log('Exception Link User ${result.exception}');
      throw (result.exception.toString());
    }

    final checkoutData = result.data?['checkoutCustomerAssociateV2'];

    if (List.from(checkoutData?['checkoutUserErrors'] ?? []).isNotEmpty) {
      log('checkoutCustomerAssociateV2 ${result.data}');
      // throw (result.data!['checkoutCustomerAssociateV2']['checkoutUserErrors']
      //     .first['message']);
    }
    var checkout = checkoutData?['checkout'];

    return checkout;
  }

  Future<List<ShippingMethod>> getShippingMethods(
      {Address? address, String? checkoutId}) async {
    log("ADDDDD : ${address!.toShopifyJson()['address']}");
    log("checkoutId : $checkoutId");

    try {
      var list = <ShippingMethod>[];
      final options = MutationOptions(
        document: gql(ShopifyQuery.updateShippingAddress),
        variables: {
          'shippingAddress': address.toShopifyJsonWithoutId()['address'],
          'checkoutId': checkoutId
        },
      );

      final result = await client.mutate(options);
      var checkout =
          result.data!['checkoutShippingAddressUpdateV2']['checkout'];
      var availableShippingRates = checkout['availableShippingRates'];

      if (availableShippingRates != null && availableShippingRates['ready']) {
        for (var item in availableShippingRates['shippingRates']) {
          list.add(ShippingMethod.fromShopifyJson(item));
        }
      } else {
        await Future.delayed(const Duration(milliseconds: 500));
        final checkoutData = await getCheckout(checkoutId: checkoutId);
        if (checkoutData != null) {
          for (var item in checkoutData['availableShippingRates']
              ['shippingRates']) {
            list.add(ShippingMethod.fromShopifyJson(item));
          }
        }
      }

      // update checkout
      CheckoutCart.fromJsonShopify(checkout);

      return list;
    } catch (e) {
      log('::::getShippingMethods shopify error');
      log(e.toString());
      rethrow;
    }
  }

  Future getCheckout({String? checkoutId}) async {
    try {
      final options = QueryOptions(
        document: gql(ShopifyQuery.getCheckout),
        variables: {'checkoutId': checkoutId},
      );

      final result = await client.query(options);

      if (result.hasException) {
        log(result.exception.toString());
        throw Exception(result.exception.toString());
      }

      log('getCheckout $result');

      return result.data?['node'];
    } catch (e) {
      log('::::getCheckout shopify error');
      log(e.toString());

      rethrow;
    }
  }

  Future<List<Order>> getMyOrders({
    User? user,
    dynamic cursor,
    String? cartId,
  }) async {
    try {
      const nRepositories = 50;
      final options = QueryOptions(
        document: gql(ShopifyQuery.getOrder),
        variables: <String, dynamic>{
          'nRepositories': nRepositories,
          'customerAccessToken': getStorage(Session.authToken),
          if (cursor != null) 'cursor': cursor,
          'pageSize': 50
        },
      );
      final result = await client.query(options);

      if (result.hasException) {
        log(result.exception.toString());
      }

      var list = <Order>[];
      for (var item in result.data!['customer']['orders']['edges']) {
        var order = item['node'];
        log("order : $order");
        list.add(Order.fromJson(order));
      }

      return list;
    } catch (e) {
      log('::::getMyOrders shopify error');
      log(e.toString());
      return [];
    }
  }

  Future<Order?> getLatestOrder() async {
    try {
      final cookie = getStorage(Session.authToken);
      const nRepositories = 50;
      final options = QueryOptions(
        document: gql(ShopifyQuery.getOrder),
        variables: <String, dynamic>{
          'nRepositories': nRepositories,
          'customerAccessToken': cookie,
          'pageSize': 1
        },
      );
      final result = await client.query(options);

      if (result.hasException) {
        log(result.exception.toString());
      }

      for (var item in result.data!['customer']['orders']['edges']) {
        var order = item['node'];
        return Order.fromJson(order);
      }
    } catch (e) {
      log('::::getLatestOrder shopify error');
      log(e.toString());
      return null;
    }
    return null;
  }

  Future<product_model.Product?> getProductByPermalink(
      String productPermalink) async {
    final handle =
        productPermalink.substring(productPermalink.lastIndexOf('/') + 1);

    const nRepositories = 50;

    log('::::request getProductLINK $handle');
    final options = QueryOptions(
      document: gql(ShopifyQuery.getProductByHandle),
      variables: <String, dynamic>{
        'nRepositories': nRepositories,
        'handle': handle
      },
    );
    final result = await client.query(options);

    log('::::request getProductRESPONSE $result');
    if (result.hasException) {
      log(result.exception.toString());
    }

    final productData = result.data?['productByHandle'];
    return product_model.Product.fromShopify(productData);
  }

  Future<CheckoutCart> applyCoupon(
    CartController cartModel,
    String discountCode,
  ) async {
    try {
      print('applyCoupon ${cartModel.productsInCart}');

      final options = MutationOptions(
        document: gql(ShopifyQuery.applyCoupon),
        variables: {
          'discountCode': discountCode,
          'checkoutId': cartModel.checkout!.id
        },
      );

      final result = await client.mutate(options);

      print('applyCoupon $result');

      if (result.hasException) {
        log(result.exception.toString());
        throw Exception(result.exception.toString());
      }

      var checkout = result.data!['checkoutDiscountCodeApplyV2']['checkout'];

      return CheckoutCart.fromJsonShopify(checkout);
    } catch (e) {
      log('::::applyCoupon shopify error');
      log(e.toString());
      rethrow;
    }
  }

  Future<CheckoutCart> removeCoupon(String? checkoutId) async {
    try {
      final options = MutationOptions(
        document: gql(ShopifyQuery.removeCoupon),
        variables: {
          'checkoutId': checkoutId,
        },
      );

      final result = await client.mutate(options);

      if (result.hasException) {
        log(result.exception.toString());
        throw Exception(result.exception.toString());
      }

      var checkout = result.data!['checkoutDiscountCodeRemove']['checkout'];

      return CheckoutCart.fromJsonShopify(checkout);
    } catch (e) {
      log('::::removeCoupon shopify error');
      log(e.toString());
      rethrow;
    }
  }

  Future updateCheckout({
    String? checkoutId,
    String? note,
    DateTime? deliveryDate,
  }) async {
    var deliveryInfo = [];
    if (deliveryDate != null) {
      final dateFormat = DateFormat("dd MMMM yyyy");
      final dayFormat = DateFormat("EEEE");
      final timeFormat = DateFormat("HH:mm");
      deliveryInfo = [
        {
          'key': 'Delivery Date',
          'value': dateFormat.format(deliveryDate),
        },
        {
          'key': 'Delivery Day',
          'value': dayFormat.format(deliveryDate),
        },
        {
          'key': 'Delivery Time',
          'value': timeFormat.format(deliveryDate),
        },
        // {
        //   'key': 'Date create',
        //   'value': timeFormat.format(DateTime.now()),
        // },
      ];
    }
    final options = MutationOptions(
      document: gql(ShopifyQuery.updateCheckoutAttribute),
      variables: <String, dynamic>{
        'checkoutId': checkoutId,
        'langCode': appCtrl.languageVal.toUpperCase(),
        'input': {
          'note': note,
          if (deliveryDate != null) 'customAttributes': deliveryInfo,
        },
      },
    );

    final result = await client.mutate(options);
    log("RESULT ORDER  : ${result.data}");

    if (result.hasException) {
      log(result.exception.toString());
      throw Exception(result.exception.toString());
    }
  }

  deleteAccount() async {
    log("getStorage(Session.userInfo)['id'] :gid://shopify/Customer/${getStorage(Session.userInfo)['id']}");
    User user = User.fromJson(getStorage(Session.userInfo));
    final options = MutationOptions(
      document: gql('''
      mutation {
        customerDelete(id: "${getStorage(Session.userInfo)['id']}") {
          deletedCustomerId
          userErrors {
            field
            message
          }
        }
      }
    '''),
    );

    final result = await client.mutate(options);
    log("RESULT ORDER  : ${result.data}");

    if (result.hasException) {
      log(result.exception.toString());
      throw Exception(result.exception.toString());
    }

    log("RESULT DAT :${result.data}");
  }
}
