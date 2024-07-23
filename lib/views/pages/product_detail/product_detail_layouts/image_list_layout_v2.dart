import '../../../../config.dart';

class ImageListV2Layout extends StatelessWidget {
  const ImageListV2Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productCtrl) {
      return Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: appCtrl.appTheme.homeCategoryColor,
                shape: BoxShape.rectangle),
            child: FadeInImageLayout(
                height: AppScreenUtil().screenHeight(440),
                image: productCtrl.product!.images[0].toString(),
                width: MediaQuery.of(context).size.width / 1.75,
                fit: BoxFit.contain),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...productCtrl.product!.images.asMap().entries.map((e) {
                return Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: appCtrl.appTheme.homeCategoryColor,
                    shape: BoxShape.rectangle,
                  ),
                  child: FadeInImageLayout(
                      width: AppScreenUtil().screenHeight(80),
                      image: productCtrl.product!.images[e.key].toString(),
                      height: AppScreenUtil().screenHeight(140),
                      fit: BoxFit.contain),
                );
              }),
            ],
          )
        ],
      ).marginAll(10);
    });
  }
}
