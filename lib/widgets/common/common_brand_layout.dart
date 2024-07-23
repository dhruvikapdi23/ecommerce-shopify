import '../../config.dart';

class CommonBrandLayout extends StatelessWidget {
  const CommonBrandLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: AppArray().innerCategoryBrandList.length,
      itemBuilder: (context, index) {
        return BrandCard(
          data: AppArray().innerCategoryBrandList[index],
          index: index,
          lastIndex: AppArray().innerCategoryBrandList.length - 1,
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 0,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / (3.5)),
      ),
    );
  }
}
