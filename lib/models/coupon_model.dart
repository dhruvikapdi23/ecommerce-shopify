class CouponModel {
  String? code;
  String? title;
  String? description;

  CouponModel({this.code, this.title, this.description});

  CouponModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['code'] = code;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}