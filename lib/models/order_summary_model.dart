class OrderSummaryModel {
  String? name;
  String? image;
  String? size;
  int? qty;
  double? price;

  OrderSummaryModel({this.name, this.image, this.size, this.qty, this.price});

  OrderSummaryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    size = json['size'];
    qty = json['qty'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['size'] = size;
    data['qty'] = qty;
    data['price'] = price;
    return data;
  }
}