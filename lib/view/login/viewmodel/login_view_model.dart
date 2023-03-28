import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/navigation/navigation_constants.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;
abstract class _LoginViewModelBase with Store, BaseViewModel {

@observable
TextEditingController emailController = TextEditingController();


@observable
TextEditingController passwordController = TextEditingController();


@observable
bool isLoading = false;

@action
void forgotPasswordFunc(){

}

@action
void returnOnboard(){
 navigator.navigatorKey.currentState!.pop();
}

@action
void login(){
  navigator.navigateToPageClear(path: NavigationConstants.HOME_PAGE_VIEW, object: Text(""));
}

@action 
void signUp(){

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