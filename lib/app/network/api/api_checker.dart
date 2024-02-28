import 'dart:convert';
import 'package:get/get.dart';
import 'package:rbf_task/app/common/widgets/custom_toast.dart';

class ApiChecker{
  static void checkApi(Response response){
    if(response.statusCode == 401){
      // Get.find<AuthController>().removeToken();
      // Get.offAllNamed(AppPages.goToSignInPage());
      customToast(response.body['errors'][0]["message"]);
    }else{

      if(jsonEncode(response.body).toString().startsWith('{"message":')){
        customToast(response.body['message']);
      }else {
        customToast(response.statusText.toString());
      }
    }
  }
}