import 'package:flutter_switch/flutter_switch.dart';
import '../../../../config.dart';

class ThemeSwitcher extends StatelessWidget {
  final bool? status2;
  final ValueChanged<bool>? onToggle;

  const ThemeSwitcher({Key? key, this.onToggle, this.status2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return FlutterSwitch(
        width: 60.0,
        height: 30.0,
        valueFontSize: 12.0,
        toggleSize: 20.0,
        value: status2!,
        borderRadius: 30.0,
        padding: 1.0,
        activeColor: appCtrl.appTheme.lightGray,
        inactiveColor: appCtrl.appTheme.lightGray,
        switchBorder: Border.all(
          color: appCtrl.appTheme.lightGray,
          width: 2.0,
        ),
        onToggle: onToggle!,
        activeIcon: Text(CommonTextFont().yes.toUpperCase(),style: TextStyle(color:appCtrl.appTheme.white ,fontFamily: GoogleFonts.lato().fontFamily),),
        activeToggleColor: appCtrl.appTheme.primary,
        inactiveToggleColor: appCtrl.appTheme.contentColor,
        inactiveIcon: Text(CommonTextFont().no.toUpperCase(),style: TextStyle(color:appCtrl.appTheme.white,fontFamily: GoogleFonts.lato().fontFamily )),
      );
    });
  }
}
