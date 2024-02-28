import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbf_task/app/modules/home/controller/home_controller.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_homeController) => _homeController.showSelect
          ? Container(
              height: 60,
              width: Get.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: _homeController.selectedIds.length ==
                        _homeController.notificationList.length,
                    onChanged: (value) {
                      _homeController.selectAll();
                    },
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => _homeController.markAsRead(),
                    child: const Text("Mark As Read"),
                  ),
                  TextButton(
                    onPressed: () => _homeController.deleteItems(),
                    child: const Text("Delete"),
                  ),
                ],
              ),
            )
          : const SizedBox(),
    );
  }
}
