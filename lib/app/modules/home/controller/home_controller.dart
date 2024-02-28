import 'package:get/get.dart';
import 'package:rbf_task/app/data/models/notification_model.dart';
import 'package:rbf_task/app/data/response/notification_response_model.dart';
import 'package:rbf_task/app/network/repository/home_repository.dart';


class HomeController extends GetxController implements GetxService{
  HomeRepository homeRepository;
  HomeController({required this.homeRepository});
  int unreadNotificationCount = 0;
  int page = 1;
  int pageSize = 10;

   NotificationResponseModel? notificaionModel ;
   List<NotificationModel> notificationList = [];
  Set selectedIds = {};
  bool showSelect = false;
  bool showLoading = false;


  Future<void> markAsRead() async{
    Map<String , dynamic> data = {
    "notification_Ids": selectedIds.toList(),
    "status": "Read"
};
    final response = await homeRepository.updateNotification(url: "update_notification_status",data: data );
    getNotificationList(1, 20, false);
  }

  
  Future<void> deleteItems() async{
    Map<String , dynamic> data = {
    "notification_Ids": selectedIds.toList(),
    "status": "Delete"
};
    final response = await homeRepository.updateNotification(url: "update_notification_status",data: data );
    getNotificationList(1, 20, false);
  }

  




  Future<void> getNotificationList(int page, int pageSize, bool showLoadingIndicator)async{
     if(showLoadingIndicator){
       showLoading = true;

       update();
     } else {
       notificationList = [];
       update();
     }
    final resoponse = await homeRepository.getNotifications(url: "get_notification?page=$page&pageSize=$pageSize");
    notificaionModel = NotificationResponseModel.fromJson(resoponse.data);
    if(notificaionModel !=null){
       notificationList.addAll(notificaionModel!.data!.results!);
        }
    showLoading = false;
    update();

  }

  void toggleSelect(){
    showSelect = !showSelect;
    update();
  }
  void selectAll(){

    if( selectedIds.length == notificationList.length){
    selectedIds.clear();
    }
    for(var item in notificationList){
      selectedIds.add(item.id);
    }
    
    update();
  }

  void toggleSelectedItems(int id){
    if(selectedIds.contains(id)){
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
    update();
  }
}