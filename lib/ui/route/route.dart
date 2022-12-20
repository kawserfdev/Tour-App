import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:toure_app/ui/views/Form_Screen.dart';
import 'package:toure_app/ui/views/auth/SignUp.dart';
import 'package:toure_app/ui/views/auth/Sign_In.dart';
import 'package:toure_app/ui/views/drawer/How%20to%20use.dart';
import 'package:toure_app/ui/views/onbording_screen.dart';
import '../views/drawer/FAQ.dart';
import '../views/drawer/Privacy.dart';
import '../views/drawer/Rate Us.dart';
import '../views/drawer/Settings.dart';
import '../views/drawer/Support.dart';
import '../views/main_home_screen.dart';
import '../views/privacy-policy.dart';
import '../views/splash_screen.dart';

const String splash = '/Splash-Screen';
const String onbording = '/Onbording-Screen';
const String signUp = '/Sign-Up-Screen';
const String signIn = '/Sign-In-Screen';
const String userForm = '/Sign-Up-Form-Screen';
const String privacyPolicy= '/Privacy-Policy-Screen';
const String main_homeScreen = '/Main-Home-Screen';
const String support = '/Support-Screen';
const String privacy = '/Privacy-Screen';
const String faq = '/FAQ-Screen';
const String rate_Us = '/Rate-Us-Screen';
const String how_to_use = '/How-to-use-Screen';
const String settings = '/Settings-Screen';
//controll our page route flow

List<GetPage> getpages = [
  GetPage(name: splash, page: () => Splash_Screen()),
  GetPage(name: onbording, page: () => Onbording_Screen()),
  GetPage(name: signUp, page: () => SignUp()),
  GetPage(name: signIn, page: () => Sign_In()),
  GetPage(name: userForm, page: () => User_Form()),
  GetPage(name: privacyPolicy, page: () => Privacy_Policy()),
  GetPage(name: main_homeScreen, page: () => MainHome_Screen()),
  GetPage(name: support, page: () => Support_Screen()),
  GetPage(name: privacy, page: () => Privacy_Screen()),
  GetPage(name: faq, page: () => FAQ_Screen()),
  GetPage(name: rate_Us, page: () => Rate_Us_Screen()),
  GetPage(name: how_to_use, page: () => How_to_Use_Screen()),
  GetPage(name: settings, page: () => Settings_Screen()),
  
];
