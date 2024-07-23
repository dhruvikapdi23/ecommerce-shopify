import 'package:multikart/Api/base_firebase_services.dart';
import 'package:multikart/Api/dynamic_link_service.dart';

class FirebaseServices extends BaseFirebaseServices {
  @override
  void shareDynamicLinkProduct({itemUrl}) {
    DynamicLinkService().shareProductLink(
      productUrl: itemUrl,
    );
  }
}