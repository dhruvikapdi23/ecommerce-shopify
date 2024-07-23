import 'package:multikart/config.dart';

var orderHistory = <OrderHistoryModel>[
  OrderHistoryModel(orderDay: "Open Orders".tr, daysWiseList: [
    DaysWiseList(
        qty: 1,
        size: "S",
        name: "Pink Hoodie t-shirt full".tr,
        date: "26th May, 2021".tr,
        image: imageAssets.product14,
        deliveryStatus: "Dispatched".tr,
        status: "OnGoing".tr),
    DaysWiseList(
        qty: 1,
        size: "S",
        name: "Pink Hoodie t-shirt full".tr,
        date: "26th May, 2021".tr,
        image: imageAssets.product15,
        deliveryStatus: "On the way".tr,
        status: "OnGoing".tr),
  ]),
  OrderHistoryModel(orderDay: "Past Orders".tr, daysWiseList: [
    DaysWiseList(
        qty: 1,
        size: "S",
        name: "Pink Hoodie t-shirt full".tr,
        date: "26th May, 2021".tr,
        image: imageAssets.product13,
        deliveryStatus: "Delivered".tr,
        status: "Delivered"),
    DaysWiseList(
        qty: 1,
        size: "S",
        name: "Pink Hoodie t-shirt full".tr,
        date: "26th May, 2021".tr,
        image: imageAssets.dealOfTheDay2,
        deliveryStatus: "Delivered".tr,
        status: "Delivered".tr),
  ]),
];
