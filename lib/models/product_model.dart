import '../config.dart';

class Product {
  String? name;
  String? title;
  String? description;
  double? rating;
  double? ratingPoints;
  double? price;
  double? discountPrice;
  String? discount;
  int? quantity;
  int? totalReview;
  String? policy;
  List<SizeModel>? size;
  List<ColorModel>? color;
  List<Images>? images;
  List<Detail>? detail;
  List<Reviews>? reviews;
  Offer? offer;
  DeliverOfferModel? deliverOfferModel;

  Product(
      {this.name,
      this.title,
      this.description,
      this.rating,
      this.ratingPoints,
      this.price,
      this.discountPrice,
      this.discount,
      this.quantity,
      this.totalReview,
      this.policy,
      this.size,
      this.color,
      this.images,
      this.detail,
      this.reviews,
      this.offer,
      this.deliverOfferModel});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    description = json['description'];
    rating = json['rating'];
    ratingPoints = json['ratingPoints'];
    price = json['price'];
    discountPrice = json['discountPrice'];
    discount = json['discount'];
    quantity = json['quantity'];
    totalReview = json['totalReview'];
    policy = json['policy'];
    if (json['size'] != null) {
      size = <SizeModel>[];
      json['size'].forEach((v) {
        size!.add(SizeModel.fromJson(v));
      });
    }
    if (json['color'] != null) {
      color = <ColorModel>[];
      json['color'].forEach((v) {
        color!.add(ColorModel.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['detail'] != null) {
      detail = <Detail>[];
      json['detail'].forEach((v) {
        detail!.add(Detail.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    offer = json['offer'] != null ? Offer.fromJson(json['offer']) : null;
    deliverOfferModel = json['deliverOfferModel'] != null
        ? DeliverOfferModel.fromJson(json['deliverOfferModel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['title'] = title;
    data['description'] = description;
    data['rating'] = rating;
    data['ratingPoints'] = ratingPoints;
    data['price'] = price;
    data['discountPrice'] = discountPrice;
    data['discount'] = discount;
    data['quantity'] = quantity;
    data['totalReview'] = totalReview;
    data['policy'] = policy;
    if (size != null) {
      data['size'] = size!.map((v) => v.toJson()).toList();
    }
    if (color != null) {
      data['color'] = color!.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (detail != null) {
      data['detail'] = detail!.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    if (offer != null) {
      data['offer'] = offer!.toJson();
    }
    if (deliverOfferModel != null) {
      data['deliverOfferModel'] = offer!.toJson();
    }
    return data;
  }
}
