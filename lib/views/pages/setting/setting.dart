import 'package:multikart/config.dart';
import 'package:multikart/controllers/pages_controller/setting_controller.dart';
import 'package:multikart/views/pages/setting/setting_card.dart';

class Setting extends StatelessWidget {
  final settingCtrl = Get.put(SettingController());

  Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (_) {
      return  Directionality(
        textDirection: settingCtrl.appCtrl.isRTL
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            leading: const BackArrowButton(),
            elevation: 0,
            backgroundColor: settingCtrl.appCtrl.appTheme.whiteColor,
            title: LatoFontStyle(
              text: CommonTextFont().settings,
              color: settingCtrl.appCtrl.appTheme.blackColor,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //setting image layout
                Image.asset(imageAssets.setting),
                const Space(0, 10),

                //setting text layout
                LatoFontStyle(
                  text: CommonTextFont().settings,
                  color: settingCtrl.appCtrl.appTheme.blackColor,
                  fontWeight: FontWeight.w700,
                ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
                const Space(0, 10),

                //setting list
                ...settingCtrl.settingData.asMap().entries.map((e) {
                  return SettingCard(profileModel: e.value,);
                })
              ],
            ),
          ),
        ),
      );
    });
  }
}
