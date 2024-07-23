import 'package:multikart/config.dart';

class NoDataWidget extends StatelessWidget {
  final appCtrl = Get.isRegistered<AppController>() ? Get.find<AppController>() : Get.put(AppController());

  final Widget? icon;
  final String? title;
  final String? body;
  final bool showIcon;

  NoDataWidget({Key? key, this.icon, this.title, this.body, this.showIcon = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Insets.i20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showIcon)
            icon ??
                Image.asset(
                  imageAssets.noImageBanner,
                ),
          const VSpace(Sizes.s10),
          Text(
            title ?? trans('no_data'),
            textAlign: TextAlign.center,
            style: AppCss.h2,
          ),
          const VSpace(Sizes.s5),
          Text(
            body ?? trans('pull_to_refresh'),
            style: AppCss.body3.copyWith(color: appCtrl.appTheme.gray),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
