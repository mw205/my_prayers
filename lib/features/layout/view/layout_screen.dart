import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_prayers/core/controller/location_controller.dart';
import 'package:my_prayers/core/widgets/rounded_bottom_appbar.dart';
import 'package:my_prayers/core/widgets/rounded_top_navigationbar.dart';
import 'package:my_prayers/core/widgets/skelton.dart';
import 'package:my_prayers/features/layout/controller/change_notifier.dart';
import 'package:my_prayers/features/prayers/view/prayers_screen.dart';
import 'package:my_prayers/features/settings/view/screens/settings_screen.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../adhkar/view/screens/sebha_screen.dart';
import '../../qibla/view/qibla_screen.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({super.key});
  static const String id = "/layout";
  final ChangeNotifierController changeNotifierController =
      Get.find<ChangeNotifierController>();
  final LocationController locationController =
      Get.put<LocationController>(LocationController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: RoundedBottomAppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.background.provider(),
            fit: BoxFit.cover,
            opacity: 0.03,
          ),
        ),
        child: Obx(
          () {
            if (locationController.address.value == "") {
              if (changeNotifierController.currentIndex == 1) {
                return ListView(children: [
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Skelton(
                        color: ColorName.primaryColor,
                        height: height * 0.12,
                        width: width * 0.8,
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      const Skelton.type(skeltonType: SkeltonType.prayersList)
                    ],
                  ),
                ]);
              } else {
                if (changeNotifierController.currentIndex == 0) {
                  return Sebha();
                } else if (changeNotifierController.currentIndex == 2) {
                  return Qibla();
                } else if (changeNotifierController.currentIndex == 3) {
                  return const Settings();
                } else {
                  return WidgetsApp(color: Colors.white);
                }
              }
            } else {
              if (changeNotifierController.currentIndex == 0) {
                return Sebha();
              } else if (changeNotifierController.currentIndex == 2) {
                return Qibla();
              } else if (changeNotifierController.currentIndex == 3) {
                return const Settings();
              } else {
                //to make it the homePage
                return const PrayersPage();
              }
            }
          },
        ),
      ),
      bottomNavigationBar: const RoundedBottomNavigationBar(),
    );
  }
}
