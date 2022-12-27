import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toure_app/ui/route/route.dart';
import 'const/AppColor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initializetion = Firebase.initializeApp(
    name: "Shelter",
    options: FirebaseOptions(
        apiKey: "AIzaSyDRZ7sGJhSf71wFzyiO5aR925hEmIpzPrE",
        appId: "1:441377699260:android:48e1cde7499b7f9299a7b9",
        messagingSenderId: "441377699260",
        projectId: "splash-banking"),
  );


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializetion,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: CircularProgressIndicator(),
            );
            // return MyApp();

          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MyApp();
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                appBarTheme: AppBarTheme(elevation: 0, color: AppColor.white,centerTitle: true),
                primarySwatch: Colors.blue,
                textTheme: GoogleFonts.poppinsTextTheme(
                  Theme.of(context).textTheme.apply(),
                ),
                scaffoldBackgroundColor: AppColor.background),
            initialRoute:splash,
            getPages: getpages,
          );
        });
  }
}
