import '../../../../config.dart';

class CardNoLayout extends StatelessWidget {
  final dynamic data;
  const CardNoLayout({Key? key,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CardBalanceWidget().commonFontText(data['cardNo1'].substring(0,4),fontSize: FontSizes.f18),
        CardBalanceWidget().commonFontText(data['cardNo1'].substring(4,8),fontSize: FontSizes.f18),
        CardBalanceWidget().commonFontText(data['cardNo1'].substring(8,12),fontSize: FontSizes.f18),
        CardBalanceWidget().commonFontText(data['cardNo1'].substring(12,16),fontSize: FontSizes.f18),
      ],
    );
  }
}
