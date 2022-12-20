import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:toure_app/ui/views/Form_Screen.dart';
import 'package:toure_app/ui/views/auth/SignUp.dart';
import 'package:toure_app/ui/views/auth/Sign_In.dart';
import 'package:toure_app/ui/views/drawer/How%20to%20use.dart';
import 'package:toure_app/ui/views/onbording_screen.dart';
import 'package:toure_app/ui/views/tour_details.dart';
import '../views/bottomNavController/pages/nav_addfinal.dart';
import '../views/drawer/FAQ.dart';
import '../views/drawer/Privacy.dart';
import '../views/drawer/Rate Us.dart';
import '../views/drawer/Settings.dart';
import '../views/drawer/Support.dart';
import '../views/drawer/profile.dart';
import '../views/main_home_screen.dart';
import '../views/privacy-policy.dart';
import '../views/search.dart';
import '../views/seeAll.dart';
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
const String howToUse = '/How-to-use-Screen';
const String settings = '/Settings-Screen';
const String profile = '/Profile-Screen';
const String navAddLastStep = '/navAddLastStep';
const String detailstoure = '/Details_toure';
const String seeAllScreen = '/See_All_Screen';
const String searchScreen = '/See_All_Screen';

//controll our page route flow

List<GetPage> getpages = [
  GetPage(name: splash, page: () => Splash_Screen()),
  GetPage(name: onbording, page: () => Onbording_Screen()),
  GetPage(name: signUp, page: () => SignUp()),
  GetPage(name: signIn, page: () => Sign_In()),
  GetPage(name: userForm, page: () => User_Form()),
  GetPage(name: privacyPolicy, page: () => Privacy_Policy()),
  GetPage(name: main_homeScreen, page: () => MainHome_Screen()),
  GetPage(name: support, page: () => Support()),
  GetPage(name: privacy, page: () => Privacy()),
  GetPage(name: faq, page: () => FAQ_Screen()),
  GetPage(name: rate_Us, page: () => Rate_Us_Screen()),
  GetPage(name: howToUse, page: () => HowToUse()),
  GetPage(name: settings, page: () => Settings()),
  GetPage(name: profile, page: () => UserProfile()),
  GetPage(name: searchScreen, page: () => SearchScreen()),
  GetPage(
    name: navAddLastStep,
    page: () {
      NavAddLastStep _addLastStep = Get.arguments;
      return _addLastStep;
    },
    
  ),
    GetPage(
    name: seeAllScreen,
    page: () {
      SeeAll _seeAll = Get.arguments;
      return _seeAll;
    },
  ),
  GetPage(
    name: detailstoure,
    page: () {
      DetailsSCreen _detailsSCreen = Get.arguments;
      return _detailsSCreen;
    },
  ),

  
];
