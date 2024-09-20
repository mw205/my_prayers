import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_prayers/core/controller/time_controller.dart';
import 'package:my_prayers/features/prayers/controller/prayers_cotroller.dart';
import 'package:my_prayers/gen/colors.gen.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../gen/assets.gen.dart';

class PrayersList extends StatelessWidget {
  final TimeController timeController = Get.find<TimeController>();
  final PrayersController prayersController = Get.find<PrayersController>();

  PrayersList({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Obx(
      () {
        return Skeletonizer(
          containersColor: ColorName.lightBlue,
          ignoreContainers: false,
          enabled: prayersController.timingsCount.value == 0,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: prayersController.timingsCount.value,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: Container(
                  height: height * 0.075,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: prayersController.timingsNames![index] ==
                            prayersController.nextPrayerName.value
                        ? ColorName.blue
                        : ColorName.lightBlue,
                    image: DecorationImage(
                      image: Assets.images.background.provider(),
                      fit: BoxFit.cover,
                      opacity: 0.05,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          prayersController.timingsNames![index],
                          style: TextStyle(
                            color: prayersController.timingsNames![index] ==
                                    prayersController.nextPrayerName.value
                                ? Colors.white
                                : Colors.black,
                            fontSize: 18.sp,
                          ),
                        ),
                        Text(
                          prayersController.timingsValues![index],
                          style: TextStyle(
                            color: prayersController.timingsNames![index] ==
                                    prayersController.nextPrayerName.value
                                ? Colors.white
                                : Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
