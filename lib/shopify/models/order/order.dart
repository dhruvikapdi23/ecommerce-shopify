import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multikart/shopify/models/order/aftership.dart';
import 'package:multikart/shopify/models/order/product_item.dart';
import 'package:multikart/shopify/models/order/store_delivery_date.dart';
import 'package:multikart/shopify/models/order/user_location.dart';

import '../address.dart';
import '../store.dart';

enum DeliveryStatus {
  pending,
  delivered,
  unknown,
}

enum OrderStatus {
  paid,
  pending,
  processing,
  cancelled,
  refunded,
  completed,
  onHold,
  failed,
  //opencart
  shipped,
  delivered,
  reversed,
  canceled,
  canceledReversal,
  chargeback,
  denied,
  expired,
  processed,
  voided,
  unknown,
  refundRequested,
  driverAssigned,
  outForDelivery,
  orderReturned,
}

class Order {
  String? id;
  String? number;
  OrderStatus? status;
  String?
      orderStatus; //in opencart, order_status will be responsed based on language. so I use this property to show on the UI instead of status property if status is unknown
  DateTime? createdAt;
  DateTime? dateModified;
  double? total;
  double? totalTax;
  double? totalShipping;
  String? paymentMethodTitle;
  String? paymentMethod;
  String? shippingMethodTitle;
  String? customerNote;
  String? customerId;
  List<ProductItem> lineItems = [];
  Address? billing;
  Address? shipping;

  double? subtotal;
  DeliveryStatus? deliveryStatus;
  int quantity = 0;
  Store? wcfmStore;
  UserShippingLocation? userShippingLocation;
  AfterShipTracking? aftershipTracking;
  String? deliveryDate;
  String? statusUrl;
  List<StoreDeliveryDate>? storeDeliveryDates;

  int get totalQuantity {
    var quantity = 0;
    for (var item in lineItems) {
      quantity += item.quantity ?? 0;
    }
    return quantity;
  }

  Order({this.id, this.number, this.status, this.createdAt, this.total});

  factory Order.fromJson(Map<String, dynamic>? parsedJson) {
    return Order.fromShopify(parsedJson!);
  }

  Order.fromShopify(Map parsedJson) {
    try {
      id = parsedJson['id'];
      number = "${parsedJson["orderNumber"]}";
      status = parseOrderStatus(parsedJson['financialStatus']);

      createdAt = DateTime.parse(parsedJson['processedAt']).toLocal();
      total = double.parse(parsedJson['totalPrice']['amount']);
      paymentMethodTitle = '';
      shippingMethodTitle = '';
      // statusUrl = parsedJson['statusUrl'];

      var totalTaxV2 = parsedJson['totalTax']['amount'] ?? '0';
      totalTax = double.parse(totalTaxV2);
      var subtotalTaxV2 = parsedJson['subtotalPrice']['amount'] ?? '0';
      subtotal = double.parse(subtotalTaxV2);

      var items = parsedJson['lineItems']['edges'];
      items.forEach((item) {
        final productItem = ProductItem.fromShopifyJson(item['node']);
        quantity += productItem.quantity ?? 0;
        lineItems.add(productItem);
      });
      billing = Address.fromShopifyJson(parsedJson['shippingAddress']);
    } catch (e, trace) {
      log(e.toString());
      log(trace.toString());
    }
  }

  OrderStatus parseOrderStatus(String? status) {
    final newStatus = status?.toLowerCase();
    switch (newStatus) {
      case 'on-hold':
      case 'holded':
        return OrderStatus.onHold;
      case 'canceled reversal':
        return OrderStatus.canceledReversal;
      case 'complete':
        return OrderStatus.completed;
      case 'driver-assigned':
        return OrderStatus.driverAssigned;
      case 'out-for-delivery':
        return OrderStatus.outForDelivery;
      case 'order-returned':
        return OrderStatus.orderReturned;
      case 'refund-req':
        return OrderStatus.refundRequested;
      case 'authorized':
      case 'pending':
      case 'awaiting payment':
        return OrderStatus.pending;
      case 'refunded':
        return OrderStatus.refunded;
      case 'void':
        return OrderStatus.voided;
      case 'paid':
        return OrderStatus.completed;
      default:
        return OrderStatus.values.firstWhere(
          (element) => describeEnum(element) == newStatus,
          orElse: () => OrderStatus.unknown,
        );
    }
  }

  DeliveryStatus parseDeliveryStatus(String? status) {
    final newStatus = status?.toLowerCase();
    return DeliveryStatus.values.firstWhere(
      (element) => describeEnum(element) == newStatus,
      orElse: () => DeliveryStatus.unknown,
    );
  }

  @override
  String toString() => 'Order { id: $id  number: $number}';
}

extension OrderStatusExtension on OrderStatus {
  bool get isCancelled => [
        OrderStatus.cancelled,
        // OrderStatus.canceled,
      ].contains(this);

  String get content => describeEnum(this);

  Color get displayColor {
    switch (this) {
      case OrderStatus.pending:
        return Colors.amber;
      case OrderStatus.processing:
        return Colors.orange;
      case OrderStatus.cancelled:
      case OrderStatus.canceled:
        return Colors.grey;
      case OrderStatus.refunded:
        return Colors.red;
      case OrderStatus.completed:
        return Colors.green;
      case OrderStatus.onHold:
        return Colors.blue;
      default:
        return Colors.yellow;
    }
  }

  String getTranslation(context) {
    switch (this) {
      case OrderStatus.pending:
        return "Pending";
      case OrderStatus.processing:
        return "Processing";
      case OrderStatus.cancelled:
      case OrderStatus.canceled:
        return "Cancelled";
      case OrderStatus.refunded:
        return "Refunded";
      case OrderStatus.completed:
        return "Completed";
      case OrderStatus.onHold:
        return "OnHold";
      case OrderStatus.shipped:
        return "Shipped";
      case OrderStatus.reversed:
        return "Reversed";
      case OrderStatus.canceledReversal:
        return "CanceledReversal";
      case OrderStatus.chargeback:
        return "ChargeBack";
      case OrderStatus.denied:
        return "Denied";
      case OrderStatus.expired:
        return "Expired";
      case OrderStatus.processed:
        return "Processed";
      case OrderStatus.voided:
        return "Voided";
      case OrderStatus.refundRequested:
        return "refundRequested";
      default:
        return "Failed";
    }
  }
}
