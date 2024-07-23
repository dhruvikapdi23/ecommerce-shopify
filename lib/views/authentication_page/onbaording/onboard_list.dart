import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../config.dart';

class OnBoardList extends StatelessWidget {
  const OnBoardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(builder: (onBoardingCtrl) {
      return Scaffold(
        backgroundColor: Colors.transparent,
          body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("onBoardScreen")
                  .snapshots(),
              builder: (context, snapShot) {
                if (snapShot.data != null) {
                  if (snapShot.data!.docs.isNotEmpty) {
                    List currentImage = [];
                    List onBoardingImages =
                        snapShot.data!.docs[0].data()["images"];
                    String title = snapShot.data!.docs[0].data()["title"];
                    String description =
                        snapShot.data!.docs[0].data()["description"];
                    currentImage = onBoardingImages.isNotEmpty
                        ? onBoardingImages
                        : onBoardingCtrl.imgList;
                    return snapShot.data != null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CarouselSlider(
                                  options: CarouselOptions(
                                      viewportFraction: 0.72,
                                      enlargeStrategy:
                                          CenterPageEnlargeStrategy.height,
                                      enlargeCenterPage: true,
                                      scrollDirection: Axis.horizontal,
                                      autoPlay: true,
                                      onPageChanged: (index, reason) {
                                        onBoardingCtrl.current = index;
                                        onBoardingCtrl.update();
                                      },
                                      height:
                                          AppScreenUtil().screenHeight(360)),
                                  items: currentImage
                                      .asMap()
                                      .entries
                                      .map((item) =>
                                          GetBuilder<OnBoardingController>(
                                              builder: (_) {
                                            return OnBoardWidget()
                                                .networkImageLayout(
                                                    item.value.toString());
                                          }))
                                      .toList()),
                              const Space(0, 10),
                              OnBoardData(
                                title: title,
                                description: description,
                              ),
                            ],
                          )
                        : Container();
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        Expanded(
                          child: CarouselSlider(
                          
                              options: CarouselOptions(
                                  viewportFraction: 0.72,
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.height,
                                  enlargeCenterPage: true,
                          
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: true,
                                  onPageChanged: (index, reason) {
                                    onBoardingCtrl.current = index;
                                    onBoardingCtrl.update();
                                  },
                          
                                  height: AppScreenUtil().screenHeight(360)),
                              items: onBoardingCtrl.imgList
                                  .asMap()
                                  .entries
                                  .map((item) => GetBuilder<OnBoardingController>(
                                          builder: (_) {
                                        return OnBoardWidget().imageLayout(
                                            item.value.image.toString());
                                      }))
                                  .toList()),
                        ),
                        const Space(0, 10),
                        OnBoardData(),
                      ],
                    );
                  }
                } else {
                  return Container();
                }
              }));
    });
  }
}
