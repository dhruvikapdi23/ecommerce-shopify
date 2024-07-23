import 'package:multikart/controllers/home_product_controllers/home_varient2_controller.dart';
import '../../../../../config.dart';

class HomeStaticBannerVarient2 extends StatelessWidget {
  const HomeStaticBannerVarient2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVarient2Controller>(builder: (homeCtrl) {
      return Container(
        margin:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(18)),
        child: ClipRRect(
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(6)),
            child: Image.asset(
              homeCtrl.staticBanner,
              fit: BoxFit.contain,
              height: AppScreenUtil().screenHeight(125),
              width: MediaQuery.of(context).size.width,
            )),
      );
    });
  }
}
