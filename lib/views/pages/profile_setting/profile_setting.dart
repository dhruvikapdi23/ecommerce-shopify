import 'package:multikart/config.dart';

class ProfileSetting extends StatelessWidget {
  final profileCtrl = Get.put(ProfileController());

  ProfileSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (_) {
      return Directionality(
        textDirection:
            profileCtrl.appCtrl.isRTL || profileCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
              centerTitle: false,
              elevation: 0,
              automaticallyImplyLeading: false,
              leading: const BackArrowButton(),
              backgroundColor: profileCtrl.appCtrl.appTheme.whiteColor,
              title: LatoFontStyle(
                  text: ProfileFont().profileSetting,
                  color: profileCtrl.appCtrl.appTheme.blackColor)),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //user image
                    const UserImage().alignment(Alignment.center),
                    const Space(0, 30),

                    //personal detail
                    const PersonalDetailLayout(),
                    const Space(0, 30),
                    const BorderLineLayout(),

                    const Space(0, 30),
                    //security layout
                    const SecurityLayout(),
                    const Space(0, 50),
                  ],
                )
                    .width(MediaQuery.of(context).size.width)
                    .marginOnly(top: Insets.i20, bottom: Insets.i30),
              ),

              //cancel and save detail layout
              BottomLayout(
                  firstButtonText: ProfileFont().cancel,
                  secondButtonText: ProfileFont().saveDetails,
                  firstTap: () => Get.back(),
                  secondTap: () => Get.back())
            ],
          ),
        ),
      );
    });
  }
}
