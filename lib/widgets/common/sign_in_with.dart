import '../../config.dart';

class OrSignInWith extends StatelessWidget {
  const OrSignInWith({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Divider(
                color: appCtrl.appTheme.borderColor,
                thickness: 1,
                endIndent: 15,
              )),
              LatoFontStyle(
                text: CommonTextFont().orSignWith,
                fontSize: FontSizes.f14,
                color: appCtrl.appTheme.contentColor,
              ),
              Expanded(
                  child: Divider(
                color: appCtrl.appTheme.borderColor,
                indent: 15,
                thickness: 1,
              )),
            ],
          ),
        );
      }
    );
  }
}
