import '../config.dart';



class DeliveryDetailModel {
  List<AddressList>? addressList;
  List<ExpectedDelivery>? expectedDelivery;

  DeliveryDetailModel({this.addressList, this.expectedDelivery});

  DeliveryDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['addressList'] != null) {
      addressList = <AddressList>[];
      json['addressList'].forEach((v) {
        addressList!.add(AddressList.fromJson(v));
      });
    }
    if (json['expectedDelivery'] != null) {
      expectedDelivery = <ExpectedDelivery>[];
      json['expectedDelivery'].forEach((v) {
        expectedDelivery!.add(ExpectedDelivery.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (addressList != null) {
      data['addressList'] = addressList!.map((v) => v.toJson()).toList();
    }
    if (expectedDelivery != null) {
      data['expectedDelivery'] =
          expectedDelivery!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
