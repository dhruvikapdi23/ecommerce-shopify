import '../../config.dart';

class BackArrowIcon extends StatelessWidget {
  const BackArrowIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_forward_ios_outlined,
      size: AppScreenUtil().size(16),
    );
  }
}
