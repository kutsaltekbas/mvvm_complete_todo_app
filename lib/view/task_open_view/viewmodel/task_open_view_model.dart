import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_complete_todo_app/model/task_data_model.dart.dart';
import '../../../../core/base/model/base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'task_open_view_model.g.dart';

class TaskOpenViewModel = _TaskOpenViewModelBase with _$TaskOpenViewModel;

abstract class _TaskOpenViewModelBase with Store, BaseViewModel {
  final Task task;

  final dio = Dio();
  @action
  void changeCircleAvatarColor() {
    
  }

  @observable
  bool value = false;

  @observable
  bool isLoading = false;
  
  _TaskOpenViewModelBase(this.task);
  void goBack() {
    navigator.navigatorKey.currentState?.pop();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {
    //checkboxValueList = ObservableList.of(List.generate(task.subtask!.length, (index) => false));
  }

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }

//   @observable
//   ObservableList<bool> checkboxValueList = ObservableList.of([]);
//   @action
//   void onCheckboxChanged(int index, bool value) {
//     checkboxValueList[index] = value;
//     checkboxValueList = checkboxValueList;
//   }

//   @action
//   bool checkboxCase(int index) {
//     return checkboxValueList[index];
//   }

//   @observable
//   bool? checkboxValue = false;
}
