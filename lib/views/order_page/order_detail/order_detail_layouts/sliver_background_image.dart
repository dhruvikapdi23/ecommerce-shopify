import '../../../../config.dart';

class SliverBackgroundImage extends StatelessWidget {
  final bool? isShrink;
  const SliverBackgroundImage({Key? key,this.isShrink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return FlexibleSpaceBar(
            centerTitle: false,
            title: LatoFontStyle(
                text: OrderDetailFont().orderDetail,
                color: isShrink!
                    ? appCtrl.appTheme.blackColor
                    : appCtrl.appTheme.white)
                .marginOnly(bottom: Insets.i2),
            background: Image.asset(imageAssets.mapSectionBG));
      }
    );
  }
}
