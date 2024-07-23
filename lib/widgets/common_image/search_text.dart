import '../../config.dart';

class SearchTextIcon extends StatelessWidget {
  const SearchTextIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return SizedBox(
        child: SvgPicture.asset(
          svgAssets.searchText,
          height: AppScreenUtil().size(20),
          fit: BoxFit.contain,
        ),
      );
    });
  }
}
