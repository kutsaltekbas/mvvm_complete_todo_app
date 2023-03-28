import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
part 'splash_screen_viewmodel.g.dart';

class SplashScreenViewModel = _SplashScreenViewModelBase with _$SplashScreenViewModel;
abstract class _SplashScreenViewModelBase with Store, BaseViewModel {

@observable
bool isLoading = false;

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {}

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }


}