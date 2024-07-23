import '../../../../config.dart';

class RemoveEditLayout extends StatelessWidget {
  final int? index;
  final int? selectRadio;

  const RemoveEditLayout({Key? key, this.selectRadio, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Row(
        children: [
          ActionButton(
              index: index,
              selectRadio: selectRadio,
              text: CommonTextFont().remove.toUpperCase()),
          const Space(10, 0),
          ActionButton(
              index: index,
              selectRadio: selectRadio,
              text: CommonTextFont().edit.toUpperCase()),
        ],
      );
    });
  }
}
