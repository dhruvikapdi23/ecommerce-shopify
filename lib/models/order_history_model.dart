import '../config.dart';

class OrderHistoryModel {
  String? orderDay;
  List<DaysWiseList>? daysWiseList;

  OrderHistoryModel({this.orderDay, this.daysWiseList});

  OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    orderDay = json['orderDay'];
    if (json['daysWiseList'] != null) {
      daysWiseList = <DaysWiseList>[];
      json['daysWiseList'].forEach((v) {
        daysWiseList!.add(DaysWiseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderDay'] = orderDay;
    if (daysWiseList != null) {
      data['daysWiseList'] = daysWiseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

