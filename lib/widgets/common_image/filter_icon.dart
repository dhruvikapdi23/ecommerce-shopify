import '../../config.dart';

class FilterIcon extends StatelessWidget {
  const FilterIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return SvgPicture.asset(
        svgAssets.filter,
        height: AppScreenUtil().size(25),
        fit: BoxFit.fill,
      );
    });
  }
}
