import '../../../../config.dart';

class DrawerDataListLayout extends StatefulWidget {
  final dynamic data;
  final AnimationController? animationController;
  final double? duration;
  final int? index;
  final int? lastIndex;
  final GestureTapCallback? onTap;

  const DrawerDataListLayout(
      {Key? key,
      this.data,
      this.animationController,
      this.duration,
      this.index,
      this.lastIndex,
      this.onTap})
      : super(key: key);

  @override
  State<DrawerDataListLayout> createState() => _DrawerDataListLayoutState();
}

class _DrawerDataListLayoutState extends State<DrawerDataListLayout> {
  Animation? animation;
  double? start;
  double? end;
  Animation<double>? rotateY;

  @override
  void initState() {
    super.initState();
    start = (widget.duration! * widget.index!).toDouble();
    end = start! + widget.duration!;
    animation = DrawerWidget().animation(
        animationController: widget.animationController!,
        duration: widget.duration!,
        end: end,
        start: start,
        index: widget.index!);

    rotateY = DrawerWidget().rotateY(
        animationController: widget.animationController!,
        duration: widget.duration!,
        end: end,
        start: start,
        index: widget.index!);
    setState(() {});
  }

  Future<void> reverse() async {
    await widget.animationController!.reverse().orCancel;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return DrawerListTile(
          data: widget.data,
          animation: animation!,
          animationController: widget.animationController,
          rotateY: rotateY,
          index: widget.index,
          lastIndex: widget.lastIndex,
          onTap: widget.onTap);
    });
  }
}
