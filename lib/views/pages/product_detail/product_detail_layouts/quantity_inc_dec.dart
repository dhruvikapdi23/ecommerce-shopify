import 'package:flutter/cupertino.dart';
import '../../../../config.dart';

class QuantityIncDec extends StatelessWidget {
  final int? quantity;

  const QuantityIncDec({Key? key, this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productCtrl) {
      return Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CommonIncDecButton(
              icon: CupertinoIcons.minus,
              onTap: () => productCtrl.quantityDecrease()),
          LatoFontStyle(
            text:quantity != null ? quantity.toString() : productCtrl.txtQuantity.text,
          ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(30)),
          CommonIncDecButton(
              icon: CupertinoIcons.plus,
              onTap: () => productCtrl.quantityIncrease())
        ])
            .width(AppScreenUtil().screenWidth(150))
            .height(AppScreenUtil().screenHeight(40))
            .decorated(
                borderRadius:
                    BorderRadius.circular(AppScreenUtil().borderRadius(5)),
                color: productCtrl.appCtrl.appTheme.lightGray)
            .marginSymmetric(
                horizontal: AppScreenUtil().screenWidth(15),
                vertical: AppScreenUtil().screenHeight(10))
            .alignment(Alignment.centerLeft),
      ).marginOnly(bottom: AppScreenUtil().screenHeight(10));
    });
  }
}
