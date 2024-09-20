import 'package:flutter/material.dart';
import 'package:my_prayers/gen/colors.gen.dart';

import '../../gen/fonts.gen.dart';

class MyThemes {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorName.offWhite,
    useMaterial3: true,
    fontFamily: FontFamily.cairo,
    brightness: Brightness.light,
  );
}
