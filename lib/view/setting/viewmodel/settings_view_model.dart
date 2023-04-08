import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_complete_todo_app/core/constants/enums/locale_keys_enum.dart';
import 'package:mvvm_complete_todo_app/core/constants/navigation/navigation_constants.dart';
import 'package:mvvm_complete_todo_app/core/init/lang/language_manager.dart';

import '../../../core/base/model/base_view_model.dart';

part 'settings_view_model.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store, BaseViewModel {
  @observable
  bool isLoading = false;

  @action
  void returnHomePage() {
    navigator.navigatorKey.currentState!.pop();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  Future<void> init() async {}

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }

  @action
  void signOut() {
    localeManager.setStringValue(PreferencesKeys.TOKEN, "");
    navigator.navigateToPageClear(
        path: NavigationConstants.LOGIN_VIEW, object: Text(""));
  }

  @action
  void changeLanguage() {
    if (localeManager.getStringValue(PreferencesKeys.LANGUAGE) == "") {
      viewModelContext.setLocale(LanguageManager.instance.trLocale);
      localeManager.setStringValue(PreferencesKeys.LANGUAGE, "1");
    } else if (localeManager.getStringValue(PreferencesKeys.LANGUAGE) == "1") {
      viewModelContext.setLocale(LanguageManager.instance.enLocale);
      localeManager.setStringValue(PreferencesKeys.LANGUAGE, "");
    }
  }
}
