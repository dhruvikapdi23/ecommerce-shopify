class Images {
  String? image;
  int? colorId;

  Images({this.image,this.colorId});

  Images.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    colorId = json['colorId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['colorId'] = colorId;
    return data;
  }
}