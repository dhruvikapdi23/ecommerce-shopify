import '../../config.dart';

class ProductShimmer extends StatelessWidget {
  final double width;
  const ProductShimmer({Key? key,this.width = double.infinity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonShimmer(
            height: 150,
            width: width,
            borderRadius: 2,
            color: appCtrl.appTheme.lightGray.withOpacity(.5),
            borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
            child: const Icon(Icons.circle).alignment(Alignment.topRight).marginOnly(
                top: AppScreenUtil().screenHeight(10),
                right: AppScreenUtil().screenWidth(15)),
          ),
          const Space(0, 10),
          Row(
            children: [
              Icon(Icons.star,
                  color: appCtrl.appTheme.lightGray.withOpacity(.5)),
              Icon(Icons.star,
                  color: appCtrl.appTheme.lightGray.withOpacity(.5)),
              Icon(Icons.star,
                  color: appCtrl.appTheme.lightGray.withOpacity(.5)),
              Icon(Icons.star,
                  color: appCtrl.appTheme.lightGray.withOpacity(.5)),
              Icon(Icons.star,
                  color: appCtrl.appTheme.lightGray.withOpacity(.5)),
            ],
          ),
          const Space(0, 10),
          CommonShimmer(
            height: 10,
            width: 80,
            borderRadius: 2,
            color: appCtrl.appTheme.lightGray.withOpacity(.3),
            borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
          ),
          const Space(0, 10),
          Row(
            children: [
              CommonShimmer(
                height: 10,
                width: 30,
                borderRadius: 2,
                color: appCtrl.appTheme.lightGray.withOpacity(.3),
                borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
              ),
              const Space(10, 0),
              CommonShimmer(
                height: 10,
                width: 30,
                borderRadius: 2,
                color: appCtrl.appTheme.lightGray.withOpacity(.3),
                borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
              ),
              const Space(10, 0),
              CommonShimmer(
                height: 10,
                width: 30,
                borderRadius: 2,
                color: appCtrl.appTheme.lightGray.withOpacity(.3),
                borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
              )
            ],
          )
        ],
      );
    });
  }
}
