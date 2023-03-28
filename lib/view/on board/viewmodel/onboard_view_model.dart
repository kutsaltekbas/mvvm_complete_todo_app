import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
part 'onboard_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;
abstract class _OnBoardViewModelBase with Store, BaseViewModel {

@observable
bool isLoading = false;

@action
void facebookLogin(){

}
@action
void googleLogin(){
  
}
@action
void emailLogin(){
  
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