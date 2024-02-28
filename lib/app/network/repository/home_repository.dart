import 'package:dio/src/response.dart' as dioResponse;
import 'package:get/get.dart';
import 'package:rbf_task/app/network/api/api_service.dart';

class HomeRepository extends GetxService{
  ApiService apiService;
  HomeRepository({required this.apiService});

  Future<dioResponse.Response> getNotifications({required String url}) async{
    final response = await apiService.get(url);
    return response;
  }
  Future<dioResponse.Response> updateNotification({required String url, required dynamic data}) async{
    final response = await apiService.post(url, data);
    return response;
  }
}
