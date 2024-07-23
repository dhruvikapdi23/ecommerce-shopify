class SizeModel {
  String? title;
  bool? isAvailable;

  SizeModel({this.title, this.isAvailable});

  SizeModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    isAvailable = json['isAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['isAvailable'] = isAvailable;
    return data;
  }
}