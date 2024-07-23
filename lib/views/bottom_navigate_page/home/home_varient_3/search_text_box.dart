import 'package:multikart/config.dart';
import 'package:multikart/controllers/home_product_controllers/home_varient3_controller.dart';

class SearchHomeVariant3TextBox extends StatelessWidget {
  final Widget? prefixIcon;
  final String hinText;
  const SearchHomeVariant3TextBox(
      {Key? key, this.prefixIcon, this.hinText = "Search"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVarient3Controller>(builder: (homeCtrl) {
      return SizedBox(
        height: AppScreenUtil().screenHeight(60),
        child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            hintText: hinText.tr,
            hintStyle: TextStyle(
                fontSize: FontSizes.f16,
                color: appCtrl.appTheme.contentColor,
                fontWeight: FontWeight.w500),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(AppScreenUtil().borderRadius(20)),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.zero,
            prefix: const Space(10, 0),
            prefixIconConstraints: BoxConstraints(
              minHeight: AppScreenUtil().size(42),
              minWidth: AppScreenUtil().size(42),
            ),
            prefixIcon: SearchWidget().prefixIcon(),
            fillColor: appCtrl.appTheme.greyLight25.withOpacity(.6),
          ),
        ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
      );
    });
  }
}
