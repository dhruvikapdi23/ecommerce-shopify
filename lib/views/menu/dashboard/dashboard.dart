import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:multikart/config.dart';
import 'package:multikart/views/menu/drawer/drawer_screen.dart';
import 'dart:developer';
import 'package:multikart/views/menu/dashboard/app_bar_title.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log('Handling a background message ${message.messageId}');
  log(message.data.toString());
}

/// Create a [AndroidNotificationChannel] for heads up notifications
AndroidNotificationChannel? channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  final dashboardCtrl = Get.put(DashboardController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
//animation
    dashboardCtrl.drawerSlideController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));
  }

  Future<void> initNotification() async {
    log('initCall');
    //when app in background
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // titledescription
        importance: Importance.high,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await flutterLocalNotificationsPlugin!
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel!);
    }

    //when app is [closed | killed | terminated]
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        log("Notification On InitMsg");
        log("message : $message");
        //Navigator.pushNamed(context, '/result', arguments: message.data);
        _notificationNavigateToItemDetail(message);
      }
    });

    var initialzationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(
      android: initialzationSettingsAndroid,
    );

    flutterLocalNotificationsPlugin!.initialize(initializationSettings);
    log('initCheck');
    //when app in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('message : $message');
      RemoteNotification notification = message.notification!;

      AndroidNotification? android = message.notification?.android;
      if (android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin!.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel!.id,
                channel!.name,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ));
      }
      _notificationNavigateToItemDetail(message);
      //Navigator.pushNamed(context, '/result', arguments: message.data);
    });

    //when app in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('A new onMessageOpenedApp event was published!');
      log("message");
      _notificationNavigateToItemDetail(message);
    });
    requestPermissions();
  }

  //on click navigate to alert screeb
  void _notificationNavigateToItemDetail(RemoteMessage message) async {
    log("Call Notification");
  }

  requestPermissions() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      announcement: true,
      carPlay: true,
      criticalAlert: true,
    );

    log("settings.authorizationStatus : ${settings.authorizationStatus}");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if(scaffoldKey.currentState != null) {
      scaffoldKey.currentState!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (_) {
      return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Directionality(
              textDirection: dashboardCtrl.appCtrl.isRTL ||
                      dashboardCtrl.appCtrl.languageVal == "ar"
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: Scaffold(
                  key: scaffoldKey,
                  drawer: const DrawerScreen(),
                  appBar: HomeProductAppBar(
                    onTap: () async {
                      if (dashboardCtrl.appCtrl.selectedIndex == 0) {
                        scaffoldKey.currentState!.openDrawer();
                      } else {
                        dashboardCtrl.appBarLeadingAction();
                      }
                    },
                    titleChild: dashboardCtrl.appCtrl.selectedIndex == 0
                        ? const LogoImage()
                        : const AppBarTitle(),
                  ),
                  body: dashboardCtrl.appCtrl.widgetOptions
                      .elementAt(dashboardCtrl.appCtrl.selectedIndex),
                  bottomNavigationBar: CommonBottomNavigation(
                      onTap: (val) => dashboardCtrl.bottomNavigationChange(
                          val, context)))));
    });
  }
}
