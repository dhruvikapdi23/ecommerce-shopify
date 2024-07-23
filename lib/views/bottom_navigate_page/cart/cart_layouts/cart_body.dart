import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:multikart/shopify/models/coupon.dart';

import '../../../../config.dart';

class CartBody extends StatelessWidget {
  const CartBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartCtrl) {
      log("cartCtrl.coupon : ${cartCtrl.coupon}");
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //cart list layout
        if (cartCtrl.productsInCart.isNotEmpty) const CartList(),

        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: cartCtrl.coupon  != null ?Container(
                  padding: EdgeInsets.symmetric(vertical: Insets.i15),
                  margin: EdgeInsets.symmetric(horizontal: Insets.i15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: appCtrl.appTheme.lightGray,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(svgAssets.offer,colorFilter: ColorFilter.mode(appCtrl.appTheme.primary, BlendMode.srcIn),height: Sizes.s20),
                          const HSpace(Sizes.s10),
                          LatoFontStyle(text: cartCtrl.coupon!.code,fontSize: FontSizes.f14),
                        ],
                      ),
                      VerticalDivider(color: appCtrl.appTheme.blackColor,thickness: 1).marginSymmetric(horizontal: Insets.i2),
                      Icon(CupertinoIcons.multiply_circle_fill,color: appCtrl.appTheme.primary,size: Sizes.s20).inkWell(onTap: ()=>cartCtrl.removeCoupon())
                    ],
                  ),
                ) :  LatoFontStyle(
                        text: "Apply coupon for more discount",
                        fontSize: FontSizes.f14,
                        overflow: TextOverflow.clip,
                        color: appCtrl.appTheme.contentColor)
                    .marginSymmetric(horizontal: Insets.i20),
              ),
              
              
              Expanded(
                child: CustomButton(
                  height: Sizes.s40,
                  padding: 0,
                  onTap: () => Get.toNamed(routeName.coupons)!.then((value) {
                    cartCtrl.coupon = cartCtrl.checkout!.coupon;
                    cartCtrl.update();
                    log("COUUUPPP : ${cartCtrl.coupon!.code}");
                  }),
                  title: CartFont().applyCoupons.tr.toUpperCase(),
                  color: appCtrl.appTheme.whiteColor,
                  fontSize: Sizes.s12,
                  fontColor: appCtrl.appTheme.primary,
                  border: Border.all(color: appCtrl.appTheme.primary),
                ),
              )
            ],
          ).marginSymmetric(vertical: Insets.i15),
        ),
        if(cartCtrl.coupon != null)
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyLarge,
            children: [
              TextSpan(
                text: 'Congratulations you have applied ',
              ),
              TextSpan(
                text: cartCtrl.coupon!.code.toString(),
                style: GoogleFonts.lato(color: appCtrl.appTheme.primary,fontWeight: FontWeight.w700)
              ),
              TextSpan(
                text: ' code successfully.',
              ),

            ],
          ),
        ).marginSymmetric(horizontal: Insets.i15)
        
      ]).marginOnly(bottom: AppScreenUtil().screenHeight(70));
    });
  }
}
