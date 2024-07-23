import '../../../../../config.dart';

class ProductImage extends StatelessWidget {
  final String? image;
  final bool isFit;
  const ProductImage({Key? key, this.image, this.isFit = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(8)),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
        ),
        shadowColor: Colors.grey.withOpacity(.5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
          child: FadeInImageLayout(
            image: image,
            fit: isFit ? BoxFit.contain : BoxFit.fill,
            width: AppScreenUtil().screenWidth(160),
            height: AppScreenUtil().screenHeight(160),
          ),
        ),
      ),
    );
  }
}
