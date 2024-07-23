import '../../../../../config.dart';

class PriceLayout extends StatelessWidget {
  final String? totalPrice,mrp, discount;
  final bool isDiscountShow;
  final bool isBold;
  final double fontSize;
  const PriceLayout({Key? key,this.discount,this.mrp,this.totalPrice,this.isDiscountShow = true,this.isBold = true,this.fontSize = FontSizes.f12}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AppController>(
      builder: (appCtrl) {
        return FittedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LatoFontStyle(
                text: mrp,
                fontSize: fontSize,
                fontWeight:isBold ? FontWeight.w600 : FontWeight.normal,
                color: appCtrl.appTheme.blackColor,
              ),
              const Space(5, 0),
              LatoFontStyle(
                text: totalPrice,
                fontSize: fontSize,
                fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
                color: appCtrl.appTheme.contentColor,
                textDecoration: TextDecoration.lineThrough,
              ),
              const Space(5, 0),
              if(isDiscountShow)
              LatoFontStyle(
                text: '($discount ${CommonTextFont().off})',
                fontSize: fontSize,
                fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
                color: appCtrl.appTheme.primary,
              ),
            ],
          ).paddingOnly(left: AppScreenUtil().screenWidth(5)),
        );
      }
    );
  }
}
