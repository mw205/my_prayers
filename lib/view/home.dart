import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_prayers/constants.dart';
import 'package:my_prayers/controller/change_notifier.dart';
import 'package:my_prayers/controller/location_controller.dart';
import 'package:my_prayers/view/prayers.dart';
import 'package:my_prayers/view/qibla.dart';
import 'package:my_prayers/view/sebha.dart';
import 'package:my_prayers/view/settings.dart';
import 'package:my_prayers/view/widgets/rounded_bottom_appbar.dart';
import 'package:my_prayers/view/widgets/rounded_top_navigationbar.dart';
import 'package:my_prayers/view/widgets/skelton.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final ChangeNotifierController changeNotifierController =
      Get.find<ChangeNotifierController>();
  final LocationController locationController =
      Get.put<LocationController>(LocationController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: RoundedBottomAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/6348833.jpg"),
              fit: BoxFit.cover,
              opacity: 0.03),
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
                        color: primColor,
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
                  return  Qibla();
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
                return  Qibla();
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
