import '../../config.dart';

class BorderLineLayout extends StatelessWidget {
  const BorderLineLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Container(
          color: appCtrl.appTheme.lightGray,
          width: MediaQuery.of(context).size.width,
          height: AppScreenUtil().screenHeight(8),
        );
      }
    );
  }
}
