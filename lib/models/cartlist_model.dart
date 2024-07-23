class HomeDealOfTheDayModel {
  String? name;
  String? image;
  String? byWhom;
  String? discount;
  bool? isFav;
  double? mrp;
  double? totalPrice;
  bool? isTrending;

  HomeDealOfTheDayModel(
      {this.name,
      this.image,
      this.byWhom,
      this.discount,
      this.isFav,
      this.mrp,
      this.totalPrice,
      this.isTrending});

  HomeDealOfTheDayModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    byWhom = json['byWhom'];
    discount = json['discount'];
    isFav = json['isFav'];
    mrp = json['mrp'];
    totalPrice = json['totalPrice'];
    isTrending = json['isTrending'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['byWhom'] = byWhom;
    data['discount'] = discount;
    data['isFav'] = isFav;
    data['mrp'] = mrp;
    data['totalPrice'] = totalPrice;
    data['isTrending'] = isTrending;
    return data;
  }
}
