import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../config.dart';

class Rating extends StatelessWidget {
  final double? val;
  final ValueChanged<double>? onRatingUpdate;

  const Rating({Key? key, this.val, this.onRatingUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return RatingBar.builder(
        itemSize: AppScreenUtil().size(18.0),
        initialRating: val!,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        glowColor: appCtrl.appTheme.ratingColor,
        unratedColor: appCtrl.appTheme.lightGray,
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: onRatingUpdate!,
      );
    });
  }
}
