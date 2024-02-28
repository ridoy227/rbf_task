

import 'package:get/get.dart';
import 'package:rbf_task/app/modules/home/controller/home_controller.dart';
import 'package:rbf_task/app/network/api/api_service.dart';
import 'package:rbf_task/app/network/repository/home_repository.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() async {
    // final sharedPreferences = await SharedPreferences.getInstance();
    // Get.lazyPut(() => sharedPreferences);

    //repository init
    Get.lazyPut(() => ApiService());

    Get.lazyPut(() => HomeRepository(apiService: Get.find()));

  //  // controller init
     Get.lazyPut(() => HomeController(homeRepository: Get.find()));
  //    Get.lazyPut(() => BillController(billRepository: Get.find(),splashController: Get.find() ));
  //    Get.lazyPut(() => OrderListController(orderListRepository: Get.find()));
  }
}
