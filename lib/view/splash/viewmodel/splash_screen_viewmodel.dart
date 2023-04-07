import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_complete_todo_app/core/constants/enums/locale_keys_enum.dart';
import 'package:mvvm_complete_todo_app/core/init/cache/locale_manager.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';

part 'splash_screen_viewmodel.g.dart';

class SplashScreenViewModel = _SplashScreenViewModelBase
    with _$SplashScreenViewModel;

abstract class _SplashScreenViewModelBase with Store, BaseViewModel {
  @observable
  bool isLoading = false;
  @observable
  NavigationService navigator = NavigationService.instance;

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  Future<void> init() async {
    await Future.delayed(Duration(seconds: 3));

    if (localeManager.getStringValue(PreferencesKeys.TOKEN) == "1") {
      navigator.navigateToPageClear(
          path: NavigationConstants.HOME_PAGE_VIEW, object: Text(""));
    } else {
      navigator.navigateToPageClear(
          path: NavigationConstants.LOGIN_VIEW, object: Text(""));
    }
  }

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }
}
