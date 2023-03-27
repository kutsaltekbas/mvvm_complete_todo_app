import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
part 'homepage_view_model.g.dart';

class HomePageViewModel = _HomePageViewModelBase with _$HomePageViewModel;
abstract class _HomePageViewModelBase with Store, BaseViewModel {

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

  @action
  void settings(){

  }
  @action
  void showTasks(){

  }
  @action
  void addTask(){

  }
  @action
  void addTaskDailyRoutine(){
    
  }
  @action
  void addTaskSchool(){
    
  }
  @action
  void addTaskWork(){
    
  }
  @action
  void addTaskBills(){
    
  }
}