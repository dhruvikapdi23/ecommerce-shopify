import 'package:multikart/config.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  var onBoardingCtrl = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(builder: (_) {
      return WillPopScope(
        onWillPop: () async {
          return onBoardingCtrl.isBack ? true : false;
        },
        child: Directionality(
          textDirection: onBoardingCtrl.appCtrl.isRTL ||
                  onBoardingCtrl.appCtrl.languageVal == "ar"
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Scaffold(
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                SizedBox(
                  height: AppScreenUtil().screenHeight(560),
                  child: Stack(
                      children: [
                    //app bar layout
                    AuthenticationAppBar(
                      onTap: () => onBoardingCtrl.readIntroPage(),
                      isDone: onBoardingCtrl.current ==
                              onBoardingCtrl.imgList.length - 1
                          ? true
                          : false,
                    ),

                    //on board list layout
                    const OnBoardList().marginOnly(top: MediaQuery.of(context).size.height /8)
                  ]),
                ),
                const Space(0, 5),

                //start shopping button layout
                CustomButton(
                    title: OnBoardFont().startShopping.toUpperCase(),
                    onTap: () => onBoardingCtrl.readIntroPage()),
                const Space(0, 5),

                //already account text layout
                CommonAccountText(
                    text1: CommonTextFont().alreadyAccount,
                    text2: CommonTextFont().signIn,
                    textColor: onBoardingCtrl.appCtrl.appTheme.contentColor,
                    fontWeight: FontWeight.w700,
                    onTap: () => onBoardingCtrl.navigateLoginPage()),
                const Space(0, 5)
              ])),
        ),
      );
    });
  }
}
