import '../../config.dart';

final appCtrl = Get.isRegistered<AppController>()
    ? Get.find<AppController>()
    : Get.put(AppController());

var productList = Product(
    name: "Floral Print Skirt With White Top",
    title: "Floral Skirts",
    description: "productDescription",
    rating: 4.5,
    ratingPoints: 20,
    price: 35,
    discountPrice: 32,
    discount: "20%",
    quantity: 1,
    totalReview: 24,
    policy: "policy",
    size: [
      SizeModel(title: "S", isAvailable: true),
      SizeModel(title: "M", isAvailable: true),
      SizeModel(title: "L", isAvailable: true),
      SizeModel(title: "XL", isAvailable: false),
    ],
    color: [
      ColorModel(id: 1, color: const Color(0xFFE6E6FA), isAvailable: true),
      ColorModel(id: 2, color: const Color(0xFFF5F5F5), isAvailable: true),
      ColorModel(id: 3, color: const Color(0xFFB0C4DE), isAvailable: true),
      ColorModel(id: 4, color: const Color(0xFFE6A199), isAvailable: true),
      ColorModel(id: 5, color: const Color(0xFF4F4652), isAvailable: false),
    ],
    images: [
      Images(image: imageAssets.product1, colorId: 1),
      Images(image: imageAssets.product2, colorId: 1),
      Images(image: imageAssets.product3, colorId: 1),
      Images(image: imageAssets.product4, colorId: 2),
      Images(image: imageAssets.product5, colorId: 2),
      Images(image: imageAssets.product6, colorId: 2),
      Images(image: imageAssets.product7, colorId: 4),
      Images(image: imageAssets.product8, colorId: 4),
      Images(image: imageAssets.product9, colorId: 4),
      Images(image: imageAssets.product10, colorId: 5),
      Images(image: imageAssets.product11, colorId: 5),
      Images(image: imageAssets.product12, colorId: 5),
    ],
    detail: [
      Detail(title: "Product Details", description: "productDescription"),
      Detail(
          title: "Model Size & Fit",
          description: "The model (height 5'8) is wearing a size 28"),
      Detail(
          title: "Material & Care",
          description: "100% polyester, Machine-wash"),
      Detail(title: "Product Code", description: "460356366_floral"),
    ],
    reviews: [
      Reviews(
          name: "Mark Jacob",
          description: "reviewDesc",
          size: "L",
          rating: 4,
          disLike: 20,
          like: 2,
          date: "20 Aug, 2021",
          image: imageAssets.avtar),
      Reviews(
          name: "Mark Jacob",
          description:
              "Wow.. but it should have more flairs. mind-blowing purchase..🤗",
          size: "XL",
          rating: 4,
          disLike: 20,
          like: 2,
          date: "20 Aug, 2021",
          image: imageAssets.avtar1)
    ],
    offer: Offer(
      title: "Use code MULTIKART10 to get flat 10%",
      code: "MULTIKART10",
      desc: "productOffer",
    ),
    deliverOfferModel: DeliverOfferModel(
        title: "Check Delivery",
        description: "Enter Pincode to check delivery date / pickup option",
        deliveryOffer: [
          DeliveryOffer(
              title:
                  'Free Delivery on order above ${appCtrl.priceSymbol}200.00',
              icon: svgAssets.truck),
          DeliveryOffer(
              title: "Cash On delivery Available", icon: svgAssets.payment),
          DeliveryOffer(
              title: "Easy 21 days returns and exchanges",
              icon: svgAssets.refund)
        ]));
