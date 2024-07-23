class DaysWiseList {
  String? image;
  String? name;
  String? size;
  int? qty;
  String? date;
  String? deliveryStatus;
  String? status;

  DaysWiseList(
      {this.image,
        this.name,
        this.size,
        this.qty,
        this.date,
        this.deliveryStatus,
        this.status});

  DaysWiseList.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    size = json['size'];
    qty = json['qty'];
    date = json['date'];
    deliveryStatus = json['deliveryStatus'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['size'] = size;
    data['qty'] = qty;
    data['date'] = date;
    data['deliveryStatus'] = deliveryStatus;
    data['status'] = status;
    return data;
  }
}