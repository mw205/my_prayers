import 'package:get/get.dart';
import 'package:my_prayers/features/home/view/home_screen.dart';

import '../../../core/controller/notification_controller.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    NotificationController().checkNotificationPermission().whenComplete(
      () async {
        Future.delayed(
          const Duration(seconds: 2, milliseconds: 600),
          () {
            Get.offAllNamed(HomeScreen.id);
          },
        );
      },
    );

    super.onReady();
  }
}
