import '../../config.dart';

class DesignLayout extends StatelessWidget {
  const DesignLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageAssets.design,
      height: AppScreenUtil().screenHeight(130),
    );
  }
}
