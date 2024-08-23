import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_prayers/controller/splash_screen_controller.dart';

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
              child: LottieBuilder.asset(
                "assets/images/prayers.json",
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
