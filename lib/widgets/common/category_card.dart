import '../../config.dart';

class CategoryCard extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? onTap;
  const CategoryCard({Key? key, this.onTap, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return InkWell(
        onTap: () => appCtrl.goToProductDetail(data),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: AppScreenUtil().screenHeight(120),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: AppScreenUtil().screenHeight(100),
                    width: AppScreenUtil().screenWidth(110),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          AppScreenUtil().borderRadius(5)),
                      color: appCtrl.appTheme.lightGray,
                    ),
                  ),
                  Image.asset(
                    data['image'],
                    fit: BoxFit.fill,
                    height: AppScreenUtil().screenHeight(120),
                  )
                ],
              ),
            ),
            const Space(0, 10),
            LatoFontStyle(
              text: data['title'],
              fontSize: 14,
            )
          ],
        ),
      );
    });
  }
}
