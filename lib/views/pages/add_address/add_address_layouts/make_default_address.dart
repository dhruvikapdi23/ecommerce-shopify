import '../../../../config.dart';

class MakeDefaultAddress extends StatelessWidget {
  const MakeDefaultAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAddressController>(builder: (addAddressCtrl) {
      return Row(children: [
        IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                transitionBuilder: (child, anim) => RotationTransition(
                    turns: child.key == const ValueKey('icon1')
                        ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                        : Tween<double>(begin: 0.75, end: 1).animate(anim),
                    child: ScaleTransition(scale: anim, child: child)),
                child: addAddressCtrl.isChecked
                    ? Icon(Icons.check_box,
                        color: addAddressCtrl.appCtrl.appTheme.primary)
                    : Icon(Icons.check_box_outline_blank,
                        color: addAddressCtrl.appCtrl.appTheme.borderColor,
                        key: const ValueKey('icon2'))),
            onPressed: () {
              addAddressCtrl.isChecked = !addAddressCtrl.isChecked;
              addAddressCtrl.update();
            }),
        const Space(10, 20),
        LatoFontStyle(
            text: AddAddressFont().makeDefaultAddress,
            fontSize: FontSizes.f14,
            color: addAddressCtrl.appCtrl.appTheme.contentColor)
      ]).marginSymmetric(vertical: Insets.i20);
    });
  }
}
