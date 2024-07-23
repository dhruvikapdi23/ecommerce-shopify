import '../../config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("config").snapshots(),
        builder: (context, snapShot) {
          return snapShot.data != null
              ? snapShot.data!.docs[0].data()["splashLogo"] != ""
                  ? Image.network(snapShot.data!.docs[0].data()["splashLogo"],
                      height: 100, width: 100)
                  : Image.asset(
                      imageAssets.logo,
                      fit: BoxFit.contain,
                      width: AppScreenUtil().screenWidth(110),
                    )
              : Image.asset(
                  imageAssets.logo,
                  fit: BoxFit.contain,
                  width: AppScreenUtil().screenWidth(110),
                );
        });
  }
}
