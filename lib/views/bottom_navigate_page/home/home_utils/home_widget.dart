import 'package:multikart/config.dart';

class HomeWidget {
  //banner image
  Widget bannerImage(image, context) => ClipRRect(
      borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(6)),
      child: Image.network(
        image,
        fit: BoxFit.cover,
        height: AppScreenUtil().screenHeight(165),
        width: MediaQuery.of(context).size.width,
      ));

  //deals of the day card layout
  Widget dealsOfTheDayCardLayout(
          {Widget? child, int? index, context, var greyLight25}) =>
      Container(
          margin: EdgeInsets.only(
            top: AppScreenUtil().screenHeight(index == 0 ? 10 : 0),
            bottom: AppScreenUtil().screenHeight(10),
          ),
          padding: EdgeInsets.symmetric(
              vertical: AppScreenUtil().screenHeight(8),
              horizontal: AppScreenUtil().screenHeight(8)),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: greyLight25,
              borderRadius:
                  BorderRadius.circular(AppScreenUtil().borderRadius(5))),
          child: child);

  //image layout
  Widget imageLayout(image) => ClipRRect(
        borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(3)),
        child: FadeInImageLayout(
          image: image,
          fit: BoxFit.contain,
          height: AppScreenUtil().size(80),
          width: AppScreenUtil().size(82),
        ),
      );
}
