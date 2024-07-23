import '../../config.dart';

class LoopShimmer extends StatelessWidget {
  const LoopShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        for (int i = 0; i < 3; i++)
          const DealCardShimmer()
              .marginOnly(bottom: AppScreenUtil().screenHeight(20)),
      ],
    ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
  }
}
