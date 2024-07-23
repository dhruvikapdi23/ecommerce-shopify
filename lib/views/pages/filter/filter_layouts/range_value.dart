

import '../../../../config.dart';

class RangeValueLayout extends StatelessWidget {
  const RangeValueLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<FilterController>(
      builder: (filterCtrl) {
        return Stack(
          children: [
            CustomValueLayout(val: filterCtrl.currentRangeValues.start.toString(),),
            CustomValueLayout(val: filterCtrl.currentRangeValues.end.toString(),),

          ],
        );
      }
    );
  }
}
