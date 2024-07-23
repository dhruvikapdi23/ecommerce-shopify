import 'package:multikart/config.dart';

class WishListAction extends StatelessWidget {
  final GestureTapCallback? firstActionTap;
  final GestureTapCallback? secondActionTap;
  const WishListAction({Key? key, this.firstActionTap, this.secondActionTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: AppScreenUtil().screenHeight(0.5),
            margin:
                EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(3)),
            color: appCtrl.appTheme.lightGray,
            width: MediaQuery.of(context).size.width / 1.8,
          ),
          const Space(0, 10),
          ActionLayout(
            firstActionIcon: BuyIcon(
              color: appCtrl.appTheme.blackColor,
              isIconShow: false,
            ).height(AppScreenUtil().screenHeight(14)),
            firstActionName: CommonTextFont().addToCart,
            secondAction: CommonTextFont().remove,
            firstActionTap: firstActionTap,
            secondActionTap: firstActionTap,
          )
        ],
      );
    });
  }
}
