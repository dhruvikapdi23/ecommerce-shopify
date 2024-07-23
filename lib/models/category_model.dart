import '../config.dart';

class CategoryModel {
  String? title;
  String? image;
  String? description;
  Color? bgColor;

  CategoryModel({required this.title, this.image,this.description,this.bgColor});

  factory CategoryModel.fromJson(Map<dynamic, dynamic> json) {
    return CategoryModel(
      title: json['title'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      bgColor: json['bgColor'] as Color?,
    );
  }
}
