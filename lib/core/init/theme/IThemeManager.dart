import 'package:flutter/material.dart';

import 'theme_manager.dart';

abstract class IThemeManager {
  late ThemeData currentTheme;
  late ThemeEnum currentThemeEnum;

  void changeTheme(ThemeEnum theme);
}