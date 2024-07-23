import '../../../../config.dart';

class CustomThumbShape implements RangeSliderThumbShape {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  CustomThumbShape({
    this.radius = 15.0,
    this.ringColor = Colors.red,
  });

  /// Outer radius of thumb

  final double radius;

  /// Color of ring

  final Color ringColor;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(radius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        bool? isDiscrete,
        bool? isEnabled,
        bool? isOnTop,
        TextDirection? textDirection,
        required SliderThemeData sliderTheme,
        Thumb? thumb,
        bool? isPressed}) {
    final Canvas canvas = context.canvas;
    var paint1 = Paint()..color = appCtrl.appTheme.primary;
    var paint2 = Paint()
      ..color = appCtrl.appTheme.white
      ..strokeWidth = 2.7
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, 20 * .5, paint1);
    canvas.drawCircle(center, 18 * .42, paint2);
  }
}