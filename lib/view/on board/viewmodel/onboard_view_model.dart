import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';

import '../../../core/base/model/base_view_model.dart';
part 'onboard_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;
abstract class _OnBoardViewModelBase with Store, BaseViewModel {

@observable
bool isLoading = false;
NavigationService navigator = NavigationService.instance;

@action
void facebookLogin(){

}
@action
void googleLogin(){
  
}
@action
void emailLogin(){
  navigator.navigateToPage(path: NavigationConstants.LOGIN_VIEW, object: Text("hehehe"));
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