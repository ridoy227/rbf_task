import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbf_task/app/common/widgets/custom_app_bar.dart';
import 'package:rbf_task/app/modules/home/controller/home_controller.dart';
import 'package:rbf_task/app/modules/notification/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.find();

  @override
  void initState() {
    super.initState();
    homeController.getNotificationList( homeController.page, 20, false);

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Column(
          children: [
            GetBuilder<HomeController>(builder: (controller) {
              return CustomAppBar(
                onNotificationTap: () => Get.to(const NotificationScreen()),
                unreadNotificationCount: controller.notificaionModel == null? 0 : controller.notificaionModel!.data!.totalunread!,
              );
            }),
            Expanded(
              child: Container(
              color: Colors.white10,
            ))
          ],
        ),
      ),
    );
  }
}
