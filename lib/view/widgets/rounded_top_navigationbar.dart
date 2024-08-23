import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_prayers/controller/change_notifier.dart';

import '../../constants.dart';

class RoundedBottomNavigationBar extends StatelessWidget {
  const RoundedBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeNotifierController changeNotifierController =
        Get.find<ChangeNotifierController>();
    return Obx(
      () => Container(
        height: 60.sp,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            iconSize: 22.sp,
            selectedFontSize: 12.sp,
            unselectedFontSize: 12.sp,
            selectedItemColor: primColor,
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            items: [
              BottomNavigationBarItem(
                icon: const Icon(
                  FlutterIslamicIcons.solidTasbih2,
                ),
                label: 'sebha'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(FlutterIslamicIcons.prayingPerson),
                label: 'prayers'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(FlutterIslamicIcons.qibla2),
                label: 'qibla'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: 'settings'.tr,
              ),
            ],
            currentIndex: changeNotifierController.currentIndex,
            onTap: (index) {
              changeNotifierController.selectItem = index;
            },
          ),
        ),
      ),
    );
  }
}
