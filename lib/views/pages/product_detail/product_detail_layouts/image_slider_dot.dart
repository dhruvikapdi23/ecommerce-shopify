import '../../../../config.dart';

class ImageSliderDot extends StatelessWidget {
  const ImageSliderDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      builder: (productCtrl) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: productCtrl.imagesList.asMap().entries.map((entry) {
              return GestureDetector(
                  onTap: () =>
                      productCtrl.sliderController.animateToPage(entry.key),
                  child: Container(
                      height: AppScreenUtil().screenHeight(
                          productCtrl.current == entry.key ? 5 : 7),
                      width: AppScreenUtil().screenWidth(
                          productCtrl.current == entry.key ? 35 : 7),
                      margin: EdgeInsets.only(
                          right: AppScreenUtil().screenWidth(5),
                          top: AppScreenUtil().screenHeight(10)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: productCtrl.appCtrl.appTheme.lightGray)));
            }).toList());
      }
    );
  }
}
