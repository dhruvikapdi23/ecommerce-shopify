import '../../../../config.dart';

class InnerCategoryLayout extends StatelessWidget {
  const InnerCategoryLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InnerCategoryController>(builder: (innerCtrl) {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => innerCtrl.expandBox(index),
            child: ExpandableListView(
              onPressed: () => innerCtrl.expandBox(index),
              index: index,
                childLength : innerCtrl.innerCategoryList[index]['child'].length,
              title: innerCtrl.innerCategoryList[index]['name'].toString(),
              isExpanded: index == innerCtrl.tapped ? innerCtrl.expand : false,
              child: SelectCardList(
                data: innerCtrl.innerCategoryList[index]['child'],
              ),
            ),
          );
        },
        itemCount: innerCtrl.innerCategoryList.length,
      );
    });
  }
}
