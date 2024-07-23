import 'package:multikart/controllers/pages_controller/language_controller.dart';

import '../../../config.dart';

class LanguageBottomSheet extends StatelessWidget {
  final languageCtrl = Get.put(LanguageController());

  LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return GetBuilder<LanguageController>(builder: (_) {
          return Directionality(
            textDirection:
                languageCtrl.appCtrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
            child: BottomSheetLayout(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //select language text layout
                LatoFontStyle(
                  text: CommonTextFont().selectLanguage,
                  fontSize: FontSizes.f16,
                  color: languageCtrl.appCtrl.appTheme.blackColor,
                ),
                const Space(0, 20),

                //language list
                ...AppArray().languageList.map((e) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: AppScreenUtil().screenHeight(10)),
                    child: InkWell(
                      onTap: () => languageCtrl.languageSelection(e),
                      child: Row(
                        children: [
                          Image.asset(
                            e['icon'].toString(),
                            height: AppScreenUtil().screenHeight(25),
                            fit: BoxFit.contain,
                          ),
                          const Space(10, 0),
                          LatoFontStyle(
                            text: e['name'].toString(),
                            fontSize: FontSizes.f16,
                            color: languageCtrl.appCtrl.appTheme.blackColor,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList()
              ],
            )),
          );
        });
      }
    );
  }
}
