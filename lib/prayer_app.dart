import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_prayers/core/routes/my_routes.dart';
import 'package:my_prayers/core/themes/my_themes.dart';
import 'package:my_prayers/core/utils/my_utils.dart';

import 'core/locale/locale.dart';
import 'core/locale/locale_controller.dart';
import 'core/utils/home_binding.dart';

class PrayersApp extends StatelessWidget {
  const PrayersApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyScreenUtils.initUtils(context);
    final LocaleController localeController =
        Get.put<LocaleController>(LocaleController());

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: HomeBinding(),
          theme: MyThemes.lightTheme,
          locale: localeController.initLanguage,
          translations: PrayersLocale(),
          getPages: MyRoutes.myRoutes,
        );
      },
    );
  }
}
