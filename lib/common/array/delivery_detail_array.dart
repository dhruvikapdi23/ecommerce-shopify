import 'package:multikart/config.dart';

var deliveryDetailArray = DeliveryDetailModel(addressList: [
  AddressList(
      name: "Carolina S Seo",
      address: "3501  Maloy Court, ",
      addressType: "home",
      city: "NY",
      locality: "East Elmhurst, ",
      phone: "903-239-1284",
      pinCode: "11369",
      state: "New York City"),
  AddressList(
      name: "Arthur M Willingham",
      address: "3059  Elk City Road",
      addressType: "OFFICE",
      city: "IN",
      locality: "Indianapolis, ",
      phone: "317-898-0622",
      pinCode: "46229",
      state: "Indiana"),
], expectedDelivery: [
  ExpectedDelivery(
      name: "Pink Hoodie t-shirt full",
      image: imageAssets.product14,
      date: "25th July"),
  ExpectedDelivery(
      name: "Pink Hoodie t-shirt full",
      image: imageAssets.product15,
      date: "25th July"),
]);
