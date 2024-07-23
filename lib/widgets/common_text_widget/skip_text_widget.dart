import '../../config.dart';

class SkipTextWidget extends StatelessWidget {
  final GestureTapCallback? onTap;
  final bool? isDone;
  const SkipTextWidget({Key? key, this.onTap, this.isDone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      isDone! ? 'DONE'.tr : 'SKIP'.tr,
    )
        .fontFamily(GoogleFonts.lato().fontFamily.toString())
        .fontSize(AppScreenUtil().fontSize(FontSizes.f16))
        .fontFamily(FontWeight.w700.toString()).textColor(Colors.black)
        .gestures(onTap: onTap);
  }
}
