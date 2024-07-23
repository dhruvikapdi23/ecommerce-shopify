import '../../config.dart';

class SocialButtonLayout extends StatelessWidget {
  final String? image;
  const SocialButtonLayout({Key? key,this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(12),vertical: AppScreenUtil().screenHeight(10)),
          decoration: BoxDecoration(
            color: appCtrl.appTheme.lightGray,
            borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))
          ),
          child: Image.asset(image!,height: AppScreenUtil().screenHeight(25),),
        );
      }
    );
  }
}
