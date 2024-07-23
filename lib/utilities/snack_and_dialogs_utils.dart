import '../config.dart';
import '../routes/screen_list.dart';

snackBar(message, {duration,context}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: AppCss.h2.copyWith(color: Colors.white),
    ),
    duration: const Duration(milliseconds: 1000),
    action: SnackBarAction(
      label: "ok",
      onPressed: () => ScaffoldMessenger.of(context).clearSnackBars(),
    ),
  );

  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);

  //ex : helper.snackBar('alert message');
}

snackBarWithAction(message, context) {
  final snackBar = SnackBar(
    content: const Text('Yay! A SnackBar!'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);

  //ex : helper.snackBar('alert message');
}

dialogMessage(
  String message, {
  String title = "Multikart",
  required VoidCallback onConfirm,
  VoidCallback? onCancel,
  bool barrierDismissible = true,
}) {
  return Get.defaultDialog(
    title: title,
    middleText: message,
    onConfirm: onConfirm,
    titleStyle: AppCss.h2,
    middleTextStyle: AppCss.body2,
    confirmTextColor: Colors.white,
    //buttonColor: appColor.primary,
    onCancel: onCancel,
    barrierDismissible: barrierDismissible,
  );

  //ex : helper.dialogMessage('dialog message', (){});
}

appUpdateDialog(
  String message, {
  required VoidCallback onConfirm,
  VoidCallback? onCancel,
  bool forceUpdate = false,
}) {
  return Get.defaultDialog(
    title: trans('App Update'),
    middleText: message,
    titleStyle: AppCss.h2,
    barrierDismissible: !forceUpdate,
    middleTextStyle: AppCss.body2,
    contentPadding:
        const EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20),
    titlePadding: const EdgeInsets.only(top: 15),
    onWillPop: forceUpdate == true ? () async => false : null,
    actions: [
      if (!forceUpdate)
        ElevatedButton(
          onPressed: onCancel,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            elevation: MaterialStateProperty.resolveWith<double>(
              // As you said you dont need elevation. I'm returning 0 in both case
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return 0;
                }
                return 0; // Defer to the widget's default.
              },
            ),
          ),
          child: Text(
            trans('cancel'),
            style: AppCss.h2.copyWith(color: Colors.grey),
          ),
        ),
      ElevatedButton(
        onPressed: onConfirm,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          elevation: MaterialStateProperty.resolveWith<double>(
            // As you said you don't need elevation. I'm returning 0 in both case
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return 0;
              }
              return 0; // Defer to the widget's default.
            },
          ),
        ),
        child: Text(
          trans('update'),
          style: AppCss.h2,
        ),
      ),
    ],
  );
}

deleteConfirmation(
    {context, title, message, onConfirm, bool barrierDismissible = true}) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(trans('cancel'), style: AppCss.body3),
    onPressed: () {
      Get.back();
    },
  );
  Widget continueButton = TextButton(
    onPressed: onConfirm,
    child: Text(trans('continue')),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title ?? trans('delete_confirmation'), style: AppCss.h2),
    content: Text(message ?? trans('are_you_sure_delete'), style: AppCss.body2),
    actions: [cancelButton, continueButton],
  );

  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return alert;
    },
  );

  // ex: helper.deleteConfirmation(context, (){ print('clicked'); });
}

sendOtp() async {
  Get.generalDialog(
    pageBuilder: (context, anim1, anim2) {
      return Align(
        alignment: Alignment.center,
        child: Container(
          height: AppScreenUtil().screenHeight(250),
          margin:
              EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(12)),
          child: OtpScreen(),
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, -1), end: const Offset(0, 0))
            .animate(anim1),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}
