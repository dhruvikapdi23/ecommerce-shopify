import '../../../config.dart';

class PageList extends StatelessWidget {
  final pageListCtrl = Get.put(PageListController());

  PageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PageListController>(builder: (_) {
      return Directionality(
        textDirection: pageListCtrl.appCtrl.isRTL ||
                pageListCtrl.appCtrl.languageVal == "ar"
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
              centerTitle: false,
              automaticallyImplyLeading: false,
              leading: const BackArrowButton(),
              elevation: 0,
              backgroundColor: pageListCtrl.appCtrl.appTheme.whiteColor,
              title: LatoFontStyle(
                  color: pageListCtrl.appCtrl.appTheme.blackColor,
                  text: CommonTextFont().pages)),
          body: pageListCtrl.appCtrl.isShimmer
              ? const PagesListShimmer()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      //all page list
                      ...pageListCtrl.pageListModel.map((e) {
                        return PageListLayout(
                          pageListModel: e,
                        );
                      }).toList()
                    ],
                  ).marginSymmetric(
                      horizontal: AppScreenUtil().screenWidth(15)),
                ),
        ),
      );
    });
  }
}
