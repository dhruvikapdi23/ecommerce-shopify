import 'package:get/get.dart';
import 'package:multikart/views/checkout/payment/checkout_webview_screen.dart';
import 'package:multikart/views/checkout/payment/payment_method/payment_method.dart';
import 'package:multikart/views/checkout/shipping_method/shipping_method.dart';

//app file

import 'route_name.dart';
import 'screen_list.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.onBoarding, page: () => const OnBoardingScreen()),
    GetPage(name: _routeName.login, page: () => const LoginScreen()),
    GetPage(name: _routeName.signUp, page: () => SignUpScreen()),
    GetPage(
        name: _routeName.forgotPassword, page: () => ForgotPassWordScreen()),
    GetPage(name: _routeName.resetPassword, page: () => ResetPassword()),
    GetPage(name: _routeName.dashboard, page: () => const Dashboard()),
    GetPage(name: _routeName.innerCategory, page: () => const InnerCategory()),
    GetPage(name: _routeName.shopPage, page: () => ShopPage()),
    GetPage(name: _routeName.search, page: () => Search()),
    GetPage(name: _routeName.productDetail, page: () => ProductDetail()),
    GetPage(name: _routeName.coupons, page: () => Coupons()),
    GetPage(name: _routeName.deliveryDetail, page: () => DeliveryDetail()),
    GetPage(name: _routeName.addAddress, page: () => const AddAddress()),
    GetPage(name: _routeName.checkoutwebview, page: () => const CheckoutWebView()),
    GetPage(name: _routeName.payment, page: () => Payment()),
    GetPage(name: _routeName.orderSuccess, page: () => OrderSuccess()),
    GetPage(name: _routeName.cardBalance, page: () => CardBalance()),
    GetPage(name: _routeName.profileSetting, page: () => ProfileSetting()),
    GetPage(name: _routeName.profileSetting, page: () => ProfileSetting()),
    GetPage(name: _routeName.orderHistory, page: () => OrderHistory()),
    GetPage(name: _routeName.orderDetail, page: () => const OrderDetail()),
    GetPage(name: _routeName.saveAddress, page: () => SaveAddress()),
    GetPage(name: _routeName.notification, page: () => Notification()),
    GetPage(name: _routeName.setting, page: () => Setting()),
    GetPage(name: _routeName.termsCondition, page: () => TermsAndCondition()),
    GetPage(name: _routeName.help, page: () => Help()),
    GetPage(name: _routeName.aboutUs, page: () => AboutUs()),
    GetPage(name: _routeName.pageList, page: () => PageList()),
    GetPage(name: _routeName.otp, page: () => OtpScreen()),
    GetPage(name: _routeName.emptyCart, page: () => const EmptyCart()),
    GetPage(name: _routeName.emptyHistory, page: () => const EmptyHistory()),
    GetPage(name: _routeName.shippingMethod, page: () => const ShippingMethod()),
    GetPage(name: _routeName.paymentMethod, page: () => const PaymentMethod()),
  ];
}
