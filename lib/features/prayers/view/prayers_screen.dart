import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:my_prayers/core/controller/location_controller.dart';
import 'package:my_prayers/core/controller/time_controller.dart';
import 'package:my_prayers/features/prayers/view/widgets/next_prayer_widget.dart';
import 'package:my_prayers/features/prayers/view/widgets/prayers_list.dart';

import '../../../gen/colors.gen.dart';
import '../controller/prayers_cotroller.dart';

class PrayersPage extends StatelessWidget {
  const PrayersPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    LocationController locationController = Get.find<LocationController>();
    TimeController timeController = Get.find<TimeController>();
    PrayersController prayersController = Get.find<PrayersController>();
    return RefreshIndicator(
      color: ColorName.primaryColor,
      onRefresh: () async {
        locationController.resetCurrentAddress();
        timeController.setLastUpdated();
        PrayersController.resetPrayersData();
      },
      child: Center(
        child: ListView(
          children: [
            Column(
              children: [
                Gap(height * 0.03),
                NextPrayerWidget(
                  name: prayersController.nextPrayerName.value,
                  remainingHours: prayersController.remainingHours.value,
                  remainingMinutes: prayersController.remainingHours.value,
                ),
                Gap(height * 0.03),
                PrayersList()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
