import '../../../../config.dart';

class CouponTextBox extends StatelessWidget {
  final bool isSuffixIcon;
  const CouponTextBox({Key? key,this.isSuffixIcon = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return SizedBox(
        height: AppScreenUtil().screenHeight(40),
        child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            hintText: CartFont().applyCoupons,
            hintStyle: TextStyle(
              fontSize: FontSizes.f16,
              color: appCtrl.appTheme.blackColor,
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(AppScreenUtil().borderRadius(5)),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.zero,
            suffixIcon:isSuffixIcon ? Icon(
              Icons.arrow_forward_ios,
              size: AppScreenUtil().size(16),
              color:appCtrl.appTheme.blackColor ,
            ) : null,
            prefixIcon: SvgPicture.asset(svgAssets.discount)
                .paddingSymmetric(horizontal: AppScreenUtil().screenWidth(10)),
            fillColor: appCtrl.appTheme.greyLight25.withOpacity(.6),
          ),
        ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
      ).marginOnly(bottom: AppScreenUtil().screenHeight(20));
    });
  }
}
