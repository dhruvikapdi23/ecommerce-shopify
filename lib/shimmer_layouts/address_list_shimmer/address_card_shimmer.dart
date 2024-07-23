import '../../config.dart';

class AddressCardShimmer extends StatelessWidget {
  const AddressCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return CommonShimmer(
        height: 150,
        width: MediaQuery.of(context).size.width,
        borderRadius: 2,
        color: appCtrl.appTheme.lightGray.withOpacity(.3),
        borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.circle),
            const Space(10, 0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CommonTitleText(),
                const Space(0, 10),
                const CommonTitleText(),
                const Space(0, 10),
                const CommonTitleText(),
                const Space(0, 10),
                Row(
                  children: const [
                    AddressButton(),
                    Space(10, 0),
                    AddressButton(),
                  ],
                ).marginOnly(left: AppScreenUtil().screenWidth(15))
              ],
            ),
          ],
        ).marginSymmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(10)),
      ).marginSymmetric(
          horizontal: AppScreenUtil().screenWidth(15),
          vertical: AppScreenUtil().screenHeight(5));
    });
  }
}
