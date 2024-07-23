import '../../../../config.dart';

class CardLayout extends StatelessWidget {
  final dynamic data;
  final int? index, currentIndex;

  const CardLayout({Key? key, this.data, this.index, this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(
        children: [
          Stack(
            children: [
              CardImage(
                  index: index,
                  currentIndex: currentIndex,
                  image: data['image']!),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardBalanceWidget()
                      .cardTypeBanKName(data['cardType'], data['bankName']),
                  const Space(0, 20),
                  Image.asset(imageAssets.chip,
                      height: AppScreenUtil().screenHeight(25)),
                  const Space(0, 20),
                  CardNoLayout(data: data),
                  const Space(0, 20),
                  CardNameAndExpiry(
                      name: data['name'], expiryDate: data['valid'])
                ],
              ).paddingOnly(
                  left: AppScreenUtil().screenWidth(25),
                  right: AppScreenUtil().screenWidth(45),
                  top: AppScreenUtil().screenHeight(20))
            ],
          ),
          const Space(0, 20),
          Row(
            children: [
              CardBalanceWidget().buttonLayout(CommonTextFont().remove.toUpperCase()),
              CardBalanceWidget().buttonLayout(CommonTextFont().edit.toUpperCase(),isMargin: true),
            ],
          )
        ],
      );
    });
  }
}
