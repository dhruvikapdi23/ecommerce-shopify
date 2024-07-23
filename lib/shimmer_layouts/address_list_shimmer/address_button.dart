import '../../config.dart';

class AddressButton extends StatelessWidget {
  const AddressButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return CommonShimmer(
          height: 20,
          width: 100,
          borderRadius: 2,
          color: appCtrl.appTheme.lightGray.withOpacity(.3),
          borderColor:
          appCtrl.appTheme.lightGray.withOpacity(.3),
        );
      }
    );
  }
}
