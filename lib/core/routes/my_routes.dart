import 'package:get/get.dart';
import 'package:my_prayers/features/home/view/home_screen.dart';

import '../../features/layout/view/layout_screen.dart';
import '../../features/qari_quran/view/qari_quran_screen.dart';
import '../../features/splash/view/splash_screen.dart';

class MyRoutes {
  static List<GetPage> myRoutes = [
    GetPage(
      name: "/",
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: LayoutScreen.id,
      page: () => LayoutScreen(),
    ),
    GetPage(
      name: QariRecognizerScreen.id,
      page: () => QariRecognizerScreen(),
    ),
    GetPage(
      name: HomeScreen.id,
      page: () => const HomeScreen(),
    ),
  ];
}
