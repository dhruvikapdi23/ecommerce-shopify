

import '../../../../../config.dart';


class HomeBannerData extends StatelessWidget{
  final HomeBannerModel? data;
  final GestureTapCallback? onTap;
  const HomeBannerData({Key? key, this.data,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return InkWell(
        onTap: onTap,
        child: Container(
          margin:
              EdgeInsets.only(right: AppScreenUtil().screenWidth(18)),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppScreenUtil().borderRadius(10))),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              HomeWidget().bannerImage(data!.image, context),

            ],
          ),
        ),
      );
    });
  }
}
