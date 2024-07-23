import 'dart:developer';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:multikart/config.dart';
import 'package:multikart/shopify/mixin/shopify_mixin.dart';
import 'package:multikart/shopify/services/shopify_service.dart';
import 'package:share_plus/share_plus.dart';

class DynamicLinkService with ShopifyMixin {
  DynamicLinkParameters dynamicLinkParameters({required String url}) {
    return DynamicLinkParameters(
      uriPrefix: environment['firebaseDynamicLinkConfig']['uriPrefix'],
      link: Uri.parse(url),
      androidParameters: AndroidParameters(
          packageName: environment['firebaseDynamicLinkConfig']
              ['androidPackageName'],
          minimumVersion: environment['firebaseDynamicLinkConfig']
              ['androidAppMinimumVersion']),
    );
  }

  Future<Uri> generateFirebaseDynamicLink(DynamicLinkParameters params) async {
    var dynamicLinks = FirebaseDynamicLinks.instance;
    if (environment['firebaseDynamicLinkConfig']['shortDynamicLinkEnable'] ??
        false) {
      var shortDynamicLink = await dynamicLinks.buildShortLink(params);
      return shortDynamicLink.shortUrl;
    } else {
      return await dynamicLinks.buildLink(params);
    }
  }

  static Future<void> handleDynamicLink(
      String url, BuildContext context) async {
    var productUrl = url.split("/")[url.split("/").length - 1].split("?")[0];
    var categoryUrl = url.split("category/");
    try {
      if (url.contains('/product/')) {
        debugPrint('DynamicLinks onLink ${url.contains('/product/')}');
        Get.toNamed(routeName.productDetail, arguments: productUrl);
      } else if (url.contains('/category/')) {
        Get.toNamed(routeName.shopPage, arguments: categoryUrl[1].toString());
      }
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Dynamic Link error: ${err.toString()}'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  /// share product link that contains Dynamic link
  void shareProductLink({
    required String productUrl,
  }) async {
    log("productUrl $productUrl");
    var productParams = dynamicLinkParameters(url: productUrl);
    var firebaseDynamicLink = await generateFirebaseDynamicLink(productParams);
    log("productUrl $firebaseDynamicLink");
    await Share.share(
      firebaseDynamicLink.toString(),
    );
  }
}
