import '../../config.dart';

class HeartColor extends StatelessWidget {
  const HeartColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgAssets.heartColor,
    );
  }
}
