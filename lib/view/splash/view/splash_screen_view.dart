import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_complete_todo_app/core/extension/context_extension.dart';
import 'package:mvvm_complete_todo_app/core/init/cache/locale_manager.dart';
import 'package:mvvm_complete_todo_app/core/init/lang/language_manager.dart';
import 'package:mvvm_complete_todo_app/core/init/lang/locale_keys.g.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/init/theme/app_theme_light.dart';
import '../viewmodel/splash_screen_viewmodel.dart';
import 'dart:math';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashScreenViewModel>(
      viewModel: SplashScreenViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.setContext(context);
        viewmodel.init();
      },
      onPageBuilder: (context, viewmodel) {
        return Scaffold(
            backgroundColor:
                AppThemeLight.instance.theme.colorScheme.background,
            body: Container(
              width: context.width,
              height: context.height,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 90.h,
                      backgroundColor: AppThemeLight
                          .instance.theme.colorScheme.onSurfaceVariant,
                      child: Icon(
                        Icons.task_alt_outlined,
                        size: 80.h,
                        color:
                            AppThemeLight.instance.theme.colorScheme.background,
                      ),
                    ),
                    SizedBox(
                      width: 200.h,
                      height: 200.h,
                      child: Transform.rotate(
                        angle: pi / 3,
                        child: CircularProgressIndicator(
                          color: AppThemeLight
                              .instance.theme.colorScheme.primaryContainer,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 215.h,
                      height: 215.h,
                      child: Transform.rotate(
                        angle: pi / 6,
                        child: CircularProgressIndicator(
                          color: AppThemeLight.instance.theme.colorScheme.error,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 230.h,
                      height: 230.h,
                      child: Transform.rotate(
                        angle: pi / 9,
                        child:
                            CircularProgressIndicator(color: Colors.lightBlue),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }

  Center indicator() {
    return Center(
      child: CircularProgressIndicator(
        color: AppThemeLight.instance.theme.colorScheme.primaryContainer,
      ),
    );
  }

  Text title() {
    return Text(
      LocaleKeys.splash_todo.tr(),
      style: TextStyle(
          color: AppThemeLight.instance.theme.colorScheme.surface,
          fontSize: 48.sp,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(color: Colors.black12, offset: Offset(0, 5), blurRadius: 5)
          ]),
    );
  }
}
