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
        apiKey: "AIzaSyDKhH3GhabSnGzktDt-MYhQ5WNmV03JgI4",
        appId: "1:324397974590:web:bf5f8019f8ff1693d6fd6f",
        messagingSenderId: "324397974590",
        projectId: "it-s-a-practice-project"),
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
            initialRoute: splash,
            getPages: getpages,
          );
        });
  }
}
