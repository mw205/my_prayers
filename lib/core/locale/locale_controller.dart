import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/my_strings.dart';
import '../network/settings_services.dart';

class LocaleController extends GetxController {
  final SettingsServices settingsServices = Get.find();
  late Locale initLanguage;
  @override
  void onInit() {
    super.onInit();
    initLanguage =
        settingsServices.localStorage.read(MyStrings.kLangKey) == 'ar'
            ? const Locale('ar')
            : const Locale('en');
  }

  void changeLanguage(String languageCode) {
    Locale locale = Locale(languageCode);
    settingsServices.localStorage.write(MyStrings.kLangKey, languageCode);
    Get.updateLocale(locale);
  }

  List<String> languages = ['العربية', 'English'];
  List<Option> languagesOptions = [
    Option(const Locale('ar')),
    Option(const Locale('en'))
  ];
  String get appLanguage {
    if (settingsServices.localStorage.read(MyStrings.kLangKey) == "ar") {
      return "العربية";
    } else {
      return "English";
    }
  }

  String get appLocale {
    if (settingsServices.localStorage.read(MyStrings.kLangKey) == "ar") {
      return "ar";
    } else {
      return "en";
    }
  }
}

class Option {
  final Locale locale;
  Option(this.locale);
  String get languageName {
    if (locale.languageCode == "ar") {
      return "العربية";
    } else {
      return "English";
    }
  }
}
