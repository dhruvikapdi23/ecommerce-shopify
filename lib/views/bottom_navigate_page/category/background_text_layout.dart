import '../../../config.dart';
import 'package:multikart/models/category_shopify_model.dart' as category_model;
import 'package:multikart/models/category_shopify_model.dart' as category_model;

class BackgroundTextLayout extends StatelessWidget {
  final category_model.Category? categoryModel;
  final int? index;
  final bool? isEven;
  const BackgroundTextLayout({Key? key, this.index, this.isEven,this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Container(
          margin: EdgeInsets.only(
              top: AppScreenUtil().screenHeight(20),
              bottom: AppScreenUtil().screenHeight(10)),
          height: AppScreenUtil().size(90),
          padding: EdgeInsets.only(
              left: AppScreenUtil().screenWidth(18),
              right: AppScreenUtil().screenWidth(18)),
          alignment: isEven! ? Alignment.centerLeft : Alignment.centerRight,
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(AppScreenUtil().borderRadius(5)),
            color: isEven! ? const Color(0xFFEDEFF4) :const Color(0xFFDEDEDE),
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment:
            isEven! ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             LatoFontStyle(
                text: categoryModel!.name.toString().tr.toUpperCase(),
                fontSize: FontSizes.f16,
                color: appCtrl.isTheme ?  appCtrl.appTheme.whiteColor: appCtrl.appTheme.blackColor,
                fontWeight: FontWeight.w700,
              ),
              // LatoFontStyle(
              //   text: categoryModel!.description!.tr,
              //   fontSize: FontSizes.f12,
              //   color: appCtrl.appTheme.contentColor,
              //   fontWeight: FontWeight.normal,
              // ),
            ],
          ),
        );
      }
    );
  }
}
