import '../../config.dart';

class CommonCircle extends StatelessWidget {
  const CommonCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AppController>(
      builder: (appCtrl) {
        return CommonShimmer(
          height: 50,
          width: 45,
          borderRadius: 50,
          color: appCtrl.appTheme.lightGray.withOpacity(.3),
          borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
          child: const Icon(Icons.circle),
        );
      }
    );
  }
}
