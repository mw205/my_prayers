import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_prayers/core/utils/my_utils.dart';
import 'package:my_prayers/features/qibla/controller/qibla_controller.dart';
import 'package:my_prayers/gen/assets.gen.dart';

import '../../../gen/colors.gen.dart';

class Qibla extends StatelessWidget {
  Qibla({super.key});
  final QiblaController qiblaController = Get.put<QiblaController>(
    QiblaController(),
    permanent: true,
  );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: qiblaController.qiblaDirection.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: ColorName.primaryColor),
          );
        }
        try {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${snapshot.data!.direction.toInt()}°",
                  style: TextStyle(color: Colors.black, fontSize: 30.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  child: AnimatedBuilder(
                    animation: qiblaController.animation,
                    builder: (context, child) => Transform.rotate(
                      angle: qiblaController.animation.value,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Color.fromARGB(86, 15, 42, 88),
                                offset: Offset(0, 5),
                                blurRadius: 1.5)
                          ],
                        ),
                        child: Assets.images.qiblaWithNeedle.svg(
                          height: MyScreenUtils.h * 0.35,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } catch (e) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorName.primaryColor,
            ),
          );
        }
      },
    );
  }
}
