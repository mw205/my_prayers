import 'package:get/get.dart';
import 'package:my_prayers/core/controller/location_controller.dart';
import 'package:my_prayers/core/controller/network_controller.dart';
import 'package:my_prayers/core/controller/time_controller.dart';
import 'package:my_prayers/features/prayers/controller/prayers_cotroller.dart';
import 'package:my_prayers/features/splash/controller/splash_screen_controller.dart';

import '../../features/layout/controller/change_notifier.dart';
import '../controller/notification_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
    Get.put<ChangeNotifierController>(ChangeNotifierController());
    Get.put<TimeController>(TimeController());
    Get.put<NetworkController>(NetworkController(), permanent: true);
    Get.put(NotificationController());
    Get.put(LocationController(), permanent: true);
    Get.lazyPut(() => PrayersController(), fenix: true);
  }
}
