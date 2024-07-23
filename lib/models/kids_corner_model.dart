class HomeKidsCornerModel {
  String? name;
  String? image;
  String? categoryId;
  String? mrp;
  String? totalPrice;
  String? discount;
  bool? isFav;
  double? rating;

  HomeKidsCornerModel({required this.name, this.image,this.categoryId,this.totalPrice,this.mrp,this.discount,this.isFav,this.rating});

  factory HomeKidsCornerModel.fromJson(Map<dynamic, dynamic> json) {
    return HomeKidsCornerModel(
      name: json['name'] as String?,
      image: json['image'] as String?,
      categoryId: json['categoryId'] as String?,
      totalPrice: json['totalPrice'] as String?,
      mrp: json['mrp'] as String?,
      discount: json['discount'] as String?,
      isFav: json['isFav'] as bool?,
      rating: json['rating'] as double?,
    );
  }
}
