import '../../../../config.dart';

class CustomValueLayout extends StatelessWidget {
  final String? val;
  const CustomValueLayout({Key? key,this.val}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(
      builder: (filterCtrl) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...filterCtrl.data.asMap().entries.map((e) {
              return (val ==
                  e.value["val"].toString())
                  ? Container(
                height: AppScreenUtil().screenHeight(25),
                width: AppScreenUtil().size(45),
                decoration: BoxDecoration(
                    color: const Color(0xFFFF4C3B).withOpacity(.2),
                    borderRadius: BorderRadius.circular(
                        AppScreenUtil().borderRadius(5))),
                padding:
                EdgeInsets.all(AppScreenUtil().size(5)),
                alignment: Alignment.center,
                child: Text(
                    "${appCtrl.priceSymbol}$val"),
              )
                  : Container();
            }).toList()
          ],
        );
      }
    );
  }
}
