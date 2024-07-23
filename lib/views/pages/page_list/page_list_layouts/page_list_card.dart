import '../../../../config.dart';

class PageListCard extends StatelessWidget {
  final PageList? pageList;
  final GestureTapCallback? onTap;
  const PageListCard({Key? key,this.pageList,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LatoFontStyle(
                  text: pageList!.pageName!.tr.toUpperCase(),
                  fontSize: FontSizes.f15,
                  fontWeight: FontWeight.w700,
                  color: appCtrl.appTheme.blackColor),
              Icon(Icons.arrow_forward_ios_rounded,size: AppScreenUtil().size(18),color: appCtrl.appTheme.blackColor,)
            ],
          ).marginSymmetric(vertical: AppScreenUtil().screenHeight(8),horizontal: AppScreenUtil().screenWidth(15)),
        );
      }
    );
  }
}
