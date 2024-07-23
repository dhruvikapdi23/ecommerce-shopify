class HomeCategoryModel {
  String? title;
  String? image;

  HomeCategoryModel({required this.title, this.image});

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    return HomeCategoryModel(
      title: json['title'] as String?,
      image: json['image'] as String?,
    );
  }
}
