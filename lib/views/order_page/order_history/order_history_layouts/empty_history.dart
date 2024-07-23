import '../../../../config.dart';

class EmptyHistory extends StatelessWidget {
  const EmptyHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyLayout(
        title: CartFont().emptyTitle, desc: CartFont().emptyDesc);
  }
}
