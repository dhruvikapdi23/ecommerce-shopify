import '../../../../config.dart';

class UserImage extends StatelessWidget {
  const UserImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          UserIcon(height: AppScreenUtil().screenHeight(80)),
          Positioned(
              bottom: 0,
              right: 15,
              child: Container(
                padding: EdgeInsets.all(AppScreenUtil().size(3)),
                height: AppScreenUtil().screenHeight(20),
                width: AppScreenUtil().screenWidth(20),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppScreenUtil().borderRadius(50)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: appCtrl.appTheme.greyLight25,
                          blurRadius: 2.0, // soften the shadow
                          spreadRadius: 1.0)
                    ],
                    color: appCtrl.appTheme.whiteColor),
                child: SvgPicture.asset(svgAssets.editSquare),
              ))
        ],
      );
    });
  }
}
