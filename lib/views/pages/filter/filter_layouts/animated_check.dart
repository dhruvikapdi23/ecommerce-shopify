import '../../../../config.dart';

class AnimatedCheck extends StatefulWidget {
  final Animation<double> progress;

  // The size of the checkmark
  final double size;

  // The primary color of the checkmark
  final Color? color;

  // The width of the checkmark stroke
  final double? strokeWidth;

  const AnimatedCheck(

      { Key? key,required this.progress,
      required this.size,
      this.color,
      this.strokeWidth}): super(key: key);

  @override
  State<StatefulWidget> createState() => AnimatedCheckState();
}

class AnimatedCheckState extends State<AnimatedCheck>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return CustomPaint(
        foregroundPainter: AnimatedPathPainter(
            widget.progress, widget.color!, widget.strokeWidth),
        child: SizedBox(
          width: widget.size,
          height: widget.size,
        ));
  }
}
