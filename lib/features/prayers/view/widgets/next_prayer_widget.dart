// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:my_prayers/features/prayers/controller/prayers_cotroller.dart';
// import 'package:skeletonizer/skeletonizer.dart';

// import '../../../../core/utils/my_utils.dart';
// import '../../../../gen/assets.gen.dart';

// class NextPrayerWidget extends StatelessWidget {
//   final PrayersController prayersController = Get.find<PrayersController>();

//   NextPrayerWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MyScreenUtils.h * 0.12,
//       width: MyScreenUtils.w * 0.8,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//             image: Assets.images.background.provider(),
//             fit: BoxFit.cover,
//             opacity: 0.05),
//         borderRadius: BorderRadius.circular(24),
//         color: const Color(0xFF184086),
//       ),
//       child: Center(
//         child: Obx(
//           () {
//             if (name == "") {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Bone.text(
//                     fontSize: 20,
//                     words: 2,
//                   ),
//                 ],
//               );
//             }
//             if (remainingHours == 0 &&
//                 remainingMinutes == 0) {
//               return Center(
//                 child: Text(
//                   "${name} ".tr,
//                   style: TextStyle(color: Colors.white, fontSize: 20.sp),
//                 ),
//               ).animate().fade();
//             } else {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   //next salah
//                   Text(
//                     "${name} ${"in".tr}",
//                     style: TextStyle(color: Colors.white, fontSize: 20.sp),
//                   ),
//                   Gap(
//                     MyScreenUtils.isTablet
//                         ? MyScreenUtils.h * 0.01
//                         : MyScreenUtils.h * 0.02,
//                   ),
//                   //time to next salah
//                   Text(
//                     "${remainingHours} ${"hour".tr} ${remainingMinutes} ${"minute".tr}",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ).animate().fade();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../core/utils/my_utils.dart';
import '../../../../gen/assets.gen.dart';

class NextPrayerWidget extends StatelessWidget {
  const NextPrayerWidget({
    super.key,
    required this.name,
    required this.remainingHours,
    required this.remainingMinutes,
  });
  final String name;
  final int remainingHours;
  final int remainingMinutes;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyScreenUtils.h * 0.12,
      width: MyScreenUtils.w * 0.8,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: Assets.images.background.provider(),
            fit: BoxFit.cover,
            opacity: 0.05),
        borderRadius: BorderRadius.circular(24),
        color: const Color(0xFF184086),
      ),
      child: Center(
        child: nextPrayer(),
      ),
    );
  }

  Widget nextPrayer() {
    // if (name == "") {
    //   return const Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Bone.text(
    //         fontSize: 20,
    //         words: 2,
    //       ),
    //     ],
    //   );
    // }

    if (remainingHours == 0 && remainingMinutes == 0) {
      return Center(
        child: Text(
          "$name ".tr,
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
      ).animate().fade();
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //next salah
          Text(
            "$name ${"in".tr}",
            style: TextStyle(color: Colors.white, fontSize: 20.sp),
          ),
          Gap(
            MyScreenUtils.isTablet
                ? MyScreenUtils.h * 0.01
                : MyScreenUtils.h * 0.02,
          ),
          //time to next salah
          Text(
            "$remainingHours ${"hour".tr} $remainingMinutes ${"minute".tr}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ).animate().fade();
    }
  }
}
