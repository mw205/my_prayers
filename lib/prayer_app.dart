import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'constants.dart';
import 'locale/locale.dart';
import 'locale/locale_controller.dart';
import 'utils/home_binding.dart';
import 'view/home.dart';
import 'view/splash_screen.dart';

class PrayersApp extends StatelessWidget {
  const PrayersApp({super.key});

  @override
  Widget build(BuildContext context) {
    final LocaleController localeController =
        Get.put<LocaleController>(LocaleController());

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialBinding: HomeBinding(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: arabicFontFamily,
          ),
          home: const SplashScreen(),
          locale: localeController.initLanguage,
          translations: PrayersLocale(),
          getPages: [
            GetPage(
              name: "/",
              page: () => const SplashScreen(),
            ),
            GetPage(
              name: "/Home",
              page: () => Home(),
            )
          ],
        );
      },
      child: const SplashScreen(),
    );
  }
}
