// ignore_for_file: prefer_const_constructors
import 'package:get/get.dart';
import 'package:hookah_user/view/screens/about_us/about_us.dart';
import 'package:hookah_user/view/screens/add_address/add_address.dart';
import 'package:hookah_user/view/screens/change_password/ChangePasswordScreen.dart';
import 'package:hookah_user/view/screens/checkout/checkout_page.dart';
import 'package:hookah_user/view/screens/forgot_password/forget_password.dart';
import 'package:hookah_user/view/screens/home/home.dart';
import 'package:hookah_user/view/screens/login/login.dart';
import 'package:hookah_user/view/screens/order_history/order_history.dart';
import 'package:hookah_user/view/screens/otp/otp_page.dart';
import 'package:hookah_user/view/screens/otpscreen/otpverify_screen.dart';
import 'package:hookah_user/view/screens/payment_method/payment_method.dart';
import 'package:hookah_user/view/screens/privacy_policy/privacy_policy.dart';
import 'package:hookah_user/view/screens/profile/profile_page.dart';
import 'package:hookah_user/view/screens/showcart/showcart.dart';
import 'package:hookah_user/view/screens/signup/signup.dart';
import 'package:hookah_user/view/screens/splash/splash_screen.dart';
import 'package:hookah_user/view/screens/subscription/subscription.dart';
import 'package:hookah_user/view/screens/tab_controller/tab_controller_page.dart';
import 'package:hookah_user/view/screens/terms_and_conditions/terms_condition.dart';
import 'package:hookah_user/view/screens/wallet/wallet.dart';
import 'package:hookah_user/view/verify_age/verify_age.dart';

List<GetPage> getPages = [
  GetPage(name: "/LOGIN", page: () => Login()),
  GetPage(name: "/FORGOT_PASSWORD", page: () => ForgetpasswordPage()),
  GetPage(name: "/SIGNUP", page: () => SignupPage()),
  GetPage(name: "/TAB_CONTROLLER_PAGE", page: () => TabControllerPage()),
  GetPage(name: "/SPLASH_SCREEN", page: () => SplashScreen()),
  GetPage(name: "/ORDER_HISTORY", page: () => OrderHistory()),
  GetPage(name: "/CHECKOUT_PAGE", page: () => CheckOutPage()),
  GetPage(name: "/ABOUT_US_PAGE", page: () => AboutUs()),
  GetPage(name: "/PRIVACY_POLICY_PAGE", page: () => PrivacyPolicy()),
  GetPage(name: "/TERMS_AND_CONDITIONS_PAGE", page: () => TermsConditions()),
  GetPage(name: "/HOME", page: () => HomePage()),
  GetPage(name: "/OTP", page: () => Otpscreen()),
  GetPage(name: "/OTPVERIFY", page: () => Otpverify()),
  GetPage(name: "/WALLET", page: () => Wallet()),
  GetPage(name: "/PAYMENT_METHOD", page: () => PaymentMethod()),
  GetPage(name: "/SUBSCRIPTION", page: () => Subscription()),
  GetPage(name: "/VERIFY_AGE", page: () => VerifyAge()),
  GetPage(name: "/ADD_ADDRESS", page: () => AddAddress()),
  GetPage(name: "/CHANGE_PASSWORD", page: () => ChangePassword()),
  GetPage(name: "/PROFILE_PAGE", page: () => ProfilePage()),
  // GetPage(name: "/SHOWCART_PAGE", page: () => ShowcartPage()),
];
