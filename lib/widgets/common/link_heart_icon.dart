import 'package:like_button/like_button.dart';

import '../../config.dart';

class LinkHeartIcon extends StatelessWidget {
  final LikeButtonTapCallback? onTap;
  final bool? isLiked;
  const LinkHeartIcon({Key? key, this.onTap, this.isLiked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        width: AppScreenUtil().screenWidth(30),
        height: AppScreenUtil().screenHeight(30),
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().size(5),
            vertical: AppScreenUtil().size(5)),
        decoration: BoxDecoration(
          color: appCtrl.appTheme.bgColor,
          shape: BoxShape.circle,
        ),
        child: LikeButton(
          likeCountPadding: EdgeInsets.zero,
          isLiked: isLiked,
          size: AppScreenUtil().size(15),
          circleColor: CircleColor(
            start: Colors.white,
            end: appCtrl.appTheme.primary,
          ),
          onTap: onTap,
          bubblesColor: BubblesColor(
            dotPrimaryColor: appCtrl.appTheme.contentColor,
            dotSecondaryColor: appCtrl.appTheme.primary,
          ),
          bubblesSize: AppScreenUtil().size(45),
          likeBuilder: (bool isLiked) {
            return isLiked ? const HeartColor() : const HeartIcon();
          },
        ),
      );
    });
  }
}
