import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbf_task/app/modules/home/controller/home_controller.dart';
import 'package:rbf_task/app/modules/notification/widgets/app_bar_widget.dart';
import 'package:rbf_task/app/modules/notification/widgets/custom_navigation_bar_widget.dart';
import 'package:rbf_task/app/modules/notification/widgets/custom_notification_tile.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final ScrollController _controller = ScrollController();
  late HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController = Get.find<HomeController>();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      _homeController.page++;
      _homeController.getNotificationList(_homeController.page, 10, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigation(),
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(homeController: _homeController,),
            Expanded(
              child: GetBuilder<HomeController>(
                builder: (_homeController) {
                  if (_homeController.notificationList.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      controller: _controller,
                      itemCount: _homeController.notificationList.length,
                      itemBuilder: (context, index) {
                        final notification =
                            _homeController.notificationList[index];
                        return CustomNotificationTile(notification: notification,homeController: _homeController,);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


