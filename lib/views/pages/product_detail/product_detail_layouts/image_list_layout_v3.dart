import '../../../../config.dart';

class ImageListV3Layout extends StatelessWidget {
  const ImageListV3Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productCtrl) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: appCtrl.appTheme.homeCategoryColor,
            shape: BoxShape.rectangle),
        child: Stack(alignment: Alignment.bottomLeft, children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: appCtrl.appTheme.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(14)),
            child: Column(children: [
              ...productCtrl.product!.images.asMap().entries.map((e) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: appCtrl.appTheme.homeCategoryColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10)),
                  child: FadeInImageLayout(
                      width: AppScreenUtil().screenWidth(48),
                      image: productCtrl.product!.images[e.key].toString(),
                      height: AppScreenUtil().screenHeight(80),
                      fit: BoxFit.contain),
                );
              }),
            ]),
          ),
          FadeInImageLayout(
              height: AppScreenUtil().screenHeight(440),
              image: productCtrl.product!.images[0].toString(),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain)
        ]),
      );
    });
  }
}
