import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;
import '../../../../../config.dart';

class CartDataLayout extends StatelessWidget {
  final product_model.Product? data;
  final GestureTapCallback? firstActionTap, secondActionTap;
  final Function? onChangeQuantity;
  final String? keyVal;

  const CartDataLayout(
      {Key? key,
      this.data,
      this.firstActionTap,
      this.secondActionTap,
      this.onChangeQuantity,
      this.keyVal = "0"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      log("datadata : $data");
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LatoFontStyle(
              text: data!.name!.tr,
              fontWeight: FontWeight.w700,
              color: appCtrl.appTheme.blackColor,
              fontSize: FontSizes.f12),
          const Space(0, 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LatoFontStyle(
                  text:
                      '${appCtrl.priceSymbol} ${(double.parse(data!.price!.toString()) * appCtrl.rateValue)}',
                  fontWeight: FontWeight.w400,
                  color: appCtrl.appTheme.blackColor,
                  fontSize: FontSizes.f13),
              const Space(8, 0),
              LatoFontStyle(
                  text:
                      '${appCtrl.priceSymbol} ${(double.parse(data!.regularPrice!.toString()) * appCtrl.rateValue).toStringAsFixed(2)}',
                  fontWeight: FontWeight.w400,
                  color: appCtrl.appTheme.contentColor,
                  fontSize: FontSizes.f13,
                  textDecoration: TextDecoration.lineThrough),
              const Space(8, 0),
              LatoFontStyle(
                  text:
                      "${((double.parse(data!.regularPrice!) - double.parse(data!.price!)) / double.parse(data!.regularPrice!) * 100).toStringAsFixed(0)}%",
                  fontWeight: FontWeight.w400,
                  color: appCtrl.appTheme.primary,
                  fontSize: FontSizes.f13)
            ],
          ),
          const Space(0, 2),
          LatoFontStyle(
              text: data!.inStock! ? HomeFont().isStock : HomeFont().outStock,
              fontWeight: FontWeight.w700,
              color: data!.inStock!
                  ? appCtrl.appTheme.greenColor
                  : appCtrl.appTheme.error,
              fontSize: FontSizes.f12),
          const Space(0, 10),
          GetBuilder<CartController>(builder: (cartCtrl) {
            return Container(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CommonIncDecButton(
                    icon: CupertinoIcons.minus,
                    onTap: () {
                      if (cartCtrl.productsInCart[keyVal]! == 1) {
                        onChangeQuantity!(0);
                      } else {
                        onChangeQuantity!(cartCtrl.productsInCart[keyVal]! - 1);
                      }
                    }),
                LatoFontStyle(
                  text: cartCtrl.productsInCart[keyVal].toString(),
                ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(30)),
                CommonIncDecButton(
                    icon: CupertinoIcons.plus,
                    onTap: () {
                      onChangeQuantity!(cartCtrl.productsInCart[keyVal]! + 1);
                    })
              ])
                      .width(AppScreenUtil().screenWidth(150))
                      .height(AppScreenUtil().screenHeight(40))
                      .decorated(
                          borderRadius: BorderRadius.circular(
                              AppScreenUtil().borderRadius(5)),
                          color: appCtrl.appTheme.lightGray)
                      .marginSymmetric(
                          vertical: AppScreenUtil().screenHeight(10))
                      .alignment(Alignment.centerLeft),
            );
          }),
          const Space(0, 10),
          Container(
            height: AppScreenUtil().screenHeight(0.5),
            color: appCtrl.appTheme.lightGray,
            width: MediaQuery.of(context).size.width / 1.8,
          ),
          const Space(0, 10),
          ActionLayout(
            firstActionIcon: HeartIcon(color: appCtrl.appTheme.blackColor)
                .height(AppScreenUtil().screenHeight(14)),
            firstActionName: CommonTextFont().moveToWishList,
            secondAction: CommonTextFont().remove,
            secondActionTap: secondActionTap,
            firstActionTap: firstActionTap,
          )
        ],
      );
    });
  }
}
