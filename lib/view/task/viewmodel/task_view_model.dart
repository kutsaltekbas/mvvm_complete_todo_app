import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/theme/app_theme_light.dart';

import '../../../core/base/model/base_view_model.dart';
part 'task_view_model.g.dart';

class TaskViewModel = _TaskViewModelBase with _$TaskViewModel;

abstract class _TaskViewModelBase with Store, BaseViewModel {
  @observable
  TextEditingController taskController = TextEditingController();
  @observable
  TextEditingController postTaskController = TextEditingController();

  DatabaseReference db = FirebaseDatabase.instance.ref("user/taskList");

  @observable
  int listTileLength = 0;
  @observable
  bool? checkboxValue = false;

  @observable
  bool isLoading = false;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @observable
  Map<String, dynamic> taskData = {};

  @observable
  int taskListLength = 0;
  @action
  Future<void> getTaskListLength() async {
    var data = await db.get();
    taskListLength = (data.value as Map).keys.length;
  }

  @observable
  String taskCategory = "";

  @action
  void changeCategory(String newCategory) {
    taskCategory = newCategory;
  }

  @observable
  String taskDescription = "";

  @action
  void changeDescription(String newDescription) {
    taskDescription = newDescription;
  }

  @observable
  String taskTitle = "";

  @action
  void changeTitle(String newTitle) {
    taskTitle = newTitle;
  }

  @observable
  List<String> taskList = [];

  @observable
  List<bool> taskCaseList = [];

  @action
  void fillCaseList() {
    for (int i = 0; i < taskList.length; i++) {
      taskCaseList.add(false);
    }
  }

  @action
  Future<void> postData() async {
    taskData = {
      "task$taskListLength": {
        "category": taskCategory,
        "description": taskDescription,
        "isDone": false,
        "subtask": {
          "taskCases": taskCaseList,
          "tasks": taskList,
        },
        "title": taskTitle,
        "taskId": taskListLength
      }
    };
    db.update(taskData);
  }

  @override
  Future<void> init() async {
    await getTaskListLength();
  }

  @action
  Future<void> addTaskToList() async {
    taskList.add(taskController.text);
    listTileLength = taskList.length;
    checkboxValueList.add(false);
    Navigator.pop(viewModelContext);
  }

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }

  @action
  void addTask() {
    showDialog(
        barrierDismissible: false,
        context: viewModelContext,
        builder: (viewModelContext) {
          return AlertDialog(
            actionsOverflowAlignment: OverflowBarAlignment.center,
            actionsOverflowDirection: VerticalDirection.up,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppThemeLight
                              .instance.theme.colorScheme.onSurface),
                      onPressed: () {
                        Navigator.pop(viewModelContext);
                      },
                      child: Text(
                        LocaleKeys.home_addTaskDialog_back.tr(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: 100.w,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppThemeLight
                              .instance.theme.colorScheme.onSurface),
                      onPressed: addTaskToList,
                      child: Text(
                        LocaleKeys.home_addTaskDialog_add.tr(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 50),
                width: 500.w,
                height: viewModelContext.mediaQuery.viewInsets.bottom > 0
                    ? 150.h
                    : 200.h,
                child: Padding(
                  padding: viewModelContext.paddingLow,
                  child: TextField(
                    maxLength: 160,
                    controller: taskController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: AppThemeLight
                            .instance.theme.colorScheme.background),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
            elevation: 10,
            backgroundColor: AppThemeLight.instance.theme.colorScheme.surface,
            icon: Icon(
              Icons.task_alt_rounded,
              size: 32.w,
              color: AppThemeLight.instance.theme.colorScheme.onSurface,
            ),
            title: Text(
              LocaleKeys.taskPage_addTastTitle.tr(),
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppThemeLight.instance.theme.colorScheme.onBackground),
            ),
          );
        });
  }

  @action
  void postTask() {
    showDialog(
        barrierDismissible: false,
        context: viewModelContext,
        builder: (viewModelContext) {
          return AlertDialog(
            actionsOverflowAlignment: OverflowBarAlignment.center,
            actionsOverflowDirection: VerticalDirection.up,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppThemeLight
                              .instance.theme.colorScheme.onSurface),
                      onPressed: () {
                        Navigator.pop(viewModelContext);
                      },
                      child: Text(
                        LocaleKeys.home_addTaskDialog_back.tr(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: 100.w,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppThemeLight
                              .instance.theme.colorScheme.onSurface),
                      onPressed: () async {
                        changeDescription(postTaskController.text);

                        fillCaseList();
                        await postData();
                        navigator.navigateToPageClear(
                            path: NavigationConstants.HOME_PAGE_VIEW,
                            object: Text(""));
                      },
                      child: Text(
                        LocaleKeys.home_addTaskDialog_add.tr(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 50),
                width: 500.w,
                height: viewModelContext.mediaQuery.viewInsets.bottom > 0
                    ? 150.h
                    : 200.h,
                child: Padding(
                  padding: viewModelContext.paddingLow,
                  child: TextField(
                    maxLength: 160,
                    controller: postTaskController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: AppThemeLight
                            .instance.theme.colorScheme.background),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
            elevation: 10,
            backgroundColor: AppThemeLight.instance.theme.colorScheme.surface,
            icon: Icon(
              Icons.task_alt_rounded,
              size: 32.w,
              color: AppThemeLight.instance.theme.colorScheme.onSurface,
            ),
            title: Text(
              LocaleKeys.taskPage_addDescription.tr(),
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppThemeLight.instance.theme.colorScheme.onBackground),
            ),
          );
        });
  }

  @observable
  ObservableList<bool> checkboxValueList = ObservableList.of([]);

  @action
  void onCheckboxChanged(int index, bool value) {
    checkboxValueList[index] = value;
    checkboxValueList = checkboxValueList;
    inspect(checkboxValueList);
  }

  @action
  bool checkboxCase(int index) {
    return checkboxValueList[index];
  }

  @action
  void returnHomePage() {
    navigator.navigateToPageClear(
        path: NavigationConstants.HOME_PAGE_VIEW, object: Text(""));
  }
}
