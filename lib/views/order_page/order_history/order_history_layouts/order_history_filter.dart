
import '../../../../config.dart';

class OrderHistoryFilter extends StatelessWidget {
  const OrderHistoryFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHistoryController>(builder: (orderHistoryCtrl) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderHistoryWidget().orderHistoryFilterTitle(FilterFont().filters),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ...orderHistoryCtrl.orderType.asMap().entries.map((e) {
                      return OrderHistoryFilterLayout(onTap: () {
                        orderHistoryCtrl.orderTypeValue = e.key;
                        orderHistoryCtrl.update();
                      },text: e.value['title'],index: e.key,value: orderHistoryCtrl.orderTypeValue,);
                    }).toList(),
                  ],
                ),
                const Space(0, 20),
                OrderHistoryWidget().orderHistoryFilterTitle(FilterFont().timeFilters),
                ...orderHistoryCtrl.timeFilterType.asMap().entries.map((e) {
                  return OrderHistoryFilterLayout(onTap: () {
                    orderHistoryCtrl.timeFilterTypeValue = e.key;
                    orderHistoryCtrl.update();
                  },text: e.value['title'],index: e.key,value: orderHistoryCtrl.timeFilterTypeValue,);
                }).toList()
              ],
            ).marginSymmetric(vertical: AppScreenUtil().screenHeight(15)),
            BottomLayout(
                firstButtonText: CardBalanceFont().back.toUpperCase(),
                secondButtonText: CouponFont().apply.toUpperCase(),
                firstTap: ()=> Get.back(),
                secondTap: ()=> Get.back()
            )
          ],
        ),
      );
    });
  }
}
