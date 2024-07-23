import 'dart:developer';

import 'package:multikart/config.dart';
import 'package:multikart/controllers/spalsh_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final splashCtrl = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (_) {
      return StreamBuilder(
          stream: FirebaseFirestore.instance.collection("config").snapshots(),
          builder: (context, snapShot) {
            return Scaffold(
              body: Center(
                child: Center(
                  child: AnimatedContainer(
                    height: splashCtrl.isTapped
                        ? AppScreenUtil().screenHeight(220.0)
                        : AppScreenUtil().screenHeight(100.0),
                    width: splashCtrl.isTapped
                        ? AppScreenUtil().screenHeight(220.0)
                        : AppScreenUtil().screenHeight(100.0),
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    child: Hero(
                        tag: 'cat',
                        child: snapShot.data != null
                            ? snapShot.data!.docs[0].data()["splashLogo"] != ""
                                ? Image.network(
                                    snapShot.data!.docs[0].data()["splashLogo"],
                                    height: 100,
                                    width: 100)
                                : Image.asset(imageAssets.logo)
                            : Image.asset(imageAssets.logo)),
                  ),
                ),
              ),
            );
          });
    });
  }
}
