import '../../../../config.dart';

class ColorLayout extends StatefulWidget {
  const ColorLayout({Key? key}) : super(key: key);

  @override
  State<ColorLayout> createState() => _ColorLayoutState();
}

class _ColorLayoutState extends State<ColorLayout>
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
    return GetBuilder<ShopController>(builder: (shopCtrl) {
      return GetBuilder<FilterController>(builder: (filterCtrl) {
        return Wrap(
          children: [
            ...filterCtrl.colorList.asMap().entries.map((e) {
              return Container(
                margin: EdgeInsets.only(
                    right: AppScreenUtil().screenWidth(10),
                    top: AppScreenUtil().screenHeight(10)),
                height: AppScreenUtil().screenHeight(32),
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
                    child: filterCtrl.selectedColor.contains(e.value)
                        ? AnimatedCheck(
                            progress: _animation!,
                            color: e.value != "000000"
                                ? appCtrl.appTheme.blackColor
                                : appCtrl.appTheme.whiteColor,
                            size: 40,
                            strokeWidth: 1.2,
                          )
                        : Container()),
              ).gestures(onTap: () {
                filterCtrl.selectedColor.contains(e.value)
                    ? filterCtrl.selectedColor.remove(e.value)
                    : filterCtrl.selectedColor.add(e.value);
                _animationController!.reset();
                _animationController!.forward();
                shopCtrl.selectColorTap(e.value);
                filterCtrl.update();
              });
            }).toList()
          ],
        ).marginOnly(bottom: AppScreenUtil().screenHeight(50));
      });
    });
  }
}
