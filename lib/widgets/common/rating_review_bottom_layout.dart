import '../../config.dart';

class RatingReviewBottomLayout extends StatelessWidget {
  const RatingReviewBottomLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AppController>(
      builder: (appCtrl) {
        return Container(
            width: MediaQuery.of(Get.context!).size.width,
            padding: EdgeInsets.symmetric(
                vertical: AppScreenUtil().screenHeight(12),
                horizontal: AppScreenUtil().screenWidth(15)),
            decoration: BoxDecoration(
              color: appCtrl.appTheme.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: appCtrl.appTheme.lightGray,
                  spreadRadius: 10,
                  blurRadius: 5,
                  offset: const Offset(0, 7), // changes position of shadow
                )
              ],
            ),
            child: IntrinsicHeight(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LatoFontStyle(
                        text: CardBalanceFont().back.toUpperCase(),
                        fontWeight: FontWeight.w600,
                        fontSize: FontSizes.f14),
                    VerticalDivider(
                      color: appCtrl.appTheme.greyLight25,
                    ),
                    CustomButton(
                      title: OrderHistoryFont().submit.toUpperCase(),
                      width: AppScreenUtil().screenWidth(100),
                      height: AppScreenUtil().screenHeight(30),
                    )
                  ]),
            ));
      }
    );
  }
}
