import '../../../../config.dart';

class TermsConditionDescription extends StatelessWidget {
  final Description? description;

  const TermsConditionDescription({Key? key, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TermsConditionWidget().commonSubTitle(description!.title),
          if (description!.subTitle != null)
            ...description!.subTitle!.map((e) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: const Offset(0, -8),
                    child: LatoFontStyle(
                      text: '•',
                      fontSize: AppScreenUtil().fontSize(20),
                      color: appCtrl.appTheme.contentColor,
                    ),
                  ),
                  const Space(10, 0),
                  Expanded(
                    child: TermsConditionWidget()
                        .commonSubTitle(e.title),
                  ),
                ],
              );
            }).toList()
        ],
      );
    });
  }
}
