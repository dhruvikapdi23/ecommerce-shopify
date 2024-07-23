import 'package:flutter_html/flutter_html.dart';
import '../../../config.dart';

class TermsAndCondition extends StatelessWidget {
  final termsConditionCtrl = Get.put(TermsAndConditionController());

  TermsAndCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TermsAndConditionController>(builder: (_) {
      return Directionality(
        textDirection: termsConditionCtrl.appCtrl.isRTL ||
                termsConditionCtrl.appCtrl.languageVal == "ar"
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: const BackArrowButton(),
            backgroundColor: termsConditionCtrl.appCtrl.appTheme.whiteColor,
            title: LatoFontStyle(
              text: CommonTextFont().termsCondition,
              fontSize: FontSizes.f15,
              fontWeight: FontWeight.w700,
            ),
          ),
          body: termsConditionCtrl.url != null
              ? Html(data: termsConditionCtrl.url!)
              : const Center(child:  CircularProgressIndicator()),
        ),
      );
    });
  }
}
