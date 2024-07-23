import 'package:multikart/config.dart';

var pagesList = <PageListModel>[
  PageListModel(
      title: "OnBoarding",
      desc: "Registration & Splash Screens",
      pageList: [
        PageList(pageName: "OnBoarding",routeName: routeName.onBoarding),
        PageList(pageName: "Login",routeName: routeName.login  ),
        PageList(pageName: "signUp",routeName: routeName.signUp),
        PageList(pageName: "ForgotPassword",routeName: routeName.forgotPassword),
        PageList(pageName: "resetPassword",routeName: routeName.resetPassword),
        PageList(pageName: "Otp",routeName: routeName.otp),
      ]),
  PageListModel(
      title: "Home&Product",
      desc: "Find Products, Banner, Sale",
      pageList: [
        PageList(pageName: "home",routeName: routeName.dashboard),
        PageList(pageName: "categories",routeName: routeName.dashboard),
        PageList(pageName: "InnerCategories",routeName: routeName.innerCategory),
        PageList(pageName: "Search",routeName: routeName.search),
        PageList(pageName: "Shop",routeName: routeName.shopPage),
        PageList(pageName: "products",routeName: routeName.productDetail),
      ]),
  PageListModel(
      title: "Cart, Order & Payment",
      desc: "Add your Products & Placed Order",
      pageList: [
        PageList(pageName: "cart",routeName: routeName.dashboard),
        PageList(pageName: "EmptyCart",routeName: routeName.emptyCart),
        PageList(pageName: "applyCoupons",routeName: routeName.coupons),
        PageList(pageName: "wishlist",routeName: routeName.dashboard),
        PageList(pageName: "addNewAddress",routeName: routeName.addAddress),
        PageList(pageName: "Payment",routeName: routeName.payment),
        PageList(pageName: "Order Success",routeName: routeName.orderSuccess),
      ]),
  PageListModel(
      title: "profileSetting",
      desc: "Check Order History, tracking pages..",
      pageList: [
        PageList(pageName: "profile",routeName: routeName.dashboard),
        PageList(pageName: "profileSetting",routeName: routeName.profileSetting),
        PageList(pageName: "orderHistory",routeName: routeName.orderHistory),
        PageList(pageName: "Order Track",routeName: routeName.orderDetail),
        PageList(pageName: "No Order",routeName: routeName.emptyHistory)
      ]),
  PageListModel(
      title: "Other Pages",
      desc: "Listing of Other Inner Pages",
      pageList: [
        PageList(pageName: "Terms Condition",routeName: routeName.termsCondition),
        PageList(pageName: "Help",routeName: routeName.help),
        PageList(pageName: "aboutUs",routeName: routeName.aboutUs),
        PageList(pageName: "Notification",routeName: routeName.notification)
      ]),
];
