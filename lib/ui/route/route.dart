import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:toure_app/ui/views/auth/SignUp.dart';
import 'package:toure_app/ui/views/onbording_screen.dart';
import '../views/splash_screen.dart';

const String splash = '/Splash-Screen';
const String onbording = '/Onbording-Screen';
const String signUp = '/Sign-Up-Screen';

//controll our page route flow

List<GetPage> getpages = [
  GetPage(name: splash, page: () => Splash_Screen()),
  GetPage(name: onbording, page: () => Onbording_Screen()),
  GetPage(name: signUp, page: () => SignUp()),

];
