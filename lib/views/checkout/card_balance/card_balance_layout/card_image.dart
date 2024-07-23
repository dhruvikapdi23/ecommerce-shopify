import '../../../../config.dart';

class CardImage extends StatelessWidget {
  final String? image;
  final int? index, currentIndex;

  const CardImage({Key? key, this.currentIndex, this.index, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return currentIndex == index
        ? Image.asset(image!).marginOnly(
            right: AppScreenUtil().screenWidth(15),
          )
        : ClipRRect(
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(12)),
            child: Image.asset(
          image!,
              color: Colors.grey[200],
              colorBlendMode: BlendMode.softLight,
            ).marginOnly(
              right: AppScreenUtil().screenWidth(15),
            ),
          );
  }
}
