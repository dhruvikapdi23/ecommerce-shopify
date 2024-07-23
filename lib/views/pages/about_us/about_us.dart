import 'package:flutter_html/flutter_html.dart';

import '../../../config.dart';

class AboutUs extends StatelessWidget {
  final aboutUsCtrl = Get.put(AboutUsController());

  AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(builder: (_) {
      return Directionality(
        textDirection:
            aboutUsCtrl.appCtrl.isRTL || aboutUsCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: const BackArrowButton(),
            backgroundColor: aboutUsCtrl.appCtrl.appTheme.whiteColor,
            title: LatoFontStyle(
              text: AboutUSFont().aboutUs,
              fontSize: FontSizes.f15,
              fontWeight: FontWeight.w700,
            ),
          ),
          body: aboutUsCtrl.url != null
              ? Html(data: aboutUsCtrl.url)
              : const Center(child:  CircularProgressIndicator()),
        ),
      );
    });
  }
}
