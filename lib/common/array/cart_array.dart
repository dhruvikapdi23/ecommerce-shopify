import '../../config.dart';

var cartList = CartModel(
    cartList: [
      HomeDealOfTheDayModel(
          name: "Pink Hoodie t-shirt full",
          image: imageAssets.product16,
          byWhom: "by Mango",
          discount: "20%",
          isFav: true,
          mrp: 32.00,
          totalPrice: 35.00,
          isTrending: true),
      HomeDealOfTheDayModel(
          name: "Pink Hoodie t-shirt full",
          image: imageAssets.product14,
          byWhom: "by Mango",
          discount: "20%",
          isFav: true,
          mrp: 32.00,
          totalPrice: 35.00,
          isTrending: false),
      HomeDealOfTheDayModel(
          name: "Pink Hoodie t-shirt full",
          image: imageAssets.product15,
          byWhom: "by Mango",
          discount: "20%",
          isFav: true,
          mrp: 32.00,
          totalPrice: 35.00,
          isTrending: false),
    ],
    totalAmount: 270.00,
    deliveryChargesInstruction: [
      DeliveryChargesInstruction(
          title: "noDeliveryCharges".tr, icon: gifAssets.truckDelivery)
    ],
    deliveryInstruction: [
      DeliveryInstructionModel(
          title: "7 Day Return".tr, icon: svgAssets.returning),
      DeliveryInstructionModel(
          title: "24/7 Support".tr, icon: svgAssets.support),
      DeliveryInstructionModel(
          title: "Secure Payment".tr, icon: svgAssets.wallet),
    ],
    orderDetail: [
      OrderDetail(title: "Bag total".tr, value: 220.00),
      OrderDetail(title: "Bag savings".tr, value: 20.00),
      OrderDetail(title: "Delivery".tr, value: 50.00),
    ]);
