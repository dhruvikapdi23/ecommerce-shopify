import '../../../../config.dart';

class DrawerLeadingTitle extends StatelessWidget {
  final dynamic data;
final int? index;
  const DrawerLeadingTitle({Key? key, this.data,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return DrawerContainer(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  data['icon'] == "assets/svg/flags.svg"
                      ? SvgPicture.asset(svgAssets.flags, fit: BoxFit.fill)
                      :data['icon'] == "assets/svg/currency.svg" ?const Icon(Icons.money) :  SvgPicture.asset(data['icon'],
                          color: appCtrl.appTheme.blackColor)
                ]),
            const Space(20, 0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LatoFontStyle(
                    text: data['title'],
                    fontSize: FontSizes.f12,
                    fontWeight: FontWeight.w600),
                if(index != 0 && index !=1)
                LatoFontStyle(
                    text: data['subTitle'],
                    fontSize: FontSizes.f12,
                    fontWeight: FontWeight.normal)
              ],
            )
          ],
        ),
        if (data['title'] == "Mode" ||data['title'] == "الوضع" ||data['title'] == "तरीका" ||data['title'] == "방법" )
          ThemeSwitcher(
              onToggle: (val) {
                appCtrl.isTheme = val;
                appCtrl.update();
                ThemeService().switchTheme(val);
              },
              status2: appCtrl.isTheme),
        if (data['title'] == "RTL" ||data['title'] == "아르 자형티엘"  || data['title'] == "आरटीएल"  ||data['title'] == "رتيإل" )
          ThemeSwitcher(
              onToggle: (val) {
                appCtrl.isRTL = val;
                appCtrl.update();
                Get.forceAppUpdate();
              },
              status2: appCtrl.isRTL)
      ]));
    });
  }
}
