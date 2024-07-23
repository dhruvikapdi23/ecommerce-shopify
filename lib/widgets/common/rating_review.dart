import 'package:multikart/widgets/common/rating_review_bottom_layout.dart';

import '../../config.dart';

class RatingReview extends StatelessWidget {
  const RatingReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              LatoFontStyle(
                  text: OrderHistoryFont().writeReview,
                  fontSize: FontSizes.f14,
                  fontWeight: FontWeight.w700,
                  color: appCtrl.appTheme.blackColor),
              const Space(0, 10),
              Row(
                children: [
                  LatoFontStyle(
                      text: OrderHistoryFont().yourRating,
                      fontSize: FontSizes.f14,
                      fontWeight: FontWeight.w600,
                      color: appCtrl.appTheme.contentColor,
                      overflow: TextOverflow.clip),
                  const Space(10, 0),
                  Rating(
                    val: 4,
                    onRatingUpdate: (val) {},
                  )
                ],
              ),
              const Space(0, 10),
              CustomTextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 7,
                  minLines: 7)
            ],
          ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
          const RatingReviewBottomLayout()
        ],
      ).height(AppScreenUtil().screenHeight(250));
    });
  }
}
