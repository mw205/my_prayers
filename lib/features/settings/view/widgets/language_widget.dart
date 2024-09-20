import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_prayers/core/locale/locale_controller.dart';
import 'package:my_prayers/core/utils/dialog_utils.dart';

import '../../../../gen/colors.gen.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({super.key});
  final LocaleController localeController = Get.find<LocaleController>();

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.shortestSide >= 600;

    return Row(
      children: [
        Icon(
          Icons.language,
          size: isTablet ? 25.sp : 30.sp,
          color: ColorName.primaryColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "language".tr,
                style: TextStyle(
                    fontSize: isTablet ? 16.sp : 18.sp,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "default".tr,
                  style: TextStyle(
                      color: const Color.fromARGB(133, 15, 42, 88),
                      fontSize: isTablet ? 10.sp : 11.sp),
                ),
              )
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: GestureDetector(
            onTap: () {
              DialogUtils.chooseLanguageDialog(
                height: MediaQuery.of(context).size.height * 0.15,
              );
            },
            child: Row(
              children: [
                Text(
                  localeController.appLanguage,
                  style: TextStyle(
                      color: ColorName.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18.sp,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
