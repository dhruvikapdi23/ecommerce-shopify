import 'package:multikart/config.dart';

class CardBalance extends StatelessWidget {
  final cardCtrl = Get.put(CardBalanceController());

  CardBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CardBalanceController>(builder: (context) {
      return Directionality(
        textDirection:
            cardCtrl.appCtrl.isRTL || cardCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
              centerTitle: false,
              elevation: 0,
              automaticallyImplyLeading: false,
              leading: const BackArrowButton(),
              backgroundColor: cardCtrl.appCtrl.appTheme.whiteColor,
              title: LatoFontStyle(
                  text: CardBalanceFont().payment,
                  color: cardCtrl.appCtrl.appTheme.blackColor)),
          body: Stack(alignment: Alignment.bottomCenter, children: [
            SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  //card slider layout
                  CarouselSlider.builder(
                    options: CarouselOptions(
                        autoPlay: false,
                        aspectRatio: 10.2 / 8,
                        viewportFraction: .90,
                        onPageChanged: (index, reason) {
                          cardCtrl.currentIndex = index;
                          cardCtrl.update();
                        }),
                    itemCount: AppArray().cardList.length,
                    itemBuilder:
                        (BuildContext context, int index, int pageViewIndex) {
                      return CardLayout(
                          data: AppArray().cardList[index],
                          index: index,
                          currentIndex: cardCtrl.currentIndex);
                    },
                  ),
                  const BorderLineLayout(),
                  const Space(0, 20),

                  //wallet layout
                  const WalletLayout()
                ]).marginOnly(bottom: AppScreenUtil().screenHeight(50))),
            //back and add new card layout
            BottomLayout(
                firstButtonText: CardBalanceFont().back,
                secondButtonText: CardBalanceFont().addNewCard,
                isBorderButton: false,
                firstTap: () => Get.back(),
                secondTap: () => Get.back())
          ]),
        ),
      );
    });
  }
}
