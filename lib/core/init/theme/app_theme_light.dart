// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_complete_todo_app/core/init/theme/app_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance => _instance ??= AppThemeLight._init();

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
        colorScheme: _colorSchemeLight,
        textTheme: _textThemeLight,
        scaffoldBackgroundColor: _colorSchemeLight.background,
        appBarTheme: _appBarTheme,
        inputDecorationTheme: _inputDecorationTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        outlinedButtonTheme: _outlinedButtonTheme,
        timePickerTheme: _timePickerTheme,
      );
  /* Color Palette For The App. */

  ColorScheme get _colorSchemeLight => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xff1779d3), //
        primaryContainer: Color(0xffffbb54), //
        secondary: Color(0xffE7912D), //
        onSecondary: Color(0xffffffff),
        onPrimary: Color(0xffffffff), //
        background: Color(0xffF7F9FC), //
        onBackground: Color(0xff0F1729), //
        error: Color(0xffff5656), //
        errorContainer: Color(0xFFFFA41D), //
        onError: Color(0xffffffff),
        surface: Color(0xffE6EBF3),
        onSurface: Color(0xff596372), //
        tertiary: Color(0xff127255), //
        tertiaryContainer: Color(0xffBB79E5), //
        onTertiary: Color(0xffA1ABBC), //
        onSurfaceVariant: Color(0xff6F7490), //
        secondaryContainer: Color(0xFFE5E5E5), //
        onTertiaryContainer: Color(0xffDADADC), //
        onErrorContainer: Color(0xffffcc86), //
        inversePrimary: Color(0xFFDB4437),
        inverseSurface: Color(0xff4267B2),
        onPrimaryContainer: Color(0xff024786),
      );

  TimePickerThemeData get _timePickerTheme =>
      TimePickerThemeData(backgroundColor: _colorSchemeLight.onSecondary);
  /* Text Theme For The App */

  TextTheme get _textThemeLight => TextTheme(
        headline1: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.5,
          color: _colorSchemeLight.onBackground,
        ),
        headline2: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.5,
          color: _colorSchemeLight.onBackground,
        ),
        headline3: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
          color: _colorSchemeLight.background,
        ),
        headline4: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: _colorSchemeLight.onBackground,
        ),
        headline5: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: _colorSchemeLight.onBackground,
        ),
        overline: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: _colorSchemeLight.onBackground,
        ),
        bodyText1: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: _colorSchemeLight.onBackground,
        ),
        bodyText2: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: _colorSchemeLight.onBackground,
        ),
        subtitle1: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: _colorSchemeLight.onBackground,
        ),
        subtitle2: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: _colorSchemeLight.onBackground,
        ),
        button: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: _colorSchemeLight.onPrimary,
        ),
      );

  /* Appbar Theme */

  AppBarTheme get _appBarTheme => AppBarTheme(
      backgroundColor: _colorSchemeLight.background,
      titleTextStyle: _textThemeLight.headline2!
          .copyWith(color: _colorSchemeLight.onSurface));

  /* Text Field Theme */

  InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        focusColor: _colorSchemeLight.secondaryContainer,
        labelStyle: _textThemeLight.headline4!
            .copyWith(color: _colorSchemeLight.onBackground.withOpacity(0.4)),
        floatingLabelStyle: _textThemeLight.headline4!
            .copyWith(color: _colorSchemeLight.onBackground.withOpacity(0.4)),
        hintStyle: _textThemeLight.headline4!
            .copyWith(color: _colorSchemeLight.onBackground.withOpacity(0.3)),
        helperStyle: _textThemeLight.subtitle2!
            .copyWith(color: _colorSchemeLight.primary),
        fillColor: _colorSchemeLight.secondaryContainer,
        prefixIconColor: _colorSchemeLight.onBackground.withOpacity(0.4),
        errorStyle:
            _textThemeLight.subtitle1!.copyWith(color: _colorSchemeLight.error),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: _colorSchemeLight.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: _colorSchemeLight.error),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: _colorSchemeLight.surface),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: _colorSchemeLight.surface),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: _colorSchemeLight.surface),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: _colorSchemeLight.surface),
        ),
      );

  /* Elevated Button Theme */

  ElevatedButtonThemeData get _elevatedButtonTheme => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: _colorSchemeLight.onPrimary,
          backgroundColor: _colorSchemeLight.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 3,
          textStyle: _textThemeLight.button,
        ),
      );
  OutlinedButtonThemeData get _outlinedButtonTheme => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _colorSchemeLight.onBackground,
          backgroundColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: BorderSide(width: 2, color: _colorSchemeLight.primary),
          textStyle: _textThemeLight.button,
        ),
      );
}
