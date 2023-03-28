import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_complete_todo_app/core/constants/navigation/navigation_constants.dart';
import 'package:mvvm_complete_todo_app/core/init/navigation/navigation_service.dart';

import '../../../core/base/model/base_view_model.dart';
part 'splash_screen_viewmodel.g.dart';

class SplashScreenViewModel = _SplashScreenViewModelBase with _$SplashScreenViewModel;
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
     navigator.navigateToPageClear(path: NavigationConstants.ON_BOARD_VIEW, object: Text(""));

  }

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }


}