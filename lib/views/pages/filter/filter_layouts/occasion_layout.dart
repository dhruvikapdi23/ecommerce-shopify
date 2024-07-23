import '../../../../config.dart';

class OccasionLayout extends StatelessWidget {
  const OccasionLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<FilterController>(
        builder: (filterCtrl) {
          return GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: filterCtrl.occasionFilterList.length,
            itemBuilder: (context, index) {
              return FindYourStyleCategoryCard(
                index: index,
                isHomePage: false,
                selectedStyleCategory: filterCtrl.selectedOccasion,
                data: filterCtrl.occasionFilterList[index],
                onTap: () => filterCtrl.selectOccasionFunction(index)
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / (6.5)),
            ),
          );
        }
    );
  }
}
