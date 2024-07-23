import '../../config.dart';

class CommonTitleText extends StatelessWidget {
  final double width;
  const CommonTitleText({Key? key ,this.width =100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AppController>(
      builder: (appCtrl) {
        return CommonShimmer(
          height: 10,
          width: width,
          borderRadius: 2,
          color: appCtrl.appTheme.lightGray.withOpacity(.3),
          borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
        ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
      }
    );
  }
}
