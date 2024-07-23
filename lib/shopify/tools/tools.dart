import 'dart:developer';

import 'package:intl/intl.dart';


class Tools {
  static double? formatDouble(num? value) => value == null ? null : value * 1.0;

  static dynamic getValueByKey(Map<String, dynamic>? json, String? key) {
    if (key == null) return null;
    try {
      List keys = key.split('.');
      Map<String, dynamic>? data = Map<String, dynamic>.from(json!);
      if (keys[0] == '_links') {
        var links = json['listing_data']['_links'] ?? [];
        for (var item in links) {
          if (item['network'] == keys[keys.length - 1]) return item['url'];
        }
      }
      for (var i = 0; i < keys.length - 1; i++) {
        if (data![keys[i]] is Map) {
          data = data[keys[i]];
        } else {
          return null;
        }
      }
      if (data![keys[keys.length - 1]].toString().isEmpty) return null;
      return data[keys[keys.length - 1]];
    } catch (e) {
      log(e.toString());
      return 'Error when mapping $key';
    }
  }

  static String? getTimeWith2Digit(String time) {
    return time.length == 1 ? '0$time' : time;
  }

  static String? convertDateTime(DateTime date) {
    return DateFormat.yMd().add_jm().format(date);
  }

}
