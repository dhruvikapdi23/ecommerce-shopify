import '../../../../config.dart';

class TermsConditionCard extends StatelessWidget {
  final TermsAndConditionModel? termsAndConditionModel;

  const TermsConditionCard({Key? key, this.termsAndConditionModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TermsConditionWidget().commonText(
              termsAndConditionModel!.title.toString(), FontWeight.w600),
          const Space(0, 20),
          ...termsAndConditionModel!.description!.map((description) {
            return TermsConditionDescription(
              description: description,
            );
          }).toList()
        ],
      );
    });
  }
}
