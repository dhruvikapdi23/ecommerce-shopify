import 'package:multikart/config.dart';

class AuthenticationAppBar extends StatelessWidget {
  final bool? isDone;
  final GestureTapCallback? onTap;
  const AuthenticationAppBar({Key? key,this.isDone,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Stack(
        alignment: Alignment.topRight,
        children: [
          const DesignLayout(),
          Padding(
            padding: EdgeInsets.only(
                left: AppScreenUtil().screenWidth(15),
                right: AppScreenUtil().screenWidth(15),
                top: MediaQuery.of(context).size.height * 0.10 / 2.4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const LogoImage(),
                SkipTextWidget(isDone: isDone,onTap: onTap,),
              ],
            ),
          ),
        ],
      );
    });
  }
}
