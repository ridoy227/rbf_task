// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbf_task/app/modules/splash/bindings/splash_binding.dart';
import 'package:rbf_task/app/routes/app_pages.dart';

Future<void> main() async {
  runApp(const MyApp());
 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
          title: 'rbf_task',
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
          theme: ThemeData(
            // primarySwatch: Colors.blue,
            // primaryColor: const Color(0xFFFF5252),
            // disabledColor: const Color(0xFFBABFC4),
            // brightness: Brightness.light,
            // hintColor: const Color(0xFF9F9F9F),
            // cardColor: Colors.white,
            // colorScheme: const ColorScheme.light(primary: Color(0xFF55B9E3), secondary: Color(0xFF55B9E3)),
            // textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: const Color(0xFFAFAFAF))),
          ),
          getPages: AppPages.routes,
          initialBinding: SplashBinding(),
          initialRoute: AppPages.goToHomePage(),
        );
  }
}



// class MyHttpOverrides extends HttpOverrides{
//   @override
//  HttpClient createHttpClient(SecurityContext? context) 
//  { return super.createHttpClient(context) ..badCertificateCallback = (X509Certificate cert, String host, int port) = true; }
// }
