import 'package:multikart/config.dart';

class DeliveryData extends StatelessWidget {
  final List<ExpectedDelivery>? expectedDelivery;
  const DeliveryData({Key? key, this.expectedDelivery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...expectedDelivery!.map((e) {
          return DeliveryDetailCard(
            expectedDelivery: e,
          );
        }).toList()
      ],
    );
  }
}
