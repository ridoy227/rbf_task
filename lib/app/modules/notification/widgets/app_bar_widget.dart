import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbf_task/app/modules/home/controller/home_controller.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required HomeController homeController,
  }) : _homeController = homeController;

  final HomeController _homeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: Get.width,
      child: Row(
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back),
          ),
          const Text("Notifications"),
          const Spacer(),
          IconButton(
            onPressed: () => _homeController.toggleSelect(),
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
