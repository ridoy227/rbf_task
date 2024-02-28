import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final Function() onNotificationTap;
  final int unreadNotificationCount;
  const CustomAppBar({
    required this.onNotificationTap,
    required this.unreadNotificationCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: Get.width,
      decoration: const BoxDecoration(color: Colors.white),
      padding:const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          const Spacer(),
          Stack(
            alignment: Alignment.center,
            children: [
               IconButton(
                onPressed: onNotificationTap,
                icon: const Icon(Icons.notifications)
                ),
              Positioned(
                top: 2, right: 2,
                child: Container(
                  height: 14, width: 14,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                  alignment: Alignment.center,
                  child: Text(
                    "$unreadNotificationCount",
                    style: const TextStyle(fontSize: 8, color: Colors.white),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
