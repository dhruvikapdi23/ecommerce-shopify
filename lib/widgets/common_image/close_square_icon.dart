import '../../config.dart';

class CloseSquareIcon extends StatelessWidget {
  const CloseSquareIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgAssets.closeSquare,
      height: AppScreenUtil().size(25),
      width: AppScreenUtil().size(25),
      fit: BoxFit.contain,
    ).marginOnly(right: AppScreenUtil().screenWidth(15)).gestures(onTap: ()=> Get.back());
  }
}
