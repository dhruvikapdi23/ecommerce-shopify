import 'package:flutter/cupertino.dart';
import '../../../config.dart';

class ProductDetail extends StatelessWidget {
  final productCtrl = Get.put(ProductDetailController());

  ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (_) {
      return Directionality(
        textDirection:
            productCtrl.appCtrl.isRTL || productCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: WillPopScope(
          onWillPop: () async {
            productCtrl.appCtrl.goToHome();
            Get.offAndToNamed(routeName.dashboard);
            return true;
          },
          child: productCtrl.product != null
              ? Scaffold(
                  backgroundColor: productCtrl.appCtrl.appTheme.whiteColor,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: productCtrl.appCtrl.appTheme.whiteColor,
                    automaticallyImplyLeading: false,
                    leading: Icon(
                      CupertinoIcons.arrow_left,
                      size: AppScreenUtil().size(25),
                      color: productCtrl.appCtrl.appTheme.blackColor,
                    ).gestures(onTap: () {
                      productCtrl.appCtrl.goToHome();
                      Get.offAndToNamed(routeName.dashboard);
                    }),
                    title: LatoFontStyle(
                        text: productCtrl.product!.name != null
                            ? productCtrl.product!.name.toString().tr
                            : "",
                        fontSize: FontSizes.f16,
                        fontWeight: FontWeight.w700),
                    actions: [
                      AppBarActionLayout(
                        productId:
                            Get.arguments.runtimeType.toString() == "Product"
                                ? Get.arguments.id
                                : Get.arguments,
                      )
                    ],
                  ),
                  body: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      const ProductBody(),
                      ProductBottom(productCtrl: productCtrl)
                    ],
                  ))
              : Container(),
        ),
      );
    });
  }
}
