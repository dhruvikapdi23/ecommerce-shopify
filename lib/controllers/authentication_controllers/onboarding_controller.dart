import 'package:carousel_slider/carousel_state.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multikart/config.dart';
import 'package:multikart/models/onboarding_model.dart';

class OnBoardingController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  int current = 0;
  bool isBack = false;
  final CarouselController controller = CarouselController();
  CarouselState? carouselState;
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.8);
  List imgList = [];
  final storage = GetStorage();

  @override
  void onReady() async {
    imgList = AppArray().onBoardingList;
    isBack = Get.arguments ?? false;
    update();
    pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    super.onReady();
  }

  //read intro
  readIntroPage() async {
    await storage.write(Session.isIntro, true);
    update();
    Get.toNamed(routeName.dashboard);
  }

  //read intro
  navigateLoginPage() async {
    await storage.write(Session.isIntro, true);
    update();
    Get.toNamed(routeName.login);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    update();
    super.dispose();
  }
}
