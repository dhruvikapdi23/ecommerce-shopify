import '../config.dart';

class CartModel {
  List<HomeDealOfTheDayModel>? cartList;
  List<OrderDetail>? orderDetail;
  double? totalAmount;
  List<DeliveryChargesInstruction>? deliveryChargesInstruction;
  List<DeliveryInstructionModel>? deliveryInstruction;

  CartModel(
      {this.cartList,
      this.orderDetail,
      this.totalAmount,
      this.deliveryChargesInstruction,
      this.deliveryInstruction});

  CartModel.fromJson(Map<String, dynamic> json) {
    if (json['cartList'] != null) {
      cartList = <HomeDealOfTheDayModel>[];
      json['cartList'].forEach((v) {
        cartList!.add(HomeDealOfTheDayModel.fromJson(v));
      });
    }
    if (json['orderDetail'] != null) {
      orderDetail = <OrderDetail>[];
      json['orderDetail'].forEach((v) {
        orderDetail!.add(OrderDetail.fromJson(v));
      });
    }
    totalAmount = json['totalAmount'];
    if (json['deliveryChargesInstruction'] != null) {
      deliveryChargesInstruction = <DeliveryChargesInstruction>[];
      json['deliveryChargesInstruction'].forEach((v) {
        deliveryChargesInstruction!.add(DeliveryChargesInstruction.fromJson(v));
      });
    }
    if (json['deliveryInstruction'] != null) {
      deliveryInstruction = <DeliveryInstructionModel>[];
      json['deliveryInstruction'].forEach((v) {
        deliveryInstruction!.add(DeliveryInstructionModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cartList != null) {
      data['cartList'] = cartList!.map((v) => v.toJson()).toList();
    }
    if (orderDetail != null) {
      data['orderDetail'] = orderDetail!.map((v) => v.toJson()).toList();
    }
    data['totalAmount'] = totalAmount;
    if (deliveryChargesInstruction != null) {
      data['deliveryChargesInstruction'] =
          deliveryChargesInstruction!.map((v) => v.toJson()).toList();
    }
    if (deliveryInstruction != null) {
      data['deliveryInstruction'] =
          deliveryInstruction!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
