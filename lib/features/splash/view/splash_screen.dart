import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_prayers/features/splash/controller/splash_screen_controller.dart';

import '../../../gen/assets.gen.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 0.5,
              child: Assets.animation.prayers.lottie(
                repeat: false,
                filterQuality: FilterQuality.high,
              ),
            )
          ],
        ),
      ),
    );
  }
}
