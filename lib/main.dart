import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'core/network/notification_service.dart';
import 'core/network/settings_services.dart';
import 'prayer_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await GetStorage.init();
  await initialServices();
  await NotificationService().init();
  tz.initializeTimeZones();

  runApp(const PrayersApp());
}

Future initialServices() async {
  await Get.putAsync(() => SettingsServices().init());
}
