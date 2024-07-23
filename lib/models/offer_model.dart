class Offer {
  String? title;
  String? desc;
  String? code;

  Offer({this.title, this.desc, this.code});

  Offer.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['desc'] = desc;
    data['code'] = code;
    return data;
  }
}