import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:mvvm_complete_todo_app/core/extension/context_extension.dart';
import 'package:mvvm_complete_todo_app/core/init/cache/locale_manager.dart';
import 'package:mvvm_complete_todo_app/core/init/lang/language_manager.dart';
import 'package:mvvm_complete_todo_app/core/init/lang/locale_keys.g.dart';
import '../../../core/base/view/base_view.dart';
import '../viewmodel/splash_screen_viewmodel.dart';

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
          backgroundColor: context.colorScheme.background,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.splash_todo.tr(),
                style: context.theme.textTheme.headlineLarge,
              ),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: CircularProgressIndicator(
                  color: context.colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
