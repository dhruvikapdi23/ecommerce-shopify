import 'package:flutter_html/flutter_html.dart';

import '../../../config.dart';

class Help extends StatelessWidget {
  final helpCtrl = Get.put(HelpController());

  Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HelpController>(builder: (_) {
      return Directionality(
        textDirection: helpCtrl.appCtrl.isRTL ||
            helpCtrl.appCtrl.languageVal == "ar"
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: const BackArrowButton(),
            backgroundColor: helpCtrl.appCtrl.appTheme.whiteColor,
            title: LatoFontStyle(
              text: HelpFont().helpCenter,
              fontSize: FontSizes.f15,
              fontWeight: FontWeight.w700,
            ),
          ),

          body: helpCtrl.url != null
              ? Html(data: helpCtrl.url!)
              : const Center(child:  CircularProgressIndicator()),
        ),
      );
    });
  }
}
