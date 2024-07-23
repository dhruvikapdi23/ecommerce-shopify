import '../../../../config.dart';

class ExpandableListView extends StatelessWidget {
  final int? index;
  final int? childLength;
  final String? title;
  final bool? isExpanded;
  final VoidCallback? onPressed;
  final Widget? child;

  const ExpandableListView(
      {Key? key,
      this.index,
      this.childLength,
      this.child,
      this.title,
      this.onPressed,
      this.isExpanded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        InkWell(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LatoFontStyle(
                    text: title,
                    fontSize: FontSizes.f14,
                    fontWeight: FontWeight.w700),
                ExpandableIcon(
                  onPressed: onPressed,
                  isExpanded: isExpanded,
                ),
              ],
            ),
          ),
        ),
        ChildExpandable(
            collapsedHeight: 0.0,
            expandedHeight:childLength! >= 10 ? 330 : childLength! >= 5 ? 180 : childLength! <= 3 ? 150 :200,
            expanded: isExpanded,
            child: child)
      ],
    );
  }
}
