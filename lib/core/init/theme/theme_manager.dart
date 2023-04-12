import 'package:flutter/material.dart';
import 'package:mvvm_complete_todo_app/core/init/theme/dark_theme/custom_dark_theme.dart';
import 'package:mvvm_complete_todo_app/core/init/theme/light_theme/custom_light_theme.dart';
import 'package:provider/provider.dart';

import 'IThemeManager.dart';



enum ThemeEnum { DARK, LIGHT }

extension ThemeContextExtension on BuildContext {
  ThemeData get theme => watch<ThemeManager>().currentTheme;
}

class ThemeManager extends ChangeNotifier implements IThemeManager {
  static ThemeManager? _instance;
  static ThemeManager get instance {
    _instance ??= ThemeManager._init();
    return _instance!;
  }

  ThemeManager._init();

  @override
  ThemeData currentTheme = ThemeEnum.LIGHT.generateTheme;
  ThemeEnum currentThemeEnum = ThemeEnum.LIGHT;

  @override
  void changeTheme(ThemeEnum newTheme) {
    if (newTheme != currentThemeEnum) {
      currentTheme = newTheme.generateTheme;
      currentThemeEnum = newTheme;
      notifyListeners();
    }
    return;
  }
}

extension ThemeEnumExtension on ThemeEnum {
  ThemeData get generateTheme {
    switch (this) {
      case ThemeEnum.LIGHT:
        return CustomLightTheme.instance.theme;
      case ThemeEnum.DARK:
        return CustomDarkTheme.instance.theme;
      default:
        return CustomLightTheme.instance.theme;
    }
  }
} 