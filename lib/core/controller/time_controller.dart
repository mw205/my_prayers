import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../network/settings_services.dart';

enum DateType { hijri, georgian }

class TimeController extends GetxController {
  RxString time = DateFormat('hh:mm a').format(DateTime.now()).obs;
  RxString georgianDate = DateFormat('dd-MM-yy').format(DateTime.now()).obs;

  //we will use this with the salah times api to get the current day from there
  RxString enDay = DateFormat("d").format(DateTime.now()).obs;
  RxString arDay = "".obs;
  RxString enReadableDay = DateFormat("EEE").format(DateTime.now()).obs;
  RxString arReadableDay = "".obs;

  RxString enhijriMonth = "".obs;
  RxString arhijriMonth = "".obs;
  RxInt enGeorgianMonth = int.parse(DateFormat("M").format(DateTime.now())).obs;

  RxString georgianYear = DateFormat("yyyy").format(DateTime.now()).obs;
  RxString hijriYear = "".obs;
  RxString hijriDateReadable = "".obs;
  //we will use it with last updated to make update button under the current city
  RxString lastUpdate = "".obs;
  SettingsServices settingsServices = Get.find<SettingsServices>();
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    startTime();
    lastUpdate.value = DateFormat('dd-M h:mm a').format(DateTime.now());
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  void startTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      updateTimeAndDate();
    });
  }

  void setLastUpdated() {
    lastUpdate.value = DateFormat('dd-M h:mm a').format(DateTime.now());
  }

  void setHijriDate(Map<String, dynamic> hijriDate) {
    arDay.value = hijriDate['day'].toString();
    arReadableDay.value = hijriDate['weekday']['ar'];
    arhijriMonth.value = hijriDate['month']['ar'];
    enhijriMonth.value = hijriDate['month']['en'];
    hijriYear.value = hijriDate['year'];
    if (settingsServices.localStorage.read('lang') == "ar") {
      hijriDateReadable.value =
          "$arReadableDay $arDay $arhijriMonth $hijriYear";
    } else {
      hijriDateReadable.value =
          "$enReadableDay $arDay $enhijriMonth $hijriYear";
    }
  }

  void updateTimeAndDate() {
    time.value = DateFormat('hh:mm a').format(DateTime.now());
    georgianDate.value = DateFormat('MM-dd-yy').format(DateTime.now());
  }
}
