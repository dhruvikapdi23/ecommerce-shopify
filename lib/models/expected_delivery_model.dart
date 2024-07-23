class ExpectedDelivery {
  String? image;
  String? name;
  String? date;

  ExpectedDelivery({this.image, this.name, this.date});

  ExpectedDelivery.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['date'] = date;
    return data;
  }
}