import '../../config.dart';

class NoDataImage extends StatelessWidget {
  const NoDataImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageAssets.noData,
      height: AppScreenUtil().size(400),
    );
  }
}
