class OnBoardingModel {
  String? title;
  String? image;
  String? description;

  OnBoardingModel({required this.title, this.image,this.description});

  factory OnBoardingModel.fromJson(Map<String, dynamic> json) {
    return OnBoardingModel(
      title: json['title'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
    );
  }
}
