
import 'package:flutter/material.dart';
import 'package:rbf_task/app/data/models/notification_model.dart';
import 'package:rbf_task/app/modules/home/controller/home_controller.dart';

class CustomNotificationTile extends StatelessWidget {
  const CustomNotificationTile({
    super.key,
    required this.notification,
    required this.homeController,
  });

  final NotificationModel notification;

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => homeController.toggleSelectedItems(
          notification.id!),
      leading: Visibility(
        visible: homeController.showSelect,
        child: Checkbox(
          onChanged: (value) {},
          value: homeController.selectedIds
              .contains(notification.id),
        ),
      ),
      title: Row(
        children: [
          Visibility(
            visible: notification.readStatus == "No",
            child: Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red),
            ),
          ),
          Text(" ${notification.title!}"),
          const Spacer(),
          Flexible(
            child: Text(
              notification.createdAt!,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
      subtitle: Text(notification.description!),
    );
  }
}
