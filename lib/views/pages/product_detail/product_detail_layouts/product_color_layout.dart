import '../../../../config.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;

class ProductColorLayout extends StatefulWidget {
  final product_model.Product? product;

  const ProductColorLayout({Key? key, this.product}) : super(key: key);

  @override
  State<ProductColorLayout> createState() => _ProductColorLayoutState();
}

class _ProductColorLayoutState extends State<ProductColorLayout>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController!, curve: Curves.easeInOutCirc));

    _animationController!.reset();
    _animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productCtrl) {
      return widget.product != null? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var attr in widget.product!.attributes!)
            attr.name == 'Color'
                ? ProductDetailWidget().commonText(
                    text: ProductDetailFont().selectColor,
                    fontSize: FontSizes.f14)
                : Container(),
          Wrap(
            children: [
              for (var attr in widget.product!.attributes!)
                ...attr.options!.asMap().entries.map((e) {
                  return attr.name == 'Color'
                      ? Container(
                          margin: EdgeInsets.only(
                              right: AppScreenUtil().screenWidth(10),
                              top: AppScreenUtil().screenHeight(10)),
                          height: AppScreenUtil().screenHeight(35),
                          width: AppScreenUtil().screenWidth(35),
                          decoration: BoxDecoration(
                              color: Color(int.parse("0xFF${e.value}")),
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
                              child: productCtrl.selectedColor == e.key
                                  ? AnimatedCheck(
                                      progress: _animation!,
                                      color: appCtrl.isTheme
                                          ? productCtrl
                                              .appCtrl.appTheme.whiteColor
                                          : productCtrl
                                              .appCtrl.appTheme.blackColor,
                                      size: 40,
                                      strokeWidth: 1.2,
                                    )
                                  : Container()),
                        ).gestures(onTap: () {
                          _animationController!.reset();
                          _animationController!.forward();
                          productCtrl.selectedColor = e.key;
                          productCtrl.imagesList = [];
                          productCtrl.colorSelected =
                              int.parse(e.value.id.toString());
                          productCtrl.update();
                        })
                      : Container();
                }).toList()
            ],
          ).marginOnly(left: AppScreenUtil().screenWidth(15))
        ],
      ): Container();
    });
  }
}
