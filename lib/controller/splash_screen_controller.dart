import 'package:get/get.dart';
import 'package:my_prayers/controller/notification_controller.dart';

class SplashScreenController extends GetxController {

  @override
  void onReady() {
    NotificationController()
        .checkNotificationPermission()
        .whenComplete(() async {
      Future.delayed(const Duration(seconds: 1, milliseconds: 600), () {
        Get.offAllNamed("/Home");
      });
    });

    super.onReady();
  }
}
