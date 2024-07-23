import 'package:multikart/controllers/common/app_controller.dart';
import 'package:get/get.dart';

var loadingCtrl = Get.find<AppController>();

String trans(String val) {
  if (val.isNotEmpty) {
    return val.tr;
  }
  return val;
}

List arrayFilter(List val) {
  if (val.isNotEmpty) {
    List newArray = [];
    for (int i = 0; i < val.length; i++) {
      if (val[i] != null) {
        newArray.add(val[i]);
      }
    }
    return newArray;
  } else {
    return [];
  }

  //ex : helper.array_filter(data);
}

bool isNotBlank(String? s) => s != null && s.trim().isNotEmpty;

bool isBlank(String? s) => s == null || s.trim().isEmpty;

getSymbol() {
  var priceSymbol = loadingCtrl.priceSymbol;
  return priceSymbol;
}
