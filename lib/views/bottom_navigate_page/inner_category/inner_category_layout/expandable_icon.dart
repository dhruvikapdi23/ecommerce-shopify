import '../../../../config.dart';

class ExpandableIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool? isExpanded;
  const ExpandableIcon({Key? key,this.isExpanded,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
        builder: (appCtrl) {
          return IconButton(
              icon: Icon(
                isExpanded!
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: appCtrl.appTheme.contentColor,
                size: AppScreenUtil().size(18),
              ),
              onPressed: onPressed);
        }
    );
  }
}
