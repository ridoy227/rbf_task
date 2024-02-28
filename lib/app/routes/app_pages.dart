
import 'package:get/get.dart';
import 'package:rbf_task/app/modules/home/home_screen.dart';
import 'package:rbf_task/app/routes/app_routes.dart';

abstract class AppPages {
  const AppPages._();

  static goToSplashPage() => Paths.splash;
  static goToHomePage() => Paths.home;


  static final routes = [
    // GetPage(
    //   name: Paths.splash,
    //   page: () => const SplashScreen(),
    // ),
    GetPage(
      name: Paths.home,
      page: () => const HomeScreen(),
    ),

  ];
}
