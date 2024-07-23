import 'package:multikart/config.dart';

class DividerImage extends StatelessWidget {
  const DividerImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return SizedBox(
        child: SvgPicture.asset(
          svgAssets.dividerImage,
          height: AppScreenUtil().size(10),
          fit: BoxFit.contain,
        ),
      )
          .alignment(Alignment.center)
          .marginOnly(bottom: AppScreenUtil().screenHeight(12));
    });
  }
}
