import 'dart:developer';
import 'package:multikart/shopify/models/address.dart';

getRestIdFromGid(gid) {
  return gid.split("/")[gid.split("/").length - 1];
}

class User {
  String? id;
  bool? loggedIn;
  String? name;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? niceName;
  String? userUrl;
  String? picture;
  String? cookie;
  String? jwtToken;
  bool isVender = false;
  bool isDeliveryBoy = false;
  bool? isSocial = false;
  bool? isDriverAvailable;
  bool isManager = false;
  List<Address> addresses = [];

  User();

  String get fullName =>
      name ?? [firstName ?? '', lastName ?? ''].join(' ').trim();

  ///FluxListing
  String? role;

  User.fromJson(Map<String, dynamic> json) {

    try {
      isSocial = json['isSocial'] ?? false;
      loggedIn = json['loggedIn'];
      id = getRestIdFromGid(json['id']).toString();
      cookie = json['cookie'];
      username = json['username'];
      niceName = json['nicename'];
      firstName = json['firstName'];
      lastName = json['lastName'];
      name = json['displayname'] ??
          json['displayName'] ??
          '${firstName ?? ''}${(lastName?.isEmpty ?? true) ? '' : ' $lastName'}';

      email = json['email'] ?? id;
      userUrl = json['avatar'];
      var list = <Address>[];
      json['addresses']['edges']?.forEach((item) {
        final addresses = Address.fromJson(item['node']);
        list.add(addresses);
      });
      addresses = list;
    } catch (e) {
      log(e.toString());
    }
  }

  User.fromShopifyJson(Map<String, dynamic> json, token) {
    try {
      log('fromShopifyJson user ${json["addresses"]['edges'].length}');

      loggedIn = true;
      id = getRestIdFromGid(json['id']).toString();
      username = '';
      cookie = token;
      firstName = json['firstName'];
      lastName = json['lastName'];
      name = json['displayName'] ?? json['displayname'] ?? _getDisplayName;
      email = json['email'];
      // addresses = json['addresses'];

      var addressesList = <Address>[];
      json['addresses']['edges']?.forEach((item) {
        final attribute = Address.fromShopifyJson(item['node']);
        addressesList.add(attribute);
      });
      addresses = addressesList;

      picture = '';
    } catch (e) {
      log(e.toString());
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'loggedIn': loggedIn,
      'name': name,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'picture': picture,
      'cookie': cookie,
      'nicename': niceName,
      'url': userUrl,
      'isSocial': isSocial,
      'isVender': isVender,
      'jwtToken': jwtToken,
      'role': role,
      'addresses': addresses.map((item) {
        return item.toJson();
      }).toList()
    };
  }

  User.fromLocalJson(Map<String, dynamic> json) {
    try {
      loggedIn = json['loggedIn'];
      id = getRestIdFromGid(json['id']).toString();
      name = json['name'];
      cookie = json['cookie'];
      username = json['username'];
      firstName = json['firstName'];
      lastName = json['lastName'];
      email = json['email'];
      picture = json['picture'];
      niceName = json['nicename'];
      userUrl = json['url'];
      isSocial = json['isSocial'];
      isVender = json['isVender'];
      jwtToken = json['jwtToken'];
      var addressesList = <Address>[];
      if (json['addresses'] != null) {
        for (var item in json['addresses']['edges']) {
          final addresses = Address.fromLocalJson(item['node']);
          addressesList.add(addresses);
        }
      }
      addresses = addressesList;
      role = json['role'];
    } catch (e) {
      log(e.toString());
    }
  }

  // from Create User
  User.fromAuthUser(Map<String, dynamic> json, String? cookieVal) {
    try {
      cookie = cookieVal;
      id = getRestIdFromGid(json['id']).toString();
      name = json['displayname'];
      username = json['username'];
      firstName = json['firstname'];
      lastName = json['lastname'];
      email = json['email'];
      picture = json['avatar'];
      niceName = json['nicename'];
      userUrl = json['url'];
      addresses = json['addresses'];
      loggedIn = true;
      var roles = json['role'] as List;

      isVender = false;
      if (roles.isNotEmpty) {
        role = roles.first;
        if (roles.contains('seller') ||
            roles.contains('wcfm_vendor') ||
            roles.contains('administrator') ||
            roles.contains('owner')) {
          isVender = true;
        }
        if (roles.contains('wcfm_delivery_boy') || roles.contains('driver')) {
          isDeliveryBoy = true;
        }
        isManager =
            roles.contains('shop_manager') || roles.contains('administrator');
      } else {
        isVender = (json['capabilities']['wcfm_vendor'] as bool?) ?? false;
      }
      if (json['dokan_enable_selling'] != null &&
          json['dokan_enable_selling'].trim().isNotEmpty) {
        isVender = json['dokan_enable_selling'] == 'yes';
      }

      if (json['is_driver_available'] != null) {
        isDriverAvailable = json['is_driver_available'] == 'on';
      }
    } catch (e) {
      log(e.toString());
    }
  }

  String get _getDisplayName =>
      '${firstName ?? ''}${(lastName?.isEmpty ?? true) ? '' : ' $lastName'}';

  @override
  String toString() => 'User { username: $id $name $email}';
}

class UserPoints {
  int? points;
  List<UserEvent> events = [];

  UserPoints.fromJson(Map<String, dynamic> json) {
    points = json['points_balance'];

    if (json['events'] != null) {
      for (var event in json['events']) {
        events.add(UserEvent.fromJson(event));
      }
    }
  }
}

class UserEvent {
  String? id;
  String? userId;
  String? orderId;
  String? date;
  String? description;
  String? points;

  UserEvent.fromJson(Map<String, dynamic> json) {
    id = getRestIdFromGid(json['id']);
    userId = json['user_id'];
    orderId = json['order_id'];
    date = json['date_display_human'];
    description = json['description'];
    points = json['points'];
  }
}
