import '../../../../config.dart';

class DrawerWidget{

  Animation animation({AnimationController? animationController,int? index, double? start,
  double? end,double? duration}){
    return Tween<double>(
      begin: 1.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Interval(
          index! == 0 ? start! : start!- duration!/2,
          index == 0 ? end! + duration! : end! + duration!/2,
          curve: Curves.easeIn,
        ),
      ),
    )..addListener((){

    });
  }


  Animation<double> rotateY({AnimationController? animationController,int? index, double? start,
    double? end,double? duration}){
    return Tween<double>(
      begin: -0.5,
      end: .0,
    ).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Interval(
          index! == 0 ? start!: start! - duration!/2,
          index == 0 ? end! + duration! : end! + duration!/2,
          curve: Curves.easeIn,
        ),
      ),
    );
  }
}