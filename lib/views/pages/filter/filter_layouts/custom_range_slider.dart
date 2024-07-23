import '../../../../config.dart';

class CustomRangeSlider extends StatelessWidget {
  const CustomRangeSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(builder: (shopCtrl) {
      return GetBuilder<FilterController>(builder: (filterCtrl) {
        return SliderTheme(
          data: SliderThemeData(
              activeTrackColor: appCtrl.appTheme.primary,
              inactiveTrackColor: appCtrl.appTheme.lightGray,
              activeTickMarkColor: appCtrl.appTheme.primary,
              inactiveTickMarkColor: appCtrl.appTheme.lightGray,
              valueIndicatorColor: appCtrl.appTheme.primary,
              valueIndicatorShape: const RectangularSliderValueIndicatorShape(),
              valueIndicatorTextStyle:
                  TextStyle(color: appCtrl.appTheme.white),
              rangeThumbShape: CustomThumbShape(),
              trackHeight: 5.0,
              showValueIndicator: ShowValueIndicator.never),
          child: RangeSlider(
            values: filterCtrl.currentRangeValues,
            min: 0,
            max: 100,
            divisions: 10,
            onChanged: (RangeValues values) {
              shopCtrl.start = values.start;
              shopCtrl.end = values.end;
              filterCtrl.currentRangeValues = values;
              filterCtrl.update();
            },
          ),
        );
      });
    });
  }
}
