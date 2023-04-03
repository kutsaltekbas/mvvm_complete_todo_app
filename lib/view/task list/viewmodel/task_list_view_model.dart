import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_complete_todo_app/core/constants/navigation/navigation_constants.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../model/task_data_model.dart.dart';

part 'task_list_view_model.g.dart';

class TaskListViewModel = _TaskListViewModelBase with _$TaskListViewModel;

abstract class _TaskListViewModelBase with Store, BaseViewModel {
  @observable
  List<Task> dataList = [];
  final dio = Dio();
  @observable
  int selectedData = 0;

  @action
  void openTask() {
    navigator
        .navigateToPage(
            path: NavigationConstants.TASK_OPEN_VIEW,
            object: dataList[selectedData])
        .then((value) => getData());
  }

  @action
  Future<void> getData() async {
    dataList = [];
    var response = await dio.get(
        "https://network-service-test-default-rtdb.europe-west1.firebasedatabase.app/user/taskList.json");
    (response.data as Map<String, dynamic>).forEach((key, value) {
      dataList.add(Task.fromJson(response.data[key]));
    });
    listviewlength = dataList.length;
    inspect(response.data);
    inspect(dataList);
  }

  @action
  void changeSelectedData(int index) {
    selectedData = index;
  }

  @observable
  int listviewlength = 0;

  @observable
  int dataLength = 50;
  void returnHomePage() {
    navigator.navigatorKey.currentState!.pop();
  }

  @observable
  bool isLoading = false;

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  Future<void> init() async {
    changeIsLoading();
    await getData();
    changeIsLoading();
  }

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }
}
