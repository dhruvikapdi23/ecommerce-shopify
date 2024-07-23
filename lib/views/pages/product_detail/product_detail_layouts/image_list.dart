import '../../../../config.dart';

class ImageList extends StatelessWidget {
  const ImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productCtrl) {
      return productCtrl.product!.images.isNotEmpty
          ? CarouselSlider.builder(
              options: CarouselOptions(
                  height: AppScreenUtil().size(300),
                  disableCenter: false,
                  viewportFraction: .80,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) {
                    productCtrl.current = index;
                    productCtrl.update();
                  }),
              itemCount: productCtrl.product!.images.isNotEmpty
                  ? productCtrl.product!.images.length
                  : 0,
              itemBuilder:
                  (BuildContext context, int index, int pageViewIndex) {
                return productCtrl.product!.images.isNotEmpty
                    ? FadeInImageLayout(
                            image: productCtrl.product!.images[index].toString(),
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.contain)
                        .paddingOnly(
                            right: AppScreenUtil().screenWidth(
                                productCtrl.current == index ? 10 : 15))
                    : Container();
              },
            )
          : const NoDataImage();
    });
  }
}
