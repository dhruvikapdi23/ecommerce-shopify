import '../../config.dart';

class CommonShimmer extends StatelessWidget {
  final Color? color;
  final Color? borderColor;
  final double borderRadius;
  final double? height;
  final double? width;
  final Widget? child;
  const CommonShimmer({Key? key,this.color,this.width,this.borderRadius = 5,this.child,this.height,this.borderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor!),
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(borderRadius))
      ),
      height: AppScreenUtil().screenHeight(height!),
      width: AppScreenUtil().screenWidth(width!),
      child: child,
    );
  }
}
