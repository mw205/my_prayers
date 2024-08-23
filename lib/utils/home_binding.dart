import 'package:get/get.dart';
import 'package:my_prayers/controller/network_controller.dart';
import 'package:my_prayers/controller/notification_controller.dart';
import 'package:my_prayers/controller/splash_screen_controller.dart';
import 'package:my_prayers/controller/time_controller.dart';

import '../controller/change_notifier.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
    Get.put<ChangeNotifierController>(ChangeNotifierController());
    Get.put<TimeController>(TimeController());
    Get.put<NetworkController>(NetworkController(), permanent: true);
    Get.put(NotificationController());
  }
}
