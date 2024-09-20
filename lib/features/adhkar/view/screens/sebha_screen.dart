import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_prayers/features/adhkar/controller/sebha_controller.dart';
import 'package:my_prayers/features/adhkar/view/widgets/counter_with_progress_indicator.dart';
import 'package:my_prayers/gen/fonts.gen.dart';

class Sebha extends StatelessWidget {
  //create and initialize an instance and keep the data permnent (not to remove it from memory)
  final SebhaController sebhaController = Get.put(
    SebhaController(),
    permanent: true,
  );

  Sebha({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              sebhaController.zekr[sebhaController.zekrIndex.value],
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.sp,
                fontFamily: FontFamily.cairo,
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            CounterWithProgressIndicator(
              progress: sebhaController.progress.value,
              count: sebhaController.count.value,
              onTap: () {
                sebhaController.incrementCounter();
              },
            ),
          ],
        ),
      ),
    );
  }
}
