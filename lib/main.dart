import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_complete_todo_app/view/homepage%20screen/view/homepage_view.dart';
import 'package:mvvm_complete_todo_app/view/task%20list%20screen/view/task_list_view.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/notifier/application_provider.dart';
import 'view/login screen/view/login_view.dart';
import 'view/on board screen/view/onboard_view.dart';
import 'view/splash screen/view/splash_screen_view.dart';
import 'view/task screen/view/task_view.dart';

Future<void> main() async {
  await _init();
  runApp(EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: ApplicationConstants.LANG_ASSET_PATH,
      startLocale: LanguageManager.instance.enLocale,
      child: MyApp()));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(390, 844),
        splitScreenMode: false,
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: HomePageView(),
          );
        });
  }
}
