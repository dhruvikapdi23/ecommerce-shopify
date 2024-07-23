import '../../../../config.dart';

class AttributeOption extends StatelessWidget {
  final dynamic data;
  final Animation<double>? animation;
  const AttributeOption({Key? key,this.data,this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      builder: (productCtrl) {
        return Container(
          margin: EdgeInsets.only(
              right: AppScreenUtil().screenWidth(10),
              top: AppScreenUtil().screenHeight(10)),
          height: AppScreenUtil().screenHeight(35),
          width: AppScreenUtil().screenWidth(35),
          decoration: BoxDecoration(
              color: Color(int.parse("0xFF$data")),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(
                    1.0,
                    1.0,
                  ),
                  blurRadius: 8.0,
                  spreadRadius: 1.0,
                ),
              ],
              shape: BoxShape.circle),
          child: Container(
              padding: EdgeInsets.all(AppScreenUtil().size(8)),
              child: productCtrl.selectedColor == data
                  ? AnimatedCheck(
                progress: animation!,
                color: appCtrl.isTheme
                    ? productCtrl
                    .appCtrl.appTheme.whiteColor
                    : productCtrl
                    .appCtrl.appTheme.blackColor,
                size: 40,
                strokeWidth: 1.2,
              )
                  : Container()),
        );
      }
    );
  }
}
