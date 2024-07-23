import '../../config.dart';

class FadeInImageLayout extends StatelessWidget {
  final String? image;
  final double? height, width;
  final BoxFit? fit;
  const FadeInImageLayout(
      {Key? key, this.image, this.width, this.height, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      
      placeholder: AssetImage(
        gifAssets.loading,
      ),
      image: NetworkImage(image!),
      fit: fit,
      height: height,
      alignment: Alignment.center,
      placeholderFit: BoxFit.contain,
      width: width,
    );
  }
}
