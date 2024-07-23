import '../../../../config.dart';

class EmptyCart extends StatelessWidget {
  final String? title;
  final String? description;

  const EmptyCart({Key? key, this.title, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyLayout(
        title: appCtrl.selectedIndex == 3
            ? CartFont().emptyWishlistTitle
            : CartFont().emptyTitle,
        desc: appCtrl.selectedIndex == 3
            ? CartFont().emptyWishlistDesc
            : CartFont().emptyDesc);
  }
}
