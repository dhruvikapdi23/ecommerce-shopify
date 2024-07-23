import '../../../../config.dart';
import 'dart:math' as math;

class DrawerListTile extends StatelessWidget {
  final dynamic data;
  final AnimationController? animationController;
  final Animation? animation;
  final Animation<double>? rotateY;
  final int? index;
  final int? lastIndex;
  final GestureTapCallback? onTap;

  const DrawerListTile(
      {Key? key,
      this.data,
      this.animationController,
      this.animation,
      this.rotateY,
      this.index,
      this.lastIndex,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return AnimatedBuilder(
          animation: animationController!,
          builder: (context, child) {
            final card = Opacity(
              opacity: animation!.value,
              child: DrawerCard(
                data: data,
                index: index,
                lastIndex: lastIndex,
                onTap: onTap,
              ),
            );

            return Transform(
              transform: Matrix4.rotationY(rotateY!.value * math.pi),
              alignment: Alignment.centerLeft,
              child: card,
            );
          });
    });
  }
}
