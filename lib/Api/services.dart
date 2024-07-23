import 'package:multikart/Api/firebase_service.dart';
import 'package:multikart/shopify/mixin/shopify_mixin.dart';

class Services  {
  static final Services _instance = Services._internal();
  factory Services() => _instance;
  Services._internal();
  /// using BaseFirebaseServices when disable the Firebase
  // final firebase = BaseFirebaseServices();
  final firebase = FirebaseServices();
}
