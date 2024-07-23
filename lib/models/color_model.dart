import 'dart:ui';

class ColorModel {
  int? id;
  Color? color;
  bool? isAvailable;

  ColorModel({this.id, this.color, this.isAvailable});

  ColorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'];
    isAvailable = json['isAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['color'] = color;
    data['isAvailable'] = isAvailable;
    return data;
  }
}