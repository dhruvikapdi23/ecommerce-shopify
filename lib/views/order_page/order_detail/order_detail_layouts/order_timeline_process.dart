import '../../../../config.dart';

class OrderTimeLineProcess extends StatelessWidget {
  const OrderTimeLineProcess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(builder: (orderDetailCtrl) {
      return FixedTimeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          color: orderDetailCtrl.appCtrl.appTheme.borderColor,
          indicatorTheme: const IndicatorThemeData(position: 0, size: 20.0),
          connectorTheme: const ConnectorThemeData(thickness: 2.5),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemCount: AppArray().orderTrack.length,
          contentsBuilder: (_, index) {
            return TimeLineContent(data: AppArray().orderTrack[index]);
          },
          indicatorBuilder: (_, index) {
            if (AppArray().orderTrack[index]['isCompete'] == true) {
              return OrderDetailWidget().dotIndicator();
            } else {
              return const OutlinedDotIndicator(borderWidth: 2.5);
            }
          },
          connectorBuilder: (_, index, ___) {
            return SolidLineConnector(
                thickness: 1,
                color: (AppArray().orderTrack[index - 1]['isCompete'] == true)
                    ? orderDetailCtrl.appCtrl.appTheme.primary
                    : orderDetailCtrl.appCtrl.appTheme.borderColor);
          },
        ),
      ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(35));
    });
  }
}
