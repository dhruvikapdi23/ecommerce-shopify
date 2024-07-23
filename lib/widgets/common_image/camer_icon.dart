import '../../config.dart';

class CameraIcon extends StatelessWidget {
  const CameraIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return SvgPicture.asset(
        svgAssets.camera,
        height: AppScreenUtil().size(25),
        fit: BoxFit.contain,
      );
    });
  }
}
