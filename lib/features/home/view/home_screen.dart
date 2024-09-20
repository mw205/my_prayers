import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:my_prayers/core/utils/my_utils.dart';
import 'package:my_prayers/core/widgets/rounded_bottom_appbar.dart';
import 'package:my_prayers/features/prayers/controller/prayers_cotroller.dart';
import 'package:my_prayers/features/prayers/view/widgets/next_prayer_widget.dart';
import 'package:my_prayers/gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String id = "/home";
  @override
  Widget build(BuildContext context) {
    PrayersController prayersController = Get.find<PrayersController>();
    return Scaffold(
      appBar: RoundedBottomAppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.background.provider(),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
            opacity: 0.03,
          ),
        ),
        child: ListView(
          children: [
            Gap(MyScreenUtils.h * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Obx(
                () => NextPrayerWidget(
                  name: prayersController.nextPrayerName.value,
                  remainingHours: prayersController.remainingHours.value,
                  remainingMinutes: prayersController.remainingHours.value,
                ),
              ),
            ),
            Gap(MyScreenUtils.h * 0.03),
          ],
        ),
      ),
    );
  }
}
