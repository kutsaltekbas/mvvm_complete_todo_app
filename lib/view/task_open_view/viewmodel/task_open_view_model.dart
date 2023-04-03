import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_complete_todo_app/model/task_data_model.dart.dart';
import '../../../../core/base/model/base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'task_open_view_model.g.dart';

class TaskOpenViewModel = _TaskOpenViewModelBase with _$TaskOpenViewModel;

abstract class _TaskOpenViewModelBase with Store, BaseViewModel {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("user/taskList");

  @observable
  Task task;

  final dio = Dio();
  @action
  Future<void> changeCircleAvatarColor(int index) async {
    taskCaseList[index] = !taskCaseList[index];
  }

  @action
  void fullFillList() {
    for (var i in task.subtask!.taskCases!) {
      taskCaseList.add(i);
    }
  }

  @action
  Future<void> updateData() async {
    await ref.update({"task/subtask/taskCases": taskCaseList});
  }

  @observable
  ObservableList taskCaseList = ObservableList();
  @observable
  bool value = false;

  @observable
  bool isLoading = false;

  _TaskOpenViewModelBase(this.task);
  Future<void> goBack() async {
    await updateData();
    navigator.navigatorKey.currentState?.pop();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {
    fullFillList();
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
