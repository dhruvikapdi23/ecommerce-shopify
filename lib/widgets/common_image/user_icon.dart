import '../../config.dart';

class UserIcon extends StatelessWidget {
  final double height;

  const UserIcon({Key? key, this.height = 55}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageAssets.user,
      height: AppScreenUtil().size(height),
    );
  }
}
