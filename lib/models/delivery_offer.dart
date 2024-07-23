class DeliverOfferModel {
  String? title;
  String? description;
  List<DeliveryOffer>? deliveryOffer;

  DeliverOfferModel({this.title, this.description, this.deliveryOffer});

  DeliverOfferModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    if (json['deliveryOffer'] != null) {
      deliveryOffer = <DeliveryOffer>[];
      json['deliveryOffer'].forEach((v) {
        deliveryOffer!.add(DeliveryOffer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    if (deliveryOffer != null) {
      data['deliveryOffer'] =
          deliveryOffer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeliveryOffer {
  String? title;
  String? icon;

  DeliveryOffer({this.title, this.icon});

  DeliveryOffer.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['icon'] = icon;
    return data;
  }
}