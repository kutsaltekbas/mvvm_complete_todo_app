import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';

part 'settings_view_model.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;
abstract class _SettingsViewModelBase with Store, BaseViewModel {

@observable
bool isLoading = false;

@action
void returnHomePage(){
  navigator.navigatorKey.currentState!.pop();
}

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {}

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }
}