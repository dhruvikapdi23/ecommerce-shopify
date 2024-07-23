import 'package:multikart/config.dart';

class ImagePreview extends StatelessWidget {
  final String url;

  const ImagePreview({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: InteractiveViewer(
              child: imageNetwork(
                url: url,
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: 30,
          child: const Icon(
            Icons.close,
            color: Colors.black,
          ).backgroundColor(Colors.white).gestures(onTap: () => Get.back()),
        ),
      ],
    );
  }
}
